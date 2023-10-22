//<?php
/**
 * EvoSendBot
 *
 * EvoSendBot плагин автопостинга в Telegram, VK, OK
 *
 * @category    plugin
 * @author      ProjectSoft
 * @version     0.1.0
 * @internal    @events OnSendBot,OnDocFormSave
 * @internal    @properties &check=ID TV параметров chekbox отвечающие за отправку сообщений в группы;text;; &bot_token=Токен Бота Telegram;text;; &chat_id=ID канала или пользователя  Telegram;text;; &group_id=ID группы ВК;text;; &access_token=Токен доступа приложения VK;text;; &version_vk=API версия VK;text;5.154;5.154
 * @internal    @modx_category Api Bot
 * @internal    @installset base
 */
/**
 * EvoSendBot
 *
 * EvoSendBot плагин автопостинга в Telegram, VK, OK
 *
 * @category    plugin
 * @author      ProjectSoft
 * @version     0.1.0
 * @internal    @events OnSendBot,OnDocFormSave
 * @internal    @properties &check=ID TV параметров chekbox отвечающие за отправку сообщений в группы;text;; &bot_token=Токен Бота Telegram;text;; &chat_id=ID канала или пользователя  Telegram;text;; &group_id=ID группы ВК;text;; &access_token=Токен доступа приложения VK;text;; &version_vk=API версия VK;text;5.154;5.154
 * @internal    @modx_category Api Bot
 * @internal    @installset base
 */
try {
	$sql = "";
} catch(Exception $e){
	// Ничего не выводим
}
require MODX_BASE_PATH.'assets/plugins/evosendbot/plugin.evosendbot.php';
