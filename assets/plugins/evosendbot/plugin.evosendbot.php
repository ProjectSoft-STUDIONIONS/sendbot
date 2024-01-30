<?php
if (!defined('MODX_BASE_PATH')) {
    die('What are you doing? Get out of here!');
}
/**
 ** Отправка в телеграм
**/
if(!function_exists('sendBotTelegram')):
	function sendBotTelegram($url, $arrayQuery = array(), $proxy = false){
		$ch = curl_init();
		$optArray = array(
				CURLOPT_URL => $url,
				CURLOPT_RETURNTRANSFER => true
		);
		curl_setopt_array($ch, $optArray);
		// Если для Curl нужен прокси
		if(is_string($proxy)):
			curl_setopt($ch, CURLOPT_PROXY, $proxy);
		endif;
		if(!empty($arrayQuery)):
			curl_setopt($ch, CURLOPT_POSTFIELDS, $arrayQuery);
		endif;
		$result = curl_exec($ch);
		curl_close($ch);
		return $result;
	}
endif;
/**
 ** Загрузка фото в VK
**/
if(!function_exists('curlUploadVkPhoto')):
	function curlUploadVkPhoto($uploadUrl, $image, $proxy = false){
		$curl_file = curl_file_create(MODX_BASE_PATH . $image);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $uploadUrl);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POST, 1);
		// Если для Curl нужен прокси
		if(is_string($proxy)):
			curl_setopt($ch, CURLOPT_PROXY, $proxy);
		endif;
		curl_setopt($ch, CURLOPT_POSTFIELDS, array('photo' => $curl_file));
		$result = curl_exec($ch);
		curl_close($ch);
		return $result;
	}
endif;
/**
 ** Простой Curl запрос
**/
if(!function_exists('getCurlQuery')):
	function getCurlQuery($url, $proxy = false){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		// Если для Curl нужен прокси
		if(is_string($proxy)):
			curl_setopt($ch, CURLOPT_PROXY, $proxy);
		endif;
		$result = curl_exec($ch);
		curl_close($ch);
		return $result;
	}
endif;
/**
 ** Дебаг запись в файл
**/
if(!function_exists('debugEvoSend_Write')):
	function debugEvoSend_Write($file, $data, $debug = false){
		$path = dirname(__FILE__) . DIRECTORY_SEPARATOR;
		if(is_file($path . $file)):
			@unlink($path . $file);
		endif;
		if($debug):
			try {
				@file_put_contents($path . $file, print_r($data, true));
			}catch(Exception $e){
				// Не нужен вывод
			}
		endif;
	}
endif;

$params = $modx->event->params;
$debug = isset($params["debug_event"]) ? filter_var($params["debug_event"], FILTER_VALIDATE_BOOLEAN) : false;
$proxy = isset($params["proxy"]) ? $params["proxy"] : false;

switch ($modx->event->name) {
	case 'OnDocFormSave':
		/**
		 ** Параметры плагина check по сути не нужен, но пока оставим.
		 ** Нужно просто разобраться
		 **
		 ** Параметры TV перечисленные здесь просто обязательны для документа!
		 
		TV параметр imageSoc документа
		    name:            imageSoc
		    caption:         Изображение для страницы
		    type:            image
		    elements:
		    default_text:    assets/templates/projectsoft/images/default.png
		    category:        SEO
		TV параметр sendBotTlg документа
		    name:            sendBotTlg
		    caption:         Отправить в Telegram
		    type:            checkbox
		    elements:        Да==1
		    default_text:    0
		    category:        Api Bot
		TV параметр sendBotVk документа
		    name:        sendBotVk
		    caption:     Отправить в Vkontakte
		    type:        checkbox
		    elements:    Да==1
		    default_text:    0
		    category:    Api Bot
		TV параметр sendBotOk документа
		    name:        sendBotOk
		    caption:     Отправить в Одноклассники
		    type:        checkbox
		    elements:    Да==1
		    default_text:    0
		    category:    Api Bot
		TV параметр sendBotVb документа
		    name:        sendBotVb
		    caption:     Отправить в Viber
		    type:        checkbox
		    elements:    Да==1
		    default_text:    0
		    category:    Api Bot
		TV параметр sendBotOk документа
		    name:        sendBotWa
		    caption:     Отправить в WhatsApp
		    type:        checkbox
		    elements:    Да==1
		    default_text:    0
		    category:    Api Bot
		**/
		// Получить все данные документа
		$dlJson = $modx->runSnippet(
			'DocLister',
			array(
				'documents'=>$params['id'],
				'urlScheme'=> 'full',
				'api'=>1,
				'JSONformat'=>'old',
				'tvPrefix'=>'', 
				'tvList'=>'sendBotTlg,sendBotVk,sendBotOk,sendBotVb,sendBotWa,imageSoc,tags,photogallery'
			)
		);
		$json = array();
		$arr_photos = array();
		if(is_string($dlJson)):
			if($json = json_decode($dlJson, true)):
				// Debug
				debugEvoSend_Write("OnDocFormSave.txt", $json, $debug);
				/**
				 * Сбор данных
				**/
				if(count($json)):
					$json = $json[$params['id']];
					/**
					 * Собираем фотографии из multiTV параметра photogallery
					**/
					if($photos = json_decode($json["photogallery"], true)):
						if(count($photos["fieldValue"])):
							foreach($photos["fieldValue"] as $key => $value):
								$arr_photos[] = $value["image"];
							endforeach;
						endif;
					endif;
					/**
					 * Соберём теги из TV параметра tags
					**/
					$tgs = explode(",", $json["tags"]);
					$tags = array();
					foreach($tgs as $key => $value):
						$val = trim(preg_replace('/\s+/', '', trim($value)));
						if(!empty($val)):
							$tags[] = "#" . $val;
						endif;
					endforeach;
					/**
					 * Соберём нужные данные для отправки
					**/
					$arr = array(
						'type'          => '',
						'title'         => trim(strip_tags(!empty($json["longtitle"]) ? $json["longtitle"] : $json["pagetitle"])),
						'message'       => trim(strip_tags(!empty($json["introtext"]) ? $json["introtext"] : $json["content"])),
						'tags'          => implode(' ', $tags),
						'image'         => $json["imageSoc"],
						'photos'        => $arr_photos,
						'url'           => $modx->makeUrl($params["id"], '', '', 'full')
					);
					/**
					 * Пробемжимся по TV параметрам checkbox отсылки
					**/
					$tableVar = $modx->getFullTableName('site_tmplvars');
					$tableVal = $modx->getFullTableName('site_tmplvar_contentvalues');
					$rs = $modx->db->select('id,name', $tableVar, "name IN ('sendBotTlg','sendBotVk','sendBotOk')");
					while( $row = $modx->db->getRow( $rs ) ):
						/**
						* Обновим состояние chekbox всостояние unchecked
						**/
						$rws = $modx->db->select('*', $tableVal, "contentid='" . $params['id'] . "' and tmplvarid='" . $row['id'] . "'");
						$rows = $modx->db->getRow($rws);
						/**
						 * Если чекбокс был чекнутый
						**/
						if($rows["value"]):
							/**
							 * Установим параметр в состояние unchecked
							**/
							$data = array(
								"value" => 0,
								"tmplvarid" => $row['id']
							);
							$modx->db->update($data, $tableVal, "id='" . $rows["id"] . "'");
							/**
							 * По имени чкбокса определям его тип и что нужно сделать
							**/
							switch($row["name"]){
								case "sendBotTlg":
									// Telegram
									$arr["type"] = "tlg";
									$modx->invokeEvent("OnSendBot", $arr);
									break;
								case "sendBotVk":
									// VK
									$arr["type"] = "vk";
									$modx->invokeEvent("OnSendBot", $arr);
									break;
								case "sendBotOk":
									// OK
									$arr["type"] = "ok";
									$modx->invokeEvent("OnSendBot", $arr);
									break;
								case "sendBotVb":
									// Viber
									$arr["type"] = "vb";
									$modx->invokeEvent("OnSendBot", $arr);
									break;
								case "sendBotWa":
									// WhatsApp
									$arr["type"] = "wa";
									$modx->invokeEvent("OnSendBot", $arr);
									break;
							}
						endif;
					endwhile;
				endif;
			endif;
		endif;
		break;
	case 'OnSendBot':
		// Подготавливаем нужные параметры для отправки
		/**
		 * По типу определяем действие
		**/
		switch($params["type"]){
			case "tlg":
				//Отправляем в Telegram
				$tokenTlg = isset($params["bot_token"]) ? $params["bot_token"] : false;
				$chat_id = isset($params["chat_id"]) ? $params["chat_id"] : false;
				if($tokenTlg !=false || $chat_id != false):
					$url = "https://api.telegram.org/bot" . $tokenTlg . "/sendPhoto?chat_id=" . $chat_id . "&parse_mode=Markdown&disable_web_page_preview=true";
					$pageUrl = $params['url'];
					$title = $params['title'];
					/**
					 * Отправляем только главное изображение для страницы
					**/
					$picture = MODX_BASE_PATH . $params['image'];
					$baseName = pathinfo($picture, PATHINFO_BASENAME);
					$type = mime_content_type($picture);
					$curl_photo = curl_file_create($picture, $type, $baseName);
					/**
					 * Собираем текст сообщения
					 * К тексту сообщения прибавим теги для сообщения
					**/
					$tags = !empty($params['tags']) ? $params['tags'] . PHP_EOL . PHP_EOL : "";
					$message = "*" . $title . "*" . PHP_EOL . PHP_EOL . $params['message'] . PHP_EOL . PHP_EOL . $tags . $pageUrl;
					/**
					 * Собираем параметры для отправки
					**/
					$arrayQuery = array(
						'chat_id' => $chanel_id,
						'protect_content' => true,
						'caption' => $message,
						'photo' => $curl_photo
					);
					// Debug
					debugEvoSend_Write("OnSendBot_Telegram.txt", $arrayQuery, $debug);
					/**
					 * Отправляем в Telegram
					**/
					$result = sendBotTelegram($url, $arrayQuery, $proxy);
					// Debug
					debugEvoSend_Write("OnSendBot_Telegram_Result.txt", $result);
				endif;
				break;
			case "vk":
				//Отправляем в VK
				$group_id		= isset($params["group_id"]) ? $params["group_id"] : false;
				$access_token	= isset($params["access_token"]) ? $params["access_token"] : false;
				$v				= isset($params["version_vk"]) ? $params["version_vk"] : "5.154";
				if($group_id != false || $access_token != false):
					$link = $params['url'];
					// Не больше пяти фото!!!
					$images = array_slice($params['photos'], 0, 5);
					$photos = array();
					if(count($images)):
						try{
							$url = 'https://api.vk.com/method/photos.getWallUploadServer?group_id=' . $group_id . '&access_token=' . $access_token . '&v=' . $v;
							$server = getCurlQuery($url, $proxy);
							if($server):
								if($server = json_decode($server)):
									if(is_object($server->response)):
										if (!empty($server->response->upload_url)):
											foreach($images as $key =>$image):
												/**
												 ** Curl Загружаем фото
												**/
												$upload = curlUploadVkPhoto($server->response->upload_url, $image, $proxy);
												// Debug
												debugEvoSend_Write("OnSendBot_VK_upload_$key.txt", $upload, $debug);
												/**
												 * Если загрузка произошла
												**/
												if($upload = json_decode($upload)):
													/**
													 * Если есть данные о загруженнойфотографии
													**/
													if (!empty($upload->server)):
														// Сохранение фото в группе.
														/**
														 * Если загрузка удачная - сохраняем в группе методом photos.saveWallPhoto
														**/
														try {
															$url = 'https://api.vk.com/method/photos.saveWallPhoto?group_id=' . $group_id . '&server=' . $upload->server . '&photo=' . stripslashes($upload->photo) . '&hash=' . $upload->hash . '&access_token=' . $access_token . '&v=5.154';
															$save = getCurlQuery($url, $proxy);
															// Debug
															debugEvoSend_Write("OnSendBot_VK_saveWallPhoto.txt", $save, $debug);
															/**
															 * Если сохранение удачное и присутствует свойство response
															 * сохраняем в массив имя загруженной фотографии
															**/
															if($save = json_decode($save)):
																if(is_array($save->response)):
																	if (!empty($save->response[0]->id)):
																		$photos[] = 'photo' . $save->response[0]->owner_id . '_' . $save->response[0]->id;
																	endif;
																endif;
															endif;
														}catch(Exception $e) {
															// Если была ошибка - Ничего не выводим
														}
													endif;
												endif;
											endforeach;
										endif;
									endif;
								endif;
							endif;
						}catch(Exception $e){
							// Если была ошибка - Ничего не выводим
						}
					endif;
					/**
					 * Добавим к массиву с фотографией ссылку на страницу сайта
					**/
					$photos[] = $link;
					/**
					 * Собираем текст сообщения
					 * К тексту сообщения прибавим теги для сообщения
					**/
					$tags = !empty($params['tags']) ? PHP_EOL . PHP_EOL . $params['tags'] : "";
					$message = $params['message'] . $tags;
					/**
					 * Для параметра запроса attachments объеденим имена фотографий и ссылки на новость в строку
					**/
					$photos = implode(',', $photos);
					$post_params = array(
						'v'            => '5.154',
						'access_token' => $access_token,
						'owner_id'     => '-' . $group_id, 
						'from_group'   => '1', 
						'message'      => $message,
						'attachments'  => $photos
					);
					/**
					 * Отправляем публикацию новости в VK
					**/
					try {
						$url = 'https://api.vk.com/method/wall.post?' . http_build_query($post_params);
						$post_request = getCurlQuery($url, $proxy);
						// Debug
						debugEvoSend_Write("OnSendBot_VK_wall.txt", $post_request, $debug);
					}catch(Exception $e) {
						// Если была ошибка - Ничего не выводим
					}
					// Debug
					debugEvoSend_Write("OnSendBot_VK.txt", $post_params, $debug);
				endif;
				break;
			case "ok":
				//Отправляем в OK
				// С группами в ОК ни всё понятно. Очень скудное API.
				break;
			case "vb":
				//Отправляем в Viber
				// Реализовываем...
				break;
			case "wa":
				//Отправляем в WhatsApp
				// Реализовываем...
				break;
			case "form":
				// Вопросы с формы обратной связи
				/**
				 ** Перенести сюда или отставить?
				**/
				break;
		}
		break;
}



