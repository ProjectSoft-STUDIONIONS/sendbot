const fs = require('fs'),
	path = require('path'),
	showdown  = require('showdown'),
	rmp = path.normalize(__dirname + '/install/assets'),
	pkg = require(path.normalize(__dirname + '/package.json'));
const version = pkg.version,
	evoname = pkg.evoname,
	category = "API BOT",
	tvsChecks = [
		{
			"fname"          : "sendbottlg.tpl",
			"category"       : "tv",
			"name"           : "sendBotTlg",
			"caption"        : "Отправить в Telegram",
			"input_type"     : "checkbox",
			"modx_category"  : category,
			"input_default"  : "0",
			"input_options"  : "Да==1"
		},
		{
			"fname"          : "sendbotvk.tpl",
			"category"       : "tv",
			"name"           : "sendBotVk",
			"caption"        : "Отправить в ВКонтакте",
			"input_type"     : "checkbox",
			"modx_category"  : category,
			"input_default"  : "0",
			"input_options"  : "Да==1"
		},
		{
			"fname"          : "sendbotok.tpl",
			"category"       : "tv",
			"name"           : "sendBotOk",
			"caption"        : "Отправить в Одноклассники",
			"input_type"     : "checkbox",
			"modx_category"  : category,
			"input_default"  : "0",
			"input_options"  : "Да==1"
		},
		{
			"fname"          : "sendbotvb.tpl",
			"category"       : "tv",
			"name"           : "sendBotVb",
			"caption"        : "Отправить в Viber",
			"input_type"     : "checkbox",
			"modx_category"  : category,
			"input_default"  : "0",
			"input_options"  : "Да==1"
		},
		{
			"fname"          : "sendbotwa.tpl",
			"category"       : "tv",
			"name"           : "sendBotWa",
			"caption"        : "Отправить в WhatsApp",
			"input_type"     : "checkbox",
			"modx_category"  : category,
			"input_default"  : "0",
			"input_options"  : "Да==1"
		},
		{
			"fname"          : "tags.tpl",
			"category"       : "tv",
			"name"           : "tags",
			"caption"        : "Теги для соц. Сетей",
			"input_type"     : "text",
			"modx_category"  : category,
			"input_default"  : "",
			"input_options"  : ""
		},
		{
			"fname"          : "photogallery.tpl",
			"category"       : "tv",
			"name"           : "photogallery",
			"caption"        : "Фотогалерея",
			"input_type"     : "custom_tv:multitv",
			"modx_category"  : "Фотогалерея",
			"input_default"  : "[]",
			"input_options"  : ""
		},
		{
			"fname"          : "imagesoc.tpl",
			"category"       : "tv",
			"name"           : "imageSoc",
			"caption"        : "Изображение для страницы",
			"input_type"     : "image",
			"modx_category"  : "SEO",
			"input_default"  : "assets/images/evo-logo.png",
			"input_options"  : ""
		}
	],
	plugins = [
		{
			"fname"    : "evosendbot.tpl",
			"docblock" : `
/**
 * ${evoname}
 *
 * ${evoname} плагин автопостинга в Telegram, VK, OK, Viber, WhatsApp
 *
 * @category    plugin
 * @author      ProjectSoft
 * @version     ${version}
 * @internal    @events OnDocFormSave,OnSendBot
 * @internal    @modx_category ${category}
 * @internal    @properties &bot_token=Токен Бота Telegram;text;;;Токен Бота Telegram &chat_id=ID канала или пользователя  Telegram;text;;;ID канала или пользователя  Telegram &group_id=ID группы ВК;text;;;ID группы ВК &access_token=Токен доступа приложения VK;text;;;Токен доступа приложения VK &version_vk=API версия VK;text;5.154;;На момент разработки API версия VK 5.154 &proxy=Прокси;text;;;Если требуется прокси подключение. Например 10.0.63.52:3128 &debug_event=Дебаг плагина;list;yes,no;no;;Включение дебаг плагина. Дебаг файлы сохраняется в директории плагина
 * @internal    @disabled 0
 * @internal    @installset base
 */`,
 			"required" : `require MODX_BASE_PATH.'assets/plugins/evosendbot/plugin.evosendbot.php';\n`
		}
	];

/**
 * Чтение README
 */
const readMD = async function (file) {
	return new Promise(function(resolve, reject) {
		let text = "";
		file = path.normalize(file);
		fs.stat(file, (err) => {
			if(!err){
				text = fs.readFileSync(file, {encoding: 'utf8'});
				resolve(text);
			}else{
				resolve(text);
			}
		});
	});
}
/**
 * Сборка архива
 */
const ZipFolder = async function() {
	const zip = new require('node-zip')(),
		install = path.normalize(`${pkg.name}/install`),
		assets  = path.normalize(`${pkg.name}/assets`);

	let sql = zip.folder(install);
	sql.file('setup.data.sql', fs.readFileSync(path.normalize(`${__dirname}/install/setup.data.sql`), {encoding: 'utf8'}));
	
	let tvs = zip.folder(`${install}/assets/tvs`);
	tvsChecks.forEach((a, b, c) => {
		tvs.file(a.fname, fs.readFileSync(path.normalize(`${rmp}/tvs/${a.fname}`), {encoding: 'utf8'}));
	});
	let plg = zip.folder(`${install}/assets/plugins`);
	plugins.forEach((a, b, c) => {
		let filename = a.fname,
			template = `//<?php${a.docblock}${a.docblock}\n${a.required}`;
		plg.file(a.fname, fs.readFileSync(path.normalize(`${rmp}/plugins/${a.fname}`), {encoding: 'utf8'}));
	});
	// Плагин
	let php_plg = zip.folder(`${assets}/plugins/evosendbot`);
	php_plg.file('plugin.evosendbot.php', fs.readFileSync(path.normalize(`${__dirname}/assets/plugins/evosendbot/plugin.evosendbot.php`), {encoding: 'utf8'}));
	php_plg.file('vk.md', fs.readFileSync(path.normalize(`${__dirname}/assets/plugins/evosendbot/vk.md`), {encoding: 'utf8'}));
	php_plg.file('0001.png', fs.readFileSync(path.normalize(`${__dirname}/assets/plugins/evosendbot/0001.png`)));
	php_plg.file('0002.png', fs.readFileSync(path.normalize(`${__dirname}/assets/plugins/evosendbot/0002.png`)));
	// multiTV photogallery config
	let php_tvs = zip.folder(`${assets}/tvs/multitv/configs`);
	php_tvs.file('photogallery.config.inc.php', fs.readFileSync(path.normalize(`${__dirname}/assets/tvs/multitv/configs/photogallery.config.inc.php`), {encoding: 'utf8'}));
	// pause
	let md = await readMD(path.normalize(`${__dirname}/assets/plugins/evosendbot/vk.md`));
	let converter = new showdown.Converter({
			parseImgDimensions: true,
			tables: true,
			tablesHeaderId: true,
			tasklists: true,
			openLinksInNewWindow: true,
			completeHTMLDocument: true,
			metadata: true
		}),
		formatter = new Intl.DateTimeFormat('ru-RU', { day: '2-digit', month: '2-digit', year: 'numeric' }),
		formattedDate = formatter.format(new Date()),
		meta = `---
title:       Подключение к VK
author:      ProjectSoft
version:     ${version}
web:         https://github.com/ProjectSoft-STUDIONIONS/sendbot
date:        ${formattedDate}
---
`;
		html = "";
	converter.setFlavor('github');
	html = converter.makeHtml(meta + md);
	fs.writeFileSync(path.normalize(`${__dirname}/assets/plugins/evosendbot/vk.html`), html, {encoding: 'utf8'});
	php_plg.file('vk.html', html);
	
	setTimeout(() =>{
		let data = zip.generate({base64:false, compression:'DEFLATE'});
		fs.writeFileSync(`${pkg.name}.zip`, data, 'binary');
		console.log(`> SAVE ${pkg.name}.zip`);
	}, 1000);
};

/**
 * Подготовка к упаковке
 * Пишем шаблоны
 * Упаковываем
 */
try {
	// Удаляем архив
	fs.stat(path.normalize(__dirname + `/${pkg.name}.zip`), (err) => {
		if(!err){
			fs.unlinkSync(path.normalize(__dirname + `/${pkg.name}.zip`));
		}
	});
	fs.access(rmp, (err) => {
		if(!err){
			/**
			 * Удаляем всё в install/assets
			 */
			fs.rmSync(rmp, { recursive: true, force: true });
		}
		/**
		 * Проверяем папку install/assets/plugins
		 */
		fs.access(path.normalize(`${rmp}/plugins`), (error) => {
			if (error && error.code === 'ENOENT') {
				fs.mkdirSync(path.normalize(`${rmp}/plugins`), { recursive: true });
				/**
				 * Пишем плагин в папку install/assets/plugins
				 */
				plugins.forEach((a, b, c) => {
					const filename = a.fname,
						template = `//<?php${a.docblock}${a.docblock}\n${a.required}`;
					fs.writeFileSync(path.normalize(`${rmp}/plugins/${filename}`), template, {encoding: 'utf8'});
				});
			}
			/**
			 * Проверяем папку install/assets/tvs
			 */
			fs.access(path.normalize(`${rmp}/tvs`), (error) => {
				if (error && error.code === 'ENOENT') {
					fs.mkdirSync(path.normalize(`${rmp}/tvs`), { recursive: true });
					/**
					 * Пишем все tv в папку install/assets/tvs
					 */
					tvsChecks.forEach((a, b, c) => {
						const filename = a.fname,
							template = `/**
 * ${a.name}
 *
 * ${a.caption}
 *
 * @name        ${a.name}
 * @category    ${a.category}
 * @internal    @caption ${a.caption}
 * @internal    @input_type ${a.input_type}
 * @internal    @modx_category ${a.modx_category}
 * @internal    @input_default ${a.input_default}
 * @internal    @input_options ${a.input_options}
 */\n`;
				 		fs.writeFileSync(path.normalize(`${rmp}/tvs/${filename}`), template, {encoding: 'utf8'});
					});
					/**
					 * Запускаем сборку архива
					 */
					ZipFolder();
				}
			});
		});
	});
}catch(e){
	console.log('Error folder:', rmp, e);
}