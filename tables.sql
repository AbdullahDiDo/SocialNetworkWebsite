CREATE  TABLE  user(
  user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  email  VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  password CHAR(32) NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  gender ENUM('male', 'female') NOT NULL,
  home_town VARCHAR(255),
  about_me TEXT ,
  nick_name VARCHAR(255),
  martial_status ENUM ('single','engaged','married'),
  birth_date DATE NOT NULL ,
  reg_date TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
)DEFAULT  CHARACTER SET utf8 ENGINE  =InnoDB;

CREATE TABLE  posts(
  post_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  isPublic BOOLEAN NOT NULL DEFAULT 1,
  user_id INT NOT NULL,
  caption TEXT NOT NULL,
  time TIMESTAMP NOT NULL default CURRENT_TIMESTAMP ,
  FOREIGN KEY (user_id) REFERENCES user (user_id)
    ON DELETE  CASCADE  ON UPDATE  CASCADE
)DEFAULT CHARACTER SET utf8 ENGINE =InnoDB;

CREATE TABLE  phone_numbers(
  phone_number CHAR(11)  NOT NULL PRIMARY KEY  ,
  user_id INT ,
  FOREIGN KEY (user_id) REFERENCES  user(user_id)
    ON DELETE  CASCADE  ON UPDATE  CASCADE
)DEFAULT CHARACTER SET utf8 ENGINE =InnoDB;
CREATE TABLE  notifications (
  notification_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id1 INT NOT NULL,
  user_id2 INT NOT NULL,
  seen BIT(1) DEFAULT 0,
  FOREIGN KEY (user_id1) REFERENCES  user(user_id)
    ON DELETE  CASCADE  ON UPDATE  CASCADE,
  FOREIGN KEY (user_id2) REFERENCES  user(user_id)
    ON DELETE  CASCADE  ON UPDATE  CASCADE
)DEFAULT CHARACTER SET utf8 ENGINE =InnoDB;

CREATE  TABLE  friendships (
  user_id1 INT NOT NULL,
  user_id2 INT NOT NULL,
  relationship VARCHAR(255),
  time DATETIME NOT NULL ,
  PRIMARY KEY (user_id1,user_id2),
  FOREIGN KEY (user_id1) REFERENCES  user(user_id)
    ON DELETE  CASCADE  ON UPDATE  CASCADE,
  FOREIGN KEY (user_id2) REFERENCES  user(user_id)
    ON DELETE  CASCADE  ON UPDATE  CASCADE
)DEFAULT CHARACTER SET utf8 ENGINE =InnoDB;

CREATE  TABLE emotions (
  emotion_id VARCHAR(3) NOT NULL PRIMARY KEY ,
  url VARCHAR(255) UNICODE NOT NULL
)DEFAULT CHARACTER SET utf8 ENGINE =InnoDB;

CREATE  TABLE posts_likes (
  post_id INT NOT NULL ,
  user_id INT NOT NULL ,
  date TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY (post_id,user_id)
)DEFAULT CHARACTER SET utf8 ENGINE =InnoDB;

CREATE  TABLE pending_firends(
  sender_id INT NOT NULL,
  reciever_id INT NOT NULL,
  FOREIGN KEY (sender_id) REFERENCES  user(user_id)
    ON DELETE  CASCADE  ON UPDATE  CASCADE,
  FOREIGN KEY (reciever_id) REFERENCES  user(user_id)
    ON DELETE  CASCADE  ON UPDATE  CASCADE
)DEFAULT CHARACTER SET utf8 ENGINE =InnoDB;