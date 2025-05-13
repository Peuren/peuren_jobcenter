CREATE TABLE IF NOT EXISTS `towing_players` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `identifier` text NOT NULL,
    `ranks` text NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `identifier` (`identifier`) USING HASH
);