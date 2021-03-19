-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 19, 2021 at 08:07 PM
-- Server version: 10.2.37-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oauthv2`
--
CREATE DATABASE IF NOT EXISTS `oauthv2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `oauthv2`;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_codes`
--

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_jwt`
--

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `scope` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_users`
--

CREATE TABLE `oauth_users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_jwt`
--
ALTER TABLE `oauth_jwt`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `oauth_users`
--
ALTER TABLE `oauth_users`
  ADD PRIMARY KEY (`username`);
--
-- Database: `ozveri`
--
CREATE DATABASE IF NOT EXISTS `ozveri` DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci;
USE `ozveri`;

-- --------------------------------------------------------

--
-- Table structure for table `kategoriler`
--

CREATE TABLE `kategoriler` (
  `id` int(11) NOT NULL,
  `ka_ad` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `ka_tip` tinyint(4) NOT NULL,
  `ka_url` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ka_ref` smallint(6) NOT NULL DEFAULT 0,
  `ka_durum` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `kategoriler`
--

INSERT INTO `kategoriler` (`id`, `ka_ad`, `ka_tip`, `ka_url`, `ka_ref`, `ka_durum`) VALUES
(1, 'ANASAYFA', 1, NULL, 0, 1),
(2, 'KURUMSAL', 1, NULL, 0, 1),
(3, 'ÜRÜN GURUPLARIMIZ', 1, NULL, 0, 1),
(4, 'ARAÇ ÜSTÜ YAPILAR', 1, NULL, 0, 1),
(5, 'REFERANSLARIMIZ', 1, NULL, 0, 1),
(6, 'İLETİŞİM', 1, NULL, 0, 1),
(7, 'HAKKIMIZDA', 1, NULL, 2, 1),
(8, 'VİZYON & MİSYON', 1, NULL, 2, 1),
(9, 'ATIK TOPLAMA MERKEZİ', 1, NULL, 3, 1),
(10, 'AYAKLI KÜLLÜK', 1, NULL, 3, 1),
(11, 'İÇ MEKAN ÇÖP KOVALARI', 1, NULL, 3, 1),
(12, 'PET ŞİŞE GERİ DÖNÜŞÜM SEPETİ', 1, NULL, 3, 1),
(13, 'SABİT KORUGANLAR', 1, NULL, 3, 1),
(14, 'YER ALTI ÇÖP KONTEYNERLARI', 1, NULL, 3, 1),
(15, 'SIFIR ATIK ÜNİTELERİ', 1, NULL, 3, 1),
(16, 'DAMPERLER', 1, NULL, 4, 1),
(17, 'TREYLER DORSE', 1, NULL, 4, 1),
(18, 'KÜÇÜK DAMPERLER', 1, NULL, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `koordinatlar`
--

CREATE TABLE `koordinatlar` (
  `id` int(11) NOT NULL,
  `hash` text COLLATE utf8_turkish_ci NOT NULL,
  `latitude` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `longitude` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `islem_zamani` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `koordinatlar`
--

INSERT INTO `koordinatlar` (`id`, `hash`, `latitude`, `longitude`, `active`, `islem_zamani`) VALUES
(92, 'f90415ed3e3546a23241f5d3ec417e18', '37.4219983', '-122.084', 1, '2021-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `personeller`
--

CREATE TABLE `personeller` (
  `id` int(11) NOT NULL,
  `ad_soyad` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_adi` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `parola` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `hash` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `personeller`
--

INSERT INTO `personeller` (`id`, `ad_soyad`, `kullanici_adi`, `parola`, `hash`) VALUES
(1, 'Mehmet TOKMAK', 'm', '1881', 'f90415ed3e3546a23241f5d3ec417e18'),
(2, 'Koray Orhan', 'kryorhan34@gmail.com', 'K1*orhan', '49e108eb1f5be9276d00c9be280680ab');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `koordinatlar`
--
ALTER TABLE `koordinatlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personeller`
--
ALTER TABLE `personeller`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `koordinatlar`
--
ALTER TABLE `koordinatlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `personeller`
--
ALTER TABLE `personeller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `postfix`
--
CREATE DATABASE IF NOT EXISTS `postfix` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `postfix`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Admins';

-- --------------------------------------------------------

--
-- Table structure for table `alias`
--

CREATE TABLE `alias` (
  `address` varchar(255) NOT NULL,
  `goto` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Aliases';

-- --------------------------------------------------------

--
-- Table structure for table `alias_domain`
--

CREATE TABLE `alias_domain` (
  `alias_domain` varchar(255) NOT NULL,
  `target_domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Domain Aliases';

-- --------------------------------------------------------

--
-- Table structure for table `alias_pipe`
--

CREATE TABLE `alias_pipe` (
  `address` varchar(255) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `php_path` varchar(255) NOT NULL,
  `script_path` varchar(255) NOT NULL,
  `username` varchar(40) NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Alias Pipe to Script';

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='PostfixAdmin settings';

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'version', '740');

-- --------------------------------------------------------

--
-- Table structure for table `domain`
--

CREATE TABLE `domain` (
  `domain` varchar(255) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `aliases` int(10) NOT NULL DEFAULT 0,
  `mailboxes` int(10) NOT NULL DEFAULT 0,
  `maxquota` bigint(20) NOT NULL DEFAULT 0,
  `quota` bigint(20) NOT NULL DEFAULT 0,
  `transport` varchar(255) NOT NULL,
  `backupmx` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Domains';

-- --------------------------------------------------------

--
-- Table structure for table `domain_admins`
--

CREATE TABLE `domain_admins` (
  `username` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Domain Admins';

-- --------------------------------------------------------

--
-- Table structure for table `fetchmail`
--

CREATE TABLE `fetchmail` (
  `id` int(11) UNSIGNED NOT NULL,
  `mailbox` varchar(255) NOT NULL,
  `src_server` varchar(255) NOT NULL,
  `src_auth` enum('password','kerberos_v5','kerberos','kerberos_v4','gssapi','cram-md5','otp','ntlm','msn','ssh','any') DEFAULT NULL,
  `src_user` varchar(255) NOT NULL,
  `src_password` varchar(255) NOT NULL,
  `src_folder` varchar(255) NOT NULL,
  `poll_time` int(11) UNSIGNED NOT NULL DEFAULT 10,
  `fetchall` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `keep` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `protocol` enum('POP3','IMAP','POP2','ETRN','AUTO') DEFAULT NULL,
  `usessl` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `extra_options` text DEFAULT NULL,
  `returned_text` text DEFAULT NULL,
  `mda` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `timestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `username` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Log';

-- --------------------------------------------------------

--
-- Table structure for table `mailbox`
--

CREATE TABLE `mailbox` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `maildir` varchar(255) NOT NULL,
  `quota` bigint(20) NOT NULL DEFAULT 0,
  `local_part` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `phone` varchar(30) NOT NULL,
  `email_other` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '',
  `token_validity` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Mailboxes';

-- --------------------------------------------------------

--
-- Table structure for table `quota`
--

CREATE TABLE `quota` (
  `username` varchar(255) NOT NULL,
  `path` varchar(100) NOT NULL,
  `current` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quota2`
--

CREATE TABLE `quota2` (
  `username` varchar(100) NOT NULL,
  `bytes` bigint(20) NOT NULL DEFAULT 0,
  `messages` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vacation`
--

CREATE TABLE `vacation` (
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `cache` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `start_date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `send_date_range` int(1) NOT NULL,
  `interval` varchar(60) DEFAULT '*',
  `fromname` varchar(60) DEFAULT NULL,
  `charset` varchar(20) DEFAULT 'iso-8859-1',
  `username` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Postfix Admin - Virtual Vacation';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `alias`
--
ALTER TABLE `alias`
  ADD PRIMARY KEY (`address`),
  ADD KEY `domain` (`domain`);

--
-- Indexes for table `alias_domain`
--
ALTER TABLE `alias_domain`
  ADD PRIMARY KEY (`alias_domain`),
  ADD KEY `active` (`active`),
  ADD KEY `target_domain` (`target_domain`);

--
-- Indexes for table `alias_pipe`
--
ALTER TABLE `alias_pipe`
  ADD PRIMARY KEY (`address`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `domain`
--
ALTER TABLE `domain`
  ADD PRIMARY KEY (`domain`);

--
-- Indexes for table `domain_admins`
--
ALTER TABLE `domain_admins`
  ADD KEY `username` (`username`);

--
-- Indexes for table `fetchmail`
--
ALTER TABLE `fetchmail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `mailbox`
--
ALTER TABLE `mailbox`
  ADD PRIMARY KEY (`username`),
  ADD KEY `domain` (`domain`);

--
-- Indexes for table `quota`
--
ALTER TABLE `quota`
  ADD PRIMARY KEY (`username`,`path`);

--
-- Indexes for table `quota2`
--
ALTER TABLE `quota2`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `vacation`
--
ALTER TABLE `vacation`
  ADD PRIMARY KEY (`email`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fetchmail`
--
ALTER TABLE `fetchmail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `root_cwp`
--
CREATE DATABASE IF NOT EXISTS `root_cwp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `root_cwp`;

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` int(10) NOT NULL,
  `backup_enable` varchar(5) NOT NULL,
  `backup_location` varchar(60) NOT NULL,
  `backup_daily` varchar(5) NOT NULL,
  `backup_weekly` varchar(5) NOT NULL,
  `backup_monthly` varchar(5) NOT NULL,
  `backup_mysql` varchar(5) NOT NULL,
  `backup_vmail` varchar(5) NOT NULL,
  `backup_all` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `backups`
--

INSERT INTO `backups` (`id`, `backup_enable`, `backup_location`, `backup_daily`, `backup_weekly`, `backup_monthly`, `backup_mysql`, `backup_vmail`, `backup_all`) VALUES
(1, 'on', '/backup', 'on', 'on', 'on', 'on', '', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` int(11) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `user` varchar(40) NOT NULL,
  `path` varchar(255) NOT NULL,
  `setup_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nameserver`
--

CREATE TABLE `nameserver` (
  `id` int(40) NOT NULL,
  `ns1_name` varchar(255) NOT NULL,
  `ns1_ip` varchar(50) NOT NULL,
  `ns2_name` varchar(255) NOT NULL,
  `ns2_ip` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nameserver`
--

INSERT INTO `nameserver` (`id`, `ns1_name`, `ns1_ip`, `ns2_name`, `ns2_ip`) VALUES
(1, 'ns1.centos-webpanel.com', '127.0.0.1', 'ns2.centos-webpanel.com', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `shortjob` text NOT NULL,
  `description` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `readed` varchar(255) NOT NULL,
  `completed` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `package_name` varchar(40) NOT NULL,
  `disk_quota` varchar(40) NOT NULL,
  `bandwidth` varchar(40) NOT NULL,
  `ftp_accounts` varchar(40) NOT NULL,
  `email_accounts` varchar(40) NOT NULL,
  `email_lists` varchar(40) NOT NULL,
  `databases` varchar(40) NOT NULL,
  `sub_domains` varchar(40) NOT NULL,
  `parked_domains` varchar(40) NOT NULL,
  `addons_domains` varchar(40) NOT NULL,
  `hourly_emails` varchar(40) NOT NULL,
  `reseller` varchar(40) NOT NULL,
  `accounts` varchar(40) NOT NULL,
  `cgroups` varchar(40) NOT NULL,
  `nproc` varchar(40) NOT NULL DEFAULT '40',
  `apache_nproc` varchar(40) NOT NULL DEFAULT '40',
  `inode` varchar(40) NOT NULL DEFAULT '0',
  `nofile` varchar(40) NOT NULL DEFAULT '150'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `disk_quota`, `bandwidth`, `ftp_accounts`, `email_accounts`, `email_lists`, `databases`, `sub_domains`, `parked_domains`, `addons_domains`, `hourly_emails`, `reseller`, `accounts`, `cgroups`, `nproc`, `apache_nproc`, `inode`, `nofile`) VALUES
(1, 'default', '20000', '100000', '10', '10', '10', '10', '10', '10', '10', '200', '', '', '', '40', '40', '0', '150');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `login_type` varchar(40) NOT NULL,
  `ssh_port` varchar(40) NOT NULL,
  `root_name` varchar(7) NOT NULL,
  `root_email` varchar(255) NOT NULL,
  `apache_port` varchar(5) NOT NULL,
  `homedir` varchar(200) NOT NULL,
  `mysql_pwd` varchar(40) NOT NULL,
  `apache_vhost_tpl` text NOT NULL,
  `apache_sub_vhost_tpl` text NOT NULL,
  `named_tpl` text NOT NULL,
  `dns_zone_tpl` text NOT NULL,
  `shared_ip` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `login_type`, `ssh_port`, `root_name`, `root_email`, `apache_port`, `homedir`, `mysql_pwd`, `apache_vhost_tpl`, `apache_sub_vhost_tpl`, `named_tpl`, `dns_zone_tpl`, `shared_ip`) VALUES
(1, 'ssh', '22', 'root', 'my@email.com', '80', '/home', '', '# vhost_start %domain_name%\r\n<VirtualHost %domain_ip%:%domain_port%>\r\nServerName %domain_name%\r\nServerAlias www.%domain_name%\r\nServerAdmin %admin_email%\r\nDocumentRoot \"%homedir%/%username%/public_html\"\r\nScriptAlias /cgi-bin/ \"%homedir%/%username%/public_html/cgi-bin/\r\n# \r\n# Custom settings are loaded below this line (if any exist)\r\n# Include \"/usr/local/apache/conf/userdata/%username%/%domain_name%/*.conf\r\n\r\n<IfModule mod_suexec.c>\r\n        SuexecUserGroup %username% %username%\r\n</IfModule>\r\n\r\n<IfModule mod_suphp.c>\r\n        suPHP_UserGroup %username% %username%\r\n        suPHP_ConfigPath /home/%username%\r\n</IfModule>\r\n\r\n<Directory \"%homedir%/%username%/public_html\">\r\n        AllowOverride All\r\n</Directory>\r\n\r\n</VirtualHost>\r\n# vhost_end %domain_name%', '# vhost_start %domain_name%\r\n<VirtualHost %domain_ip%:%domain_port%>\r\nServerName %domain_name%\r\nServerAlias www.%domain_name%\r\nServerAdmin %admin_email%\r\nDocumentRoot \"%path%\"\r\nScriptAlias /cgi-bin/ %path%/cgi-bin/\r\n# \r\n# Custom settings are loaded below this line (if any exist)\r\n# Include \"/usr/local/apache/conf/userdata/%username%/%domain_name%/*.conf\r\n\r\n<IfModule mod_suexec.c>\r\n        SuexecUserGroup %username% %username%\r\n</IfModule>\r\n\r\n<IfModule mod_suphp.c>\r\n        suPHP_UserGroup %username% %username%\r\n</IfModule>\r\n\r\n<Directory \"%path%\">\r\n        AllowOverride All\r\n</Directory>\r\n\r\n</VirtualHost>\r\n# vhost_end %domain_name%', '// zone %domain%\r\nzone \"%domain%\" {\r\n                                   type master;\r\n                                        file \"/var/named/%domain%.db\";};\r\n// zone_end %domain%', '; Panel %version%\r\n; Zone file for %domain%\r\n$TTL 14400\r\n%domain%.      86400        IN      SOA     %nameserver%. %rpemail%. (\r\n         2013071600      ; serial, todays date+todays\r\n                86400           ; refresh, seconds\r\n          7200            ; retry, seconds\r\n            3600000         ; expire, seconds\r\n           86400 )         ; minimum, seconds\r\n\r\n%domain%. 86400 IN NS %nameserver%.\r\n%domain%. 86400 IN NS %nameserver2%.\r\n\r\n%domain%. IN A %ip%\r\n\r\nlocalhost.%domain%. IN A 127.0.0.1\r\n\r\n%domain%. IN MX 0 %domain%.\r\n\r\nmail IN CNAME %domain%.\r\nwww IN CNAME %domain%.\r\nftp IN CNAME %domain%.\r\n; Add additional settings below this line', '80.253.244.150');

-- --------------------------------------------------------

--
-- Table structure for table `subdomains`
--

CREATE TABLE `subdomains` (
  `id` int(11) NOT NULL,
  `subdomain` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `user` varchar(40) NOT NULL,
  `path` varchar(255) NOT NULL,
  `setup_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `setup_date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `package` varchar(40) NOT NULL,
  `backup` varchar(40) NOT NULL,
  `reseller` varchar(40) NOT NULL,
  `last_access` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `bandwidth` varchar(40) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `domain`, `ip_address`, `email`, `setup_date`, `package`, `backup`, `reseller`, `last_access`, `bandwidth`) VALUES
(1, 'lamerdia', 'lamerdiary.com', '80.253.244.150', 'sercanyanbuloglu@gmail.com', '2021-03-09 13:52:08', '1', 'on', '', '2000-01-01 00:00:00', '6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nameserver`
--
ALTER TABLE `nameserver`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subdomains`
--
ALTER TABLE `subdomains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subdomains`
--
ALTER TABLE `subdomains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `roundcube`
--
CREATE DATABASE IF NOT EXISTS `roundcube` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `roundcube`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `cache_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_index`
--

CREATE TABLE `cache_index` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `mailbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expires` datetime DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 0,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_messages`
--

CREATE TABLE `cache_messages` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `mailbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `expires` datetime DEFAULT NULL,
  `data` longtext NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_shared`
--

CREATE TABLE `cache_shared` (
  `cache_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_thread`
--

CREATE TABLE `cache_thread` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `mailbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contactgroupmembers`
--

CREATE TABLE `contactgroupmembers` (
  `contactgroup_id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contactgroups`
--

CREATE TABLE `contactgroups` (
  `contactgroup_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(10) UNSIGNED NOT NULL,
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL DEFAULT '',
  `email` text NOT NULL,
  `firstname` varchar(128) NOT NULL DEFAULT '',
  `surname` varchar(128) NOT NULL DEFAULT '',
  `vcard` longtext DEFAULT NULL,
  `words` text DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dictionary`
--

CREATE TABLE `dictionary` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `language` varchar(5) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filestore`
--

CREATE TABLE `filestore` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mtime` int(10) NOT NULL,
  `data` longtext NOT NULL,
  `context` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `identities`
--

CREATE TABLE `identities` (
  `identity_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  `standard` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL,
  `organization` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL,
  `reply-to` varchar(128) NOT NULL DEFAULT '',
  `bcc` varchar(128) NOT NULL DEFAULT '',
  `signature` longtext DEFAULT NULL,
  `html_signature` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `search_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` int(3) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `sess_id` varchar(128) NOT NULL,
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `ip` varchar(40) NOT NULL,
  `vars` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`sess_id`, `changed`, `ip`, `vars`) VALUES
('0fi2tagurd1c3kt8u4a6d46d4b', '2021-03-16 18:19:10', '167.248.133.38', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImVHRDRpbFBVWnp0cUdTdW43Rmt2WFBzaUppVTlNS2FmIjs='),
('17m71huh6itd59v30beb9bjl0s', '2021-03-13 01:30:28', '162.142.125.37', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlBSR1BCb0lMMzhRQmluNEFUN2VsS2ZiVHQxcTRsc2hsIjs='),
('19ubgrhrf4aufcdosf72i86e1s', '2021-03-14 04:34:40', '167.248.133.54', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImpvZjhWZFJ4TWhvMk5wQUZFdXF2dTR5MGppSHNVSExkIjs='),
('1ii1ud7hvhlaqvj8e12odd1pg3', '2021-03-16 17:58:11', '162.142.125.39', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImlZUlBFVnNxWDlyMjJwc1Riejl3M1pWUW5ESHByY054Ijs='),
('1mstjao5djhpd4iugvtij618l8', '2021-03-16 20:21:17', '74.120.14.38', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IndhUGZHUTlJcEloelF0RHJKNGw4YW8xRU1LbjlUVDBJIjs='),
('2hspg2l42ecflsg11nr7g2i01l', '2021-03-18 09:14:09', '150.109.234.173', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IjZ3Z2hNaXFyQVRFeVBBdTJHQTRJQ0R6NURleUVZR3NWIjs='),
('318ufka7g6453hnrelcajqu7o2', '2021-03-15 04:36:30', '23.129.64.208', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IkowNk1mYlRJUXdBS3k4cEF4VDEzUGdXU2pUZDB6TEo2Ijs='),
('3bsdm05mf09nt154ipm2tsa559', '2021-03-18 17:51:50', '167.248.133.53', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlpXN2Z2MnJySzRhZ0M3VUZlZ3Rsc1ZGSzV2U1BlamFTIjs='),
('4drj2lq0a1p934eu9pkdks6fbt', '2021-03-14 04:34:39', '167.248.133.54', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlFqMjNENlJSNVdXeGtFZUV4d0Y0WG0wRWF1ZWlzR0JxIjs='),
('57gkuftq8e68pflp9mlnisk8sm', '2021-03-12 15:34:11', '74.120.14.40', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IjJSYlNpRkxNa3BoR0xTQ0JzMGFUdTVIdG1HM0Zhaks3Ijs='),
('6hnlahqgjl1vnqamqgm8ju4uio', '2021-03-16 10:52:10', '162.142.125.55', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IkNqSkR1ODM4OXVnNkM1b3V1ZDdPRFR5eFg0ZmtsWnlzIjs='),
('6l46097tdg9c51o9sdi9rq7ih4', '2021-03-12 10:21:17', '167.248.133.39', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6InNWb2l3V1VDdEdnSUlXdkR5ZEt3SlNnRmV6SUt6ZlFyIjs='),
('6mfkgqto5dplo9pb61919aqrvq', '2021-03-11 16:55:37', '23.129.64.201', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IjdVQVlnNVIxbjgzMzJZczFUWm1CdERGODc4VDVpa2loIjs='),
('77kc9n34m1hf5gu30i2ml2e48j', '2021-03-15 22:48:52', '162.142.125.40', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlVZaGd2V3YyTzduOWxzeWxsS1dKMnBESW5uWjVrNXRwIjs='),
('8g5r717ir4rtbi9qoar3ighhmm', '2021-03-16 06:44:48', '167.248.133.53', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlBpUDJTdElZVTFTdUFtZWg2NGxjZ1pxTnc4aHJKN1R6Ijs='),
('8qrs5f341emrlj31nbkcs0q323', '2021-03-12 14:11:57', '74.120.14.37', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IjltS0tteWdGMHAyTTVCMUlQaXVxdGFldWNnY0R0R3daIjs='),
('944scdlcqlu7f25g856o4r9j4n', '2021-03-09 13:43:57', '74.120.14.54', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6InhmNndtTUNHRDJLQkl2T0FFbWt2SThwTUEwRTVGZGhpIjs='),
('9977phjvvbad83mq7u4s7eq8jl', '2021-03-13 09:40:17', '51.75.52.127', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImRjd0d0bk1FZkFUc3RLYnV6c25VNWhUUGhFOTl1ZXdoIjs='),
('9jeg1fa0eci16p042sgmearn6j', '2021-03-16 10:58:03', '162.142.125.128', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImV5MzlRb3ZKQjEyWHNialFFQTEzYlBpZWVrUWlwVExhIjs='),
('akdmfb4chdauduo9me51u0mimb', '2021-03-18 17:51:51', '167.248.133.53', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImlYdkloWlZ4MU1NRG81NnNjTUtzczhQMFA1aTRrYmh0Ijs='),
('cb8n4k8deq4ja72u51vc0lfk5v', '2021-03-16 20:21:16', '74.120.14.38', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IjVBMFdSMm9JSkMzcTB0WEp6S2dIdW1lVVBmZ0RIcEQ0Ijs='),
('dnmffm1hjmgcdnm72jf61diprd', '2021-03-10 20:20:14', '167.248.133.39', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IkJFRUtnTG45NW9vZWFrcmxCejZveHZseDZHSGlqS3JZIjs='),
('e2vsdr55hibu6hfv9nd17o7plq', '2021-03-14 17:57:35', '162.142.125.38', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlNPQzh6V3lKTFU1bG9aUmZYRnFVRlFiaUVBUGp2elQ5Ijs='),
('eigt1j9i3vh70ph78sfbr3av1d', '2021-03-12 10:21:18', '167.248.133.39', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImliNHBNQlNSc0I0dlpJSW5jN0pTckFEY2hrQUZIMjRWIjs='),
('f7v9f5e1ppd0iidg7tspgimo70', '2021-03-16 06:44:49', '167.248.133.53', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IkRBUXkyYzFtYWRNTFFQTEM0N0Z2SHhLYTdrSkZhVWFuIjs='),
('feboc7a98dcev8a94ungvnue96', '2021-03-16 18:19:10', '167.248.133.38', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IkJxUWpHUDV2NDhscWtZWW1IUDRqWXc3Y0tYcXR4WDFGIjs='),
('gam8hsc8522th9rn1qa2lqgse1', '2021-03-19 15:57:24', '167.248.133.55', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImVJc3NJWkxFOGVzYkJPcFVEYlVaNmtCWHJsVElqNEJFIjs='),
('go0h7r7url8c7ccbq4eqc02q2p', '2021-03-13 21:36:27', '67.207.89.162', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6InBNckNXNERja2d5R05DQXIzd3pkYzlkUTRMRGZUVHYyIjs='),
('i03d4u9odbgho6ddi6f27m7ahh', '2021-03-15 22:48:53', '162.142.125.40', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IkJnakxYMjBuZ3lUV3B5OTBYOGhhT3JRdTZBNWZnNEJxIjs='),
('jf6tmn9avq3rstlc5kod1ps59p', '2021-03-11 17:06:21', '74.120.14.53', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImhrSkRMR01WTVl0VzJZMUdQZVRSbGFKRTd1TFNSMnNLIjs='),
('kfhlsj93mscoeceu52u7mqesti', '2021-03-18 03:20:18', '138.68.157.250', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IkNlUUFkNmV3aVc2bTBRQU5ZOHN1dHZsbHM1Vmw4Uk5sIjs='),
('kkv7tm95qct4dcc939ijeki3bo', '2021-03-09 13:43:58', '74.120.14.54', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlRvYVVTcjJxWU95clR0eUJoWTNQZjlwRzFtVmg0dDJJIjs='),
('ll4i4dtue2gbs19611qor18for', '2021-03-14 07:42:25', '162.142.125.37', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IkVnUUdxeU53eW5LMndqS0xMMGIyZHRVZmZ3a1dBVXh1Ijs='),
('m7pkbml5764hknv22q21qql3s3', '2021-03-16 17:58:10', '162.142.125.39', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IkR6RnByb1RyYzZYOXlOV2l5UUFJZ25mcVJsMkpCUmFqIjs='),
('mkfoi3ju5u5t8ns35bqj5nnaq2', '2021-03-14 17:57:35', '162.142.125.38', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IldMWFV0aTZ3allOSkFVSWRhQWN4MWJneUJXNXEzNVJvIjs='),
('nhjhhfv86i7fr6plj66jao6a7s', '2021-03-13 01:30:27', '162.142.125.37', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6InJxZWwxUG5kTmtLNXA5dXFremkza1JFVU1OOW5pNHBRIjs='),
('nnk0taosq671lh1niab09sivn6', '2021-03-10 11:45:12', '162.142.125.40', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlZZdnpXTEI4ZmxDRUxObGJIeXBwODh6RENvdVNwaW5nIjs='),
('oujsdn29qtk80p2ng0dkdqj6nv', '2021-03-12 14:11:58', '74.120.14.37', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImtZQmVpV2J1ZHNZQTBsTHRqYUxvRTNBNnZVblpzVU9RIjs='),
('pgqkjef710s0hd35er1sng3sbq', '2021-03-12 15:34:11', '74.120.14.40', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlFucGt5THE5cTVYQ1ZRaVNPSjBDS3l1cVhadVRvN0pEIjs='),
('rc235gs0dspva491ju73ctu36i', '2021-03-10 20:20:14', '167.248.133.39', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6Im1WMlBJV2NOV2FhMlFXaVB0SGVsVXBNbEg0R1ZjRDhrIjs='),
('rc5sdedi1fpg7vtc4gt12k7n17', '2021-03-14 07:42:25', '162.142.125.37', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6InVpa09LQ1BIOFFaRHFialBDclZzNm1KbllvSlNCZUVEIjs='),
('rmbmhf1qisjqfl4ohpj0209s6b', '2021-03-10 20:58:50', '167.248.133.40', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlkzSFRnOEw1RnZ6M3J3RmFhNTQ4ajN1UEtnSUZEWlhsIjs='),
('sgdghkb0hnpgcsoq8l6eqqbp0q', '2021-03-11 17:06:21', '74.120.14.53', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6InlEcDFtS2NraGpqY29XTGZUVHlpQzhTeVFmS0U4Z3NyIjs='),
('t069dss3hbf7ap6nshqgauo5sh', '2021-03-18 01:59:07', '23.129.64.226', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IlhXRW5lSFNKalJKSTRKVU4wRDJMVllqR0RibDRMTHQ3Ijs='),
('ttud5184303rrgcimtm90omspv', '2021-03-10 11:45:13', '162.142.125.40', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6InBxMWlNVnBXOEptQWdwbjlaMU5odmpCQmlBR3RzckdKIjs='),
('ulhprbubd5m3ar8un5ag22j2ie', '2021-03-10 20:58:50', '167.248.133.40', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6IklpNUtPUGI0TkVlUThRUHBDWHZCcGtySUlJTVQyOFN0Ijs='),
('vv87kehfau15chr127pij530fg', '2021-03-16 10:52:11', '162.142.125.55', 'dGVtcHxiOjE7bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGFza3xzOjU6ImxvZ2luIjtza2luX2NvbmZpZ3xhOjU6e3M6NjoibGF5b3V0IjtzOjEwOiJ3aWRlc2NyZWVuIjtzOjIyOiJqcXVlcnlfdWlfY29sb3JzX3RoZW1lIjtzOjk6ImJvb3RzdHJhcCI7czoxODoiZW1iZWRfY3NzX2xvY2F0aW9uIjtzOjE3OiIvc3R5bGVzL2VtYmVkLmNzcyI7czoxOToiZWRpdG9yX2Nzc19sb2NhdGlvbiI7czoxNzoiL3N0eWxlcy9lbWJlZC5jc3MiO3M6MjY6Im1lZGlhX2Jyb3dzZXJfY3NzX2xvY2F0aW9uIjtzOjQ6Im5vbmUiO31yZXF1ZXN0X3Rva2VufHM6MzI6ImRpNDNqWEZIYkt4MnF5WWpMMW1POVlubmxFdWFrVm1FIjs=');

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `name` varchar(64) NOT NULL,
  `value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`name`, `value`) VALUES
('roundcube-version', '2019092900');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mail_host` varchar(128) NOT NULL,
  `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_login` datetime DEFAULT NULL,
  `failed_login` datetime DEFAULT NULL,
  `failed_login_counter` int(10) UNSIGNED DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `preferences` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`user_id`,`cache_key`),
  ADD KEY `expires_index` (`expires`);

--
-- Indexes for table `cache_index`
--
ALTER TABLE `cache_index`
  ADD PRIMARY KEY (`user_id`,`mailbox`),
  ADD KEY `expires_index` (`expires`);

--
-- Indexes for table `cache_messages`
--
ALTER TABLE `cache_messages`
  ADD PRIMARY KEY (`user_id`,`mailbox`,`uid`),
  ADD KEY `expires_index` (`expires`);

--
-- Indexes for table `cache_shared`
--
ALTER TABLE `cache_shared`
  ADD PRIMARY KEY (`cache_key`),
  ADD KEY `expires_index` (`expires`);

--
-- Indexes for table `cache_thread`
--
ALTER TABLE `cache_thread`
  ADD PRIMARY KEY (`user_id`,`mailbox`),
  ADD KEY `expires_index` (`expires`);

--
-- Indexes for table `contactgroupmembers`
--
ALTER TABLE `contactgroupmembers`
  ADD PRIMARY KEY (`contactgroup_id`,`contact_id`),
  ADD KEY `contactgroupmembers_contact_index` (`contact_id`);

--
-- Indexes for table `contactgroups`
--
ALTER TABLE `contactgroups`
  ADD PRIMARY KEY (`contactgroup_id`),
  ADD KEY `contactgroups_user_index` (`user_id`,`del`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `user_contacts_index` (`user_id`,`del`);

--
-- Indexes for table `dictionary`
--
ALTER TABLE `dictionary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqueness` (`user_id`,`language`);

--
-- Indexes for table `filestore`
--
ALTER TABLE `filestore`
  ADD PRIMARY KEY (`file_id`),
  ADD UNIQUE KEY `uniqueness` (`user_id`,`context`,`filename`);

--
-- Indexes for table `identities`
--
ALTER TABLE `identities`
  ADD PRIMARY KEY (`identity_id`),
  ADD KEY `user_identities_index` (`user_id`,`del`),
  ADD KEY `email_identities_index` (`email`,`del`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`search_id`),
  ADD UNIQUE KEY `uniqueness` (`user_id`,`type`,`name`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sess_id`),
  ADD KEY `changed_index` (`changed`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`,`mail_host`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contactgroups`
--
ALTER TABLE `contactgroups`
  MODIFY `contactgroup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dictionary`
--
ALTER TABLE `dictionary`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filestore`
--
ALTER TABLE `filestore`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `identities`
--
ALTER TABLE `identities`
  MODIFY `identity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `search_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cache`
--
ALTER TABLE `cache`
  ADD CONSTRAINT `user_id_fk_cache` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cache_index`
--
ALTER TABLE `cache_index`
  ADD CONSTRAINT `user_id_fk_cache_index` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cache_messages`
--
ALTER TABLE `cache_messages`
  ADD CONSTRAINT `user_id_fk_cache_messages` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cache_thread`
--
ALTER TABLE `cache_thread`
  ADD CONSTRAINT `user_id_fk_cache_thread` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contactgroupmembers`
--
ALTER TABLE `contactgroupmembers`
  ADD CONSTRAINT `contact_id_fk_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contactgroup_id_fk_contactgroups` FOREIGN KEY (`contactgroup_id`) REFERENCES `contactgroups` (`contactgroup_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contactgroups`
--
ALTER TABLE `contactgroups`
  ADD CONSTRAINT `user_id_fk_contactgroups` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `user_id_fk_contacts` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dictionary`
--
ALTER TABLE `dictionary`
  ADD CONSTRAINT `user_id_fk_dictionary` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `filestore`
--
ALTER TABLE `filestore`
  ADD CONSTRAINT `user_id_fk_filestore` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `identities`
--
ALTER TABLE `identities`
  ADD CONSTRAINT `user_id_fk_identities` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `searches`
--
ALTER TABLE `searches`
  ADD CONSTRAINT `user_id_fk_searches` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