/**
 * 
 * README.md
 * 
 * 
 * # Подключение к VK
 * 
 * Для начала вы должны быть авторизированы в VK и являться администратором группы или страницы. Далее нужно создать приложение.
 * 
 * ## Создание приложения
 * Создаем **Standalone-приложение** на https://vk.com/apps?act=manage
 * 
 * ![Создаем Standalone-приложение](0001.png)
 * 
 * В настройках приложения включаем **Open API**, указываем адрес своего сайта и базовый домен, там же находится **ID приложения** и **защищенный ключ**.
 * 
 * ![включаем Open API](0002.png)
 * 
 * ## Получаем access token
 * ### Этап 1
 * 
 * Нужно получить права и секретный код. Формируем URL подставляя данные своего приложения и вставляем его в браузер.
 * ```
 * https://oauth.vk.com/authorize?client_id=ID_ПРИЛОЖЕНИЯ&display=page&redirect_uri=https://api.vk.com/blank.html&scope=offline,wall,photos&response_type=code
 * ```
 * ## В ответе получаем в секретный код.
 * ### Этап 2
 * 
 * Запрашиваем **access_token**. Формируем новый URL, подставив **client_id**, **client_secret** и полученный выше код. В ответе получаем **access_token**.
 * ```
 * https://oauth.vk.com/access_token?client_id=ID_ПРИЛОЖЕНИЯ&client_secret=ЗАЩИЩЕННЫЙ_КЛЮЧ&redirect_uri=https://api.vk.com/blank.html&code=СЕКРЕТНЫЙ_КОД
 * ```
 * Далее используем полученный токен в запросах к VK API
 * 
 */