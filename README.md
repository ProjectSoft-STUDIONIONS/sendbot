---
Title: EvoSendBot Evolution CMS

Author: ProjectSoft

Date: 22.10.2023 21:00

Comment: Плагин и TV параметры для автопостинга новостей, ресурсов в соц. сети, мессенджеры
---
# EvoSendBot

Плагин и TV параметры на Evolution CMS для автопостинга новостей, ресурсов в соц. сети, мессенджеры

Требует обязательного установленного multiTV
* Telegram
* VKontakte
* ~~OK Одноклассники~~ (не реализовано)
* ~~Viber~~ (не реализовано)
* ~~WhatsApp~~ (не реализовано)

Скачиваем файл [sendbot.zip](https://github.com/ProjectSoft-STUDIONIONS/sendbot/raw/main/sendbot.zip) и устанавливаем через модуль Extras.

Открываем шаблон ресурса, который используется, например, для новостей. Выбираем для него TV параметры imageSoc, photogallery, sendBotOk, sendBotTlg, sendBotVb, sendBotVk, sendBotWa, tags. Сохраняем шаблон.

Открываем плагин EvoSendBot, ставим галочку «Анализировать DocBlock» и сохраняем.   
Далее заполняем конфигурацию плагина. Чтобы получить данные для своих ботов мессенджеров, соцсетей - внимательно изучаем их документацию.