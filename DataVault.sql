CREATE TABLE `HUB_Продукция` (
	`ПродукцияID` INT NOT NULL AUTO_INCREMENT,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`ПродукцияID`)
);

CREATE TABLE `HUB_Заказчик` (
	`ЗаказчикID` INT NOT NULL AUTO_INCREMENT,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`ЗаказчикID`)
);

CREATE TABLE `SAT_Продукция` (
	`ПродукцияID` INT NOT NULL,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	`Наименование продукции` varchar(255) NOT NULL,
	`Описание` varchar(255) NOT NULL,
	`Вес` INT NOT NULL,
	`Цена` INT NOT NULL,
	`Номер склада` INT NOT NULL,
	`Количество на складе` INT NOT NULL
);

CREATE TABLE `SAT_Заказчик` (
	`ЗаказчикID` INT NOT NULL,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	`Наименование заказчика` varchar(255) NOT NULL,
	`Телефон` varchar(255) NOT NULL,
	`Адрес` varchar(255) NOT NULL,
	`Сотрудник для связи` varchar(255) NOT NULL
);

CREATE TABLE `LNK_Заявка` (
	`Заявка_hash_key` INT NOT NULL AUTO_INCREMENT,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	`ПродукцияID` INT NOT NULL,
	`ЗаказчикID` INT NOT NULL,
	`ОтгрузкаID` INT NOT NULL,
	PRIMARY KEY (`Заявка_hash_key`)
);

CREATE TABLE `SAT_Заявка` (
	`Заявка_hash_key` INT NOT NULL,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	`Наименование` varchar(255) NOT NULL,
	`Количество` INT NOT NULL,
	`Дата` DATE NOT NULL,
	`Стоимость` INT NOT NULL,
	`Комментарий` varchar(255) NOT NULL
);

CREATE TABLE `HUB_Склады` (
	`СкладID` INT NOT NULL AUTO_INCREMENT,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`СкладID`)
);

CREATE TABLE `SAT_Склады` (
	`СкладID` INT NOT NULL,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	`Название склада` varchar(255) NOT NULL,
	`Адрес` varchar(255) NOT NULL,
	`Телефон` varchar(255) NOT NULL,
	`Ответственный` varchar(255) NOT NULL
);

CREATE TABLE `LNK_Хранение` (
	`Хранение_hash_key` INT NOT NULL AUTO_INCREMENT,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	`ПродукцияID` INT NOT NULL,
	`СкладID` INT NOT NULL,
	PRIMARY KEY (`Хранение_hash_key`)
);

CREATE TABLE `HUB_Отгрузка` (
	`ОтгрузкаID` INT NOT NULL AUTO_INCREMENT,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`ОтгрузкаID`)
);

CREATE TABLE `SAT_Отгрузка` (
	`ОтгрузкаID` INT NOT NULL,
	`load_date` DATETIME NOT NULL,
	`record_source` varchar(255) NOT NULL,
	`Номер накладаной` INT NOT NULL,
	`Дата отгрузки` DATE NOT NULL,
	`Дата доставки` DATE NOT NULL
);

ALTER TABLE `SAT_Продукция` ADD CONSTRAINT `SAT_Продукция_fk0` FOREIGN KEY (`ПродукцияID`) REFERENCES `HUB_Продукция`(`ПродукцияID`);

ALTER TABLE `SAT_Заказчик` ADD CONSTRAINT `SAT_Заказчик_fk0` FOREIGN KEY (`ЗаказчикID`) REFERENCES `HUB_Заказчик`(`ЗаказчикID`);

ALTER TABLE `LNK_Заявка` ADD CONSTRAINT `LNK_Заявка_fk0` FOREIGN KEY (`ПродукцияID`) REFERENCES `HUB_Продукция`(`ПродукцияID`);

ALTER TABLE `LNK_Заявка` ADD CONSTRAINT `LNK_Заявка_fk1` FOREIGN KEY (`ЗаказчикID`) REFERENCES `HUB_Заказчик`(`ЗаказчикID`);

ALTER TABLE `LNK_Заявка` ADD CONSTRAINT `LNK_Заявка_fk2` FOREIGN KEY (`ОтгрузкаID`) REFERENCES `HUB_Отгрузка`(`ОтгрузкаID`);

ALTER TABLE `SAT_Заявка` ADD CONSTRAINT `SAT_Заявка_fk0` FOREIGN KEY (`Заявка_hash_key`) REFERENCES `LNK_Заявка`(`Заявка_hash_key`);

ALTER TABLE `SAT_Склады` ADD CONSTRAINT `SAT_Склады_fk0` FOREIGN KEY (`СкладID`) REFERENCES `HUB_Склады`(`СкладID`);

ALTER TABLE `LNK_Хранение` ADD CONSTRAINT `LNK_Хранение_fk0` FOREIGN KEY (`ПродукцияID`) REFERENCES `HUB_Продукция`(`ПродукцияID`);

ALTER TABLE `LNK_Хранение` ADD CONSTRAINT `LNK_Хранение_fk1` FOREIGN KEY (`СкладID`) REFERENCES `HUB_Склады`(`СкладID`);

ALTER TABLE `SAT_Отгрузка` ADD CONSTRAINT `SAT_Отгрузка_fk0` FOREIGN KEY (`ОтгрузкаID`) REFERENCES `HUB_Отгрузка`(`ОтгрузкаID`);












