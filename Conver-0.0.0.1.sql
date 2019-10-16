--
-- Создать таблицу `polls`
--
CREATE TABLE polls (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  created_at datetime DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  created_by bigint(20) DEFAULT NULL,
  updated_by bigint(20) DEFAULT NULL,
  expiration_date_time datetime NOT NULL,
  question varchar(140) DEFAULT NULL,
  createdAt datetime DEFAULT NULL,
  updatedAt datetime DEFAULT NULL,
  createdBy bigint(20) DEFAULT NULL,
  updatedBy bigint(20) DEFAULT NULL,
  expirationDateTime datetime NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;


--
-- Создать таблицу `choices`
--
CREATE TABLE choices (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  text varchar(40) DEFAULT NULL,
  poll_id bigint(20) NOT NULL,
  createdAt datetime DEFAULT NULL,
  updatedAt datetime DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE choices
ADD CONSTRAINT FK1i68hpih40n447wqx4lpef6ot FOREIGN KEY (poll_id)
REFERENCES polls (id);

--
-- Создать таблицу `users`
--
CREATE TABLE users (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  email varchar(40) DEFAULT NULL,
  name varchar(40) DEFAULT NULL,
  password varchar(100) DEFAULT NULL,
  username varchar(15) DEFAULT NULL,
  createdAt datetime DEFAULT NULL,
  updatedAt datetime DEFAULT NULL,
  messageRecipient bigint(20) DEFAULT NULL,
  messageSender bigint(20) DEFAULT NULL,
  messageText varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 18,
AVG_ROW_LENGTH = 124,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK6dotkott2kjsp8vw4d0m25fb7` для объекта типа таблица `users`
--
ALTER TABLE users
ADD UNIQUE INDEX UK6dotkott2kjsp8vw4d0m25fb7 (email);

--
-- Создать индекс `UKr43af9ap4edm43mmtq01oddj6` для объекта типа таблица `users`
--
ALTER TABLE users
ADD UNIQUE INDEX UKr43af9ap4edm43mmtq01oddj6 (username);

--
-- Создать таблицу `messages`
--
CREATE TABLE messages (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  createdAt datetime DEFAULT NULL,
  updatedAt datetime DEFAULT NULL,
  messageRecipient bigint(20) DEFAULT NULL,
  messageSender bigint(20) DEFAULT NULL,
  messageText varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE messages
ADD CONSTRAINT FK_messages_messageRecipient FOREIGN KEY (messageRecipient)
REFERENCES users (id) ON DELETE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE messages
ADD CONSTRAINT FK_messages_messageSender FOREIGN KEY (messageSender)
REFERENCES users (id) ON DELETE NO ACTION;


--
-- Создать таблицу `roles`
--
CREATE TABLE roles (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  name varchar(60) DEFAULT NULL,
  createdAt datetime DEFAULT NULL,
  updatedAt datetime DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_nb4h0p6txrmfc0xbrd1kglp9t` для объекта типа таблица `roles`
--
ALTER TABLE roles
ADD UNIQUE INDEX UK_nb4h0p6txrmfc0xbrd1kglp9t (name);

--
-- Создать таблицу `user_roles`
--
CREATE TABLE user_roles (
  user_id bigint(20) NOT NULL,
  role_id bigint(20) NOT NULL,
  PRIMARY KEY (user_id, role_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1024,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE user_roles
ADD CONSTRAINT FKh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id)
REFERENCES roles (id);

--
-- Создать внешний ключ
--
ALTER TABLE user_roles
ADD CONSTRAINT FKhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id)
REFERENCES users (id);

--
-- Создать таблицу `votes`
--
CREATE TABLE votes (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  created_at datetime DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  choice_id bigint(20) NOT NULL,
  poll_id bigint(20) NOT NULL,
  user_id bigint(20) NOT NULL,
  createdAt datetime DEFAULT NULL,
  updatedAt datetime DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK8um9h2wxsdjrgx3rjjwvny676` для объекта типа таблица `votes`
--
ALTER TABLE votes
ADD UNIQUE INDEX UK8um9h2wxsdjrgx3rjjwvny676 (poll_id, user_id);

--
-- Создать внешний ключ
--
ALTER TABLE votes
ADD CONSTRAINT FK7trt3uyihr4g13hva9d31puxg FOREIGN KEY (poll_id)
REFERENCES polls (id);

--
-- Создать внешний ключ
--
ALTER TABLE votes
ADD CONSTRAINT FKli4uj3ic2vypf5pialchj925e FOREIGN KEY (user_id)
REFERENCES users (id);

--
-- Создать внешний ключ
--
ALTER TABLE votes
ADD CONSTRAINT FKomskymhxde3qq9mcukyp1puio FOREIGN KEY (choice_id)
REFERENCES choices (id);