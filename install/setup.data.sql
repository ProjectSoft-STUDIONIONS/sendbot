#
# My Evolution Site Database Dump
# MODX Version:1.4.32
# 
# Host: 
# Generation Time: 22-10-2023 03:30:51
# Server version: 5.5.5-10.3.22-MariaDB
# PHP Version: 7.4.5
# Database: `lsd_evo`
# Description: 
#

# --------------------------------------------------------

#
# Table structure for table `{PREFIX}system_eventnames`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `{PREFIX}system_eventnames`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `{PREFIX}system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COMMENT='System Event Names.';

#
# Dumping data for table `{PREFIX}system_eventnames`
#

INSERT INTO `{PREFIX}system_eventnames` VALUES ('1','OnDocPublished','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('2','OnDocUnPublished','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('3','OnWebPagePrerender','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('4','OnWebLogin','3','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('5','OnBeforeWebLogout','3','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('6','OnWebLogout','3','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('7','OnWebSaveUser','3','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('8','OnWebDeleteUser','3','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('9','OnWebChangePassword','3','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('10','OnWebCreateGroup','3','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('11','OnManagerLogin','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('12','OnBeforeManagerLogout','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('13','OnManagerLogout','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('14','OnManagerSaveUser','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('15','OnManagerDeleteUser','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('16','OnManagerChangePassword','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('17','OnManagerCreateGroup','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('18','OnBeforeCacheUpdate','4','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('19','OnCacheUpdate','4','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('20','OnMakePageCacheKey','4','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('21','OnLoadWebPageCache','4','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('22','OnBeforeSaveWebPageCache','4','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('23','OnChunkFormPrerender','1','Chunks');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('24','OnChunkFormRender','1','Chunks');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('25','OnBeforeChunkFormSave','1','Chunks');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('26','OnChunkFormSave','1','Chunks');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('27','OnBeforeChunkFormDelete','1','Chunks');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('28','OnChunkFormDelete','1','Chunks');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('29','OnDocFormPrerender','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('30','OnDocFormRender','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('31','OnBeforeDocFormSave','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('32','OnDocFormSave','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('33','OnBeforeDocFormDelete','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('34','OnDocFormDelete','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('35','OnDocFormUnDelete','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('36','onBeforeMoveDocument','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('37','onAfterMoveDocument','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('38','OnPluginFormPrerender','1','Plugins');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('39','OnPluginFormRender','1','Plugins');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('40','OnBeforePluginFormSave','1','Plugins');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('41','OnPluginFormSave','1','Plugins');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('42','OnBeforePluginFormDelete','1','Plugins');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('43','OnPluginFormDelete','1','Plugins');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('44','OnSnipFormPrerender','1','Snippets');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('45','OnSnipFormRender','1','Snippets');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('46','OnBeforeSnipFormSave','1','Snippets');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('47','OnSnipFormSave','1','Snippets');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('48','OnBeforeSnipFormDelete','1','Snippets');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('49','OnSnipFormDelete','1','Snippets');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('50','OnTempFormPrerender','1','Templates');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('51','OnTempFormRender','1','Templates');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('52','OnBeforeTempFormSave','1','Templates');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('53','OnTempFormSave','1','Templates');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('54','OnBeforeTempFormDelete','1','Templates');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('55','OnTempFormDelete','1','Templates');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('56','OnTVFormPrerender','1','Template Variables');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('57','OnTVFormRender','1','Template Variables');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('58','OnBeforeTVFormSave','1','Template Variables');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('59','OnTVFormSave','1','Template Variables');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('60','OnBeforeTVFormDelete','1','Template Variables');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('61','OnTVFormDelete','1','Template Variables');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('62','OnUserFormPrerender','1','Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('63','OnUserFormRender','1','Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('64','OnBeforeUserFormSave','1','Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('65','OnUserFormSave','1','Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('66','OnBeforeUserFormDelete','1','Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('67','OnUserFormDelete','1','Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('68','OnWUsrFormPrerender','1','Web Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('69','OnWUsrFormRender','1','Web Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('70','OnBeforeWUsrFormSave','1','Web Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('71','OnWUsrFormSave','1','Web Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('72','OnBeforeWUsrFormDelete','1','Web Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('73','OnWUsrFormDelete','1','Web Users');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('74','OnSiteRefresh','1','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('75','OnFileManagerUpload','1','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('76','OnModFormPrerender','1','Modules');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('77','OnModFormRender','1','Modules');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('78','OnBeforeModFormDelete','1','Modules');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('79','OnModFormDelete','1','Modules');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('80','OnBeforeModFormSave','1','Modules');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('81','OnModFormSave','1','Modules');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('82','OnBeforeWebLogin','3','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('83','OnWebAuthentication','3','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('84','OnBeforeManagerLogin','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('85','OnManagerAuthentication','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('86','OnLoadSettings','1','System Settings');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('87','OnSiteSettingsRender','1','System Settings');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('88','OnFriendlyURLSettingsRender','1','System Settings');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('89','OnUserSettingsRender','1','System Settings');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('90','OnInterfaceSettingsRender','1','System Settings');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('91','OnSecuritySettingsRender','1','System Settings');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('92','OnFileManagerSettingsRender','1','System Settings');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('93','OnMiscSettingsRender','1','System Settings');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('94','OnRichTextEditorRegister','1','RichText Editor');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('95','OnRichTextEditorInit','1','RichText Editor');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('96','OnManagerPageInit','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('97','OnWebPageInit','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('98','OnLoadDocumentObject','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('99','OnBeforeLoadDocumentObject','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('100','OnAfterLoadDocumentObject','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('101','OnLoadWebDocument','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('102','OnParseDocument','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('103','OnParseProperties','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('104','OnBeforeParseParams','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('105','OnManagerLoginFormRender','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('106','OnWebPageComplete','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('107','OnLogPageHit','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('108','OnBeforeManagerPageInit','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('109','OnBeforeEmptyTrash','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('110','OnEmptyTrash','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('111','OnManagerLoginFormPrerender','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('112','OnStripAlias','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('113','OnMakeDocUrl','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('114','OnBeforeLoadExtension','5','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('115','OnCreateDocGroup','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('116','OnManagerWelcomePrerender','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('117','OnManagerWelcomeHome','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('118','OnManagerWelcomeRender','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('119','OnBeforeDocDuplicate','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('120','OnDocDuplicate','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('121','OnManagerMainFrameHeaderHTMLBlock','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('122','OnManagerPreFrameLoader','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('123','OnManagerFrameLoader','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('124','OnManagerTreeInit','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('125','OnManagerTreePrerender','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('126','OnManagerTreeRender','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('127','OnManagerNodePrerender','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('128','OnManagerNodeRender','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('129','OnManagerMenuPrerender','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('130','OnManagerTopPrerender','2','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('131','OnDocFormTemplateRender','1','Documents');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('132','OnBeforeMinifyCss','1','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('133','OnPageUnauthorized','1','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('134','OnPageNotFound','1','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('135','OnFileBrowserUpload','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('136','OnBeforeFileBrowserUpload','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('137','OnFileBrowserDelete','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('138','OnBeforeFileBrowserDelete','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('139','OnFileBrowserInit','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('140','OnFileBrowserMove','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('141','OnBeforeFileBrowserMove','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('142','OnFileBrowserCopy','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('143','OnBeforeFileBrowserCopy','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('144','OnBeforeFileBrowserRename','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('145','OnFileBrowserRename','1','File Browser Events');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('146','OnLogEvent','1','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('147','OnBeforeMailSend','1','');

INSERT INTO `{PREFIX}system_eventnames` VALUES ('148','OnSendBot','7','Api Bot');
