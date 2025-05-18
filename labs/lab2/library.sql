CREATE DATABASE `library`;

USE `library`;

CREATE TABLE IF NOT EXISTS publisher(
    name VARCHAR(20) PRIMARY KEY ,
    addr VARCHAR(50),
    phone VARCHAR(11)
);

CREATE TABLE IF NOT EXISTS book(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL ,
    publisher VARCHAR(20) ,
    is_available BOOLEAN DEFAULT TRUE,
    CONSTRAINT publisher_name FOREIGN KEY (publisher) REFERENCES publisher(name) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS reader(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL ,
    id_card CHAR(18) NOT NULL ,
    addr VARCHAR(50),
    phone VARCHAR(11)
);

CREATE TABLE IF NOT EXISTS record(
    id INT NOT NULL ,
    borrower INT NOT NULL ,
    borrow_date DATETIME NOT NULL ,
    return_date DATETIME,
    CONSTRAINT book_id FOREIGN KEY (id) REFERENCES book(id) ON DELETE CASCADE ON UPDATE CASCADE ,
    CONSTRAINT borrower_id FOREIGN KEY (borrower) REFERENCES reader(id) ON DELETE CASCADE ON UPDATE CASCADE ,
    CHECK ( return_date > borrow_date )
);

DROP TABLE publisher, book, reader, record;