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
* ~~OK Одноклассники~~ (пока не реализовано)
* ~~Viber~~ (пока не реализовано)
* ~~WhatsApp~~ (пока не реализовано)

Скачиваем файл [sendbot-main.zip](https://codeload.github.com/ProjectSoft-STUDIONIONS/sendbot/zip/refs/heads/main) и устанавливаем через модуль Extras.

Открываем шаблон ресурса, который используется, например, для новостей. Выбираем для него TV параметры imageSoc, photogallery, sendBotOk, sendBotTlg, sendBotVb, sendBotVk, sendBotWa, tags. Сохраняем шаблон.

Открываем плагин EvoSendBot, ставим галочку «Анализировать DocBlock» и сохраняем.   
Далее заполняем конфигурацию плагина. Чтобы получить данные для своих ботов мессенджеров, соцсетей - внимательно изучаем их документацию.

Документация для VK - [в директории плагина](assets/plugins/evosendbot/README.md)