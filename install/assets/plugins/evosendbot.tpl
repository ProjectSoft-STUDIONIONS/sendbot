//<?php
/**
 * EvoSendBot
 *
 * <strong>0.1.0</strong> EvoSendBot плагин автопостинга в Telegram, VK, OK
 *
 * @category    plugin
 * @internal    @events OnDocFormSave,OnSendBot
 * @internal    @modx_category Api Bot
 * @internal    @properties &check=ID TV параметров chekbox отвечающие за отправку сообщений в группы;text;13,14,15 &bot_token=Токен Бота Telegram;text;fdsgssrgssrggsrgsg &chat_id=ID канала или пользователя  Telegram;text;323423423 &group_id=ID группы ВК;text;34325235325 &access_token=Токен доступа приложения VK;text;asgdnfdbFBFbFB &version_vk=API версия VK;text;5.154 &proxy=Proxy;text;10.0.63.52:3128;Если существует прокси для сервера &debug_event=Дебаг плагина;list;true,false;false;Если существует прокси для сервера
 * @internal    @disabled 0
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
	$sql = "INSERT INTO " . $modx->getFullTableName('system_eventnames') . " VALUES (null, 'OnSendBot', '7', 'Api Bot')";
	$rt = $modx->db->query($sql);
	$lid = $modx->db->getInsertId();
} catch(Exception $e){
	// Ничего не выводим
}
require MODX_BASE_PATH.'assets/plugins/evosendbot/plugin.evosendbot.php';

