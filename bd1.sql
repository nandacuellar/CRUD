CREATE DATABASE userlitdb;
CREATE TABLE `usertbl` (
    `id` int(11) NOT NULL auto_increment,
    `full_name` varchar(32) NOT NULL,
    `email` varchar(32) NOT NULL, 
    `username` varchar(20) NOT NULL,
    `password` varchar(32) NOT NULL,
    PRIMARY KEY (`id`), UNIQUE KEY `username` (`username`))ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
