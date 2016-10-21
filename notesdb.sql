-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Час створення: Жов 21 2016 р., 17:52
-- Версія сервера: 5.5.45
-- Версія PHP: 5.4.44

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База даних: `notesdb`
--

-- --------------------------------------------------------

--
-- Структура таблиці `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1476797165),
('m130524_201442_init', 1476797171),
('m150127_040544_add_attachments', 1476949364);

-- --------------------------------------------------------

--
-- Структура таблиці `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп даних таблиці `notes`
--

INSERT INTO `notes` (`id`, `title`, `text`, `date`) VALUES
(1, 'Исправление бага с изображениями', 'Исправление бага с предварительными изображениями в файл-менеджере "mcpuk"\r\nв файле manager/media/browser/mcpuk/lib/helper_httpCache.php\r\n\r\nв функцию \r\nstatic function content($content, $mtime, $type=null, $expire=null, array $headers=null, $checkMTime=true)\r\n\r\nдобавить функцию очистки буффера\r\nob_end_clean();\r\n\r\nдолжно получится вот так:\r\nstatic function content($content, $mtime, $type=null, $expire=null, array $headers=null, $checkMTime=true) {\r\n	if ($checkMTime) self::checkMTime($mtime);\r\n        if ($type === null) $type = self::DEFAULT_TYPE;\r\n        if ($expire === null) $expire = self::DEFAULT_EXPIRE;\r\n        $size = strlen($content);\r\n        $expires = gmdate("D, d M Y H:i:s", time() + $expire) . " GMT";\r\n	ob_end_clean();\r\n        header("Content-Type: $type");\r\n        header("Expires: $expires");\r\n        header("Cache-Control: max-age=$expire");\r\n        header("Pragma: !invalid");\r\n        header("Content-Length: $size");\r\n        if ($headers !== null) foreach ($headers as $header) header($header);\r\n        echo $content;\r\n}\r\n\r\nИсправление бага с отсутствием предварительных изображений в multiTV \r\nПредварительные изображения не показываются изза отсутствия их в папке "assets/.thumbs"\r\n\r\nдля начала нужно закомментировать строчку выделенную красным в файле manager/media/browser/mcpuk/core/autoload.php\r\n\r\nif(!isset($_SESSION[''mgrValidated''])) {\r\n        //die("<b>INCLUDE_ORDERING_ERROR</b><br /><br />Please use the MODX Content Manager instead of accessing this file directly.");\r\n}\r\n\r\n\r\nдалее для пересоздания превьюшек, можно использовать скрипт\r\n\r\n<?php\r\nini_set(''max_execution_time'',''256'');\r\nini_set(''memory_limit'',''512M'');\r\n\r\n$base_dir = ''assets/'';\r\n$images_dir = $base_dir . ''/images'';\r\n$script_url = ''/manager/media/browser/mcpuk/browse.php?type=images&lng=ru&act=chDir'';\r\n$protocol = ''http://'';\r\nif (isset($_SERVER[''HTTPS'']) && $_SERVER[''HTTPS''] != ''off'') {\r\n	$protocol = ''https://'';\r\n} \r\n\r\nfunction showTree($folder, $bdir) {\r\n	$files = scandir($folder);\r\n	foreach($files as $file) {\r\n		if (($file == ''.'') || ($file == ''..'')) continue;\r\n		$f0 = $folder.''/''.$file;\r\n		if (is_dir($f0)) {\r\n			$GLOBALS[''dirs''][] = str_replace($bdir.''/'',"",$f0);\r\n			showTree($f0, $bdir);\r\n		}\r\n	}\r\n}\r\n\r\nshowTree($images_dir, $base_dir);\r\n\r\nforeach ($GLOBALS[''dirs''] as $dir){\r\n	unset($out);\r\n	if( $curl = curl_init() ) {\r\n		curl_setopt($curl, CURLOPT_URL, $protocol.$_SERVER[''HTTP_HOST''].$script_url);\r\n		curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);\r\n		curl_setopt($curl, CURLOPT_POST, true);\r\n		curl_setopt($curl, CURLOPT_POSTFIELDS, "dir=$dir");\r\n		$out = curl_exec($curl);\r\n		if (curl_errno($curl)) {\r\n			$status = " <span style=''color:red;''>ERROR</span>";\r\n		} else {\r\n			$resultStatus = curl_getinfo($curl, CURLINFO_HTTP_CODE);\r\n			if ($resultStatus == 200) {\r\n				$status = " <span style=''color:green;''>OK</span>";\r\n			} else {\r\n				$status = " <span style=''color:red;''>ERROR $resultStatus</span>";\r\n			}\r\n		}\r\n		echo $protocol.$_SERVER[''HTTP_HOST''].$script_url . "?dir=$dir" . $status;\r\n		echo ''<br/>'';\r\n		flush();\r\n		curl_close($curl);\r\n	}\r\n}\r\n?>\r\n\r\nСкрипт должен запускаться из корня сайта\r\nВ переменной $images_dir можно настроить путь к изображениям\r\n\r\nПосле выполнения скрипта, в целях безопасности нужно снова раскомметировать выленную красным строчку', 1477039629),
(2, 'Грозный', '', 1476949764),
(6, 'Заметка от 2016.10.20 17:59', 'опааа', 1476975566),
(7, 'Информация о Хостинге mgcard.pp.ua', 'IP-адрес сервера : 91.231.84.141\r\nПанель управления\r\n\r\nURL : https://91.231.84.141:1500/ispmgr\r\nПользователь : user1415\r\nПароль : H3JI33k3kI3JKIJ+\r\n\r\nFTP сервер : 91.231.84.141\r\nFTP пользователь : user1415\r\nFTP пароль : H3JI33k3kI3JKIJ+\r\n\r\nMySQL:\r\nuser1415_ultra3\r\nG5y4V8y8', 1477034653);

-- --------------------------------------------------------

--
-- Структура таблиці `user`
--

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

--
-- Дамп даних таблиці `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'yWwCDHLjfmqqL6l4ATBSgMKbq8iNFCQz', '$2y$13$DUf9n37ZTU0ymhDxoRpzYOmpKcVz0HdiKaCf8k5ovAbMo7dIyOIS.', NULL, 'mc-shura@yandex.ua', 10, 1476797229, 1476797229);

-- --------------------------------------------------------

--
-- Структура таблиці `yii_attachments`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `yii_attachments`
--

INSERT INTO `yii_attachments` (`id`, `name`, `model`, `itemId`, `hash`, `size`, `type`, `mime`) VALUES
(1, 'ANGER_Fullbody_Render', 'Notes', 2, '8e69a0b1b4833178953e43fba17180ad', 1003504, 'png', 'image/png');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
