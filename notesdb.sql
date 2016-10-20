SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1476797165),
('m130524_201442_init', 1476797171),
('m150127_040544_add_attachments', 1476949364);

CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `notes` (`id`, `title`, `text`, `date`) VALUES
(1, 'Исправление бага с изображениями на zhytlo.in.ua', 'в файле manager/media/browser/mcpuk/lib/helper_httpCache.php\r\n\r\nв функцию static function content($content, $mtime, $type=null, $expire=null, array $headers=null, $checkMTime=true)\r\n\r\nдобавить функцию очистки буффера\r\nob_end_clean();\r\n\r\nдолжно получится вот так:\r\n   static function content($content, $mtime, $type=null, $expire=null, array $headers=null, $checkMTime=true) {\r\n	if ($checkMTime) self::checkMTime($mtime);\r\n        if ($type === null) $type = self::DEFAULT_TYPE;\r\n        if ($expire === null) $expire = self::DEFAULT_EXPIRE;\r\n        $size = strlen($content);\r\n        $expires = gmdate("D, d M Y H:i:s", time() + $expire) . " GMT";\r\n	ob_end_clean();\r\n        header("Content-Type: $type");\r\n        header("Expires: $expires");\r\n        header("Cache-Control: max-age=$expire");\r\n        header("Pragma: !invalid");\r\n        header("Content-Length: $size");\r\n        if ($headers !== null) foreach ($headers as $header) header($header);\r\n        echo $content;\r\n    }', 1476969252),
(2, 'Грозный', '', 1476949764);

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'yWwCDHLjfmqqL6l4ATBSgMKbq8iNFCQz', '$2y$13$DUf9n37ZTU0ymhDxoRpzYOmpKcVz0HdiKaCf8k5ovAbMo7dIyOIS.', NULL, 'mc-shura@yandex.ua', 10, 1476797229, 1476797229);

CREATE TABLE IF NOT EXISTS `yii_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `itemId` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_model` (`model`),
  KEY `file_item_id` (`itemId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `yii_attachments` (`id`, `name`, `model`, `itemId`, `hash`, `size`, `type`, `mime`) VALUES
(1, 'ANGER_Fullbody_Render', 'Notes', 2, '8e69a0b1b4833178953e43fba17180ad', 1003504, 'png', 'image/png');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
