CREATE DATABASE  IF NOT EXISTS `test`;
USE `test`;

DROP TABLE IF EXISTS parts; 
CREATE TABLE parts(
   id INT(11) NOT NULL AUTO_INCREMENT,
   title VARCHAR(100) NOT NULL UNIQUE,
   quantity INTEGER DEFAULT 0,
   isRequired boolean DEFAULT false
   ,   PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   
   

INSERT INTO PARTS (title, quantity, isRequired) values  ('Материнская плата', 2, true);
INSERT INTO PARTS (title, quantity, isRequired) values  ('SSD-диск, 256Gb', 5, true);
INSERT INTO PARTS (title, quantity, isRequired) values  ('SSD-диск, 128Gb', 3, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Оперативная память, 16Gb', 2, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Оперативная память, 8Gb', 4, true);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Видеокарта', 1, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Звуковая карта', 4, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('CD-ROM', 0, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('DVD-RW', 10, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Card Reader', 15, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('FDD', 0, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Корпус', 21, true);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Процессор Core i3', 10, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Процессор Core i5', 14, true);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Процессор Core i7', 3, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Шлейф SATA', 15, true);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Кулер процессора', 2, true);
INSERT INTO PARTS (title, quantity, isRequired) values  ('HDD, 1Tb', 7, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('HDD, 2Tb', 3, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Вентилятор корпуса', 3, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Клавиатура Logitech', 5, true);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Мышь Logitech', 5, true);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Коврик для мыши', 9, false);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Монитор 23"', 5, true);
INSERT INTO PARTS (title, quantity, isRequired) values  ('Монитор 27"', 3, false);
commit;