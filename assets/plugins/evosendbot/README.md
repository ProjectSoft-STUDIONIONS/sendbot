 # Подключение к VK
 
 Для начала вы должны быть авторизированы в VK и являться администратором группы или страницы. Далее нужно создать приложение.
 
 ## Создание приложения
 Создаем **Standalone-приложение** на https://vk.com/apps?act=manage
 
 ![Создаем Standalone-приложение](0001.png)
 
 В настройках приложения включаем **Open API**, указываем адрес своего сайта и базовый домен, там же находится **ID приложения** и **защищенный ключ**.
 
 ![включаем Open API](0002.png)
 
 ## Получаем access token
 ### Этап 1
 
 Нужно получить права и секретный код. Формируем URL подставляя данные своего приложения и вставляем его в браузер.
 ```
 https://oauth.vk.com/authorize?client_id=ID_ПРИЛОЖЕНИЯ&display=page&redirect_uri=https://api.vk.com/blank.html&scope=offline,wall,photos&response_type=code
 ```
 ## В ответе получаем в секретный код.
 ### Этап 2
 
 Запрашиваем **access_token**. Формируем новый URL, подставив **client_id**, **client_secret** и полученный выше код. В ответе получаем **access_token**.
 ```
 https://oauth.vk.com/access_token?client_id=ID_ПРИЛОЖЕНИЯ&client_secret=ЗАЩИЩЕННЫЙ_КЛЮЧ&redirect_uri=https://api.vk.com/blank.html&code=СЕКРЕТНЫЙ_КОД
 ```
 Далее используем полученный токен в запросах к VK API