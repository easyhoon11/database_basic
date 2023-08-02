CREATE DATABASE sample_board_2;
USE sample_board_2;

CREATE TABLE user(
	email VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(20) NOT NULL UNIQUE,
    tel_number VARCHAR(15) NOT NULL UNIQUE,
    address TEXT NOT NULL,
    address_detail TEXT,
    agreed_personal BOOLEAN NOT NULL CHECK (agreed_personal IS true),
    profile_image VARCHAR(500) NOT NULL DEFAULT 'https://us.123rf.com/450wm/tuktukdesign/tuktukdesign1705/tuktukdesign170500065/77461560-%EB%82%A8%EC%9E%90-%EC%82%AC%EC%9A%A9%EC%9E%90-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%82%AC%EB%9E%8C-%ED%94%84%EB%A1%9C%ED%95%84-%EC%95%84%EB%B0%94%ED%83%80-%EA%B8%80%EB%A6%AC%ED%94%84-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8.jpg'
);

CREATE TABLE board (
	board_number INT PRIMARY KEY AUTO_INCREMENT,
    title TEXT NOT NULL,
    contents TEXT NOT NULL,
    write_datetime DATETIME NOT NULL DEFAULT now(),
    writer_email VARCHAR(50) NOT NULL,
    view_count INT NOT NULL DEFAULT 0,
    FOREIGN KEY (writer_email) REFERENCES user (email)
);

CREATE TABLE favorite (
	board_number INT NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    UNIQUE (board_number, user_email),
    FOREIGN KEY (board_number) REFERENCES board (board_number),
    FOREIGN KEY (user_email) REFERENCES user (email)
);

CREATE TABLE comment (
	board_number INT NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    write_datetime DATETIME NOT NULL DEFAULT now(),
    FOREIGN KEY (board_number) REFERENCES board (board_number),
    FOREIGN KEY (user_email) REFERENCES user (email)
);