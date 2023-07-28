# 게시판 프로젝트 스키마 정의

# 데이터베이스 생성
CREATE DATABASE sample_board1;
USE sample_board1;

# 데이터베이스 테이블 생성
# 회원정보 (user) / 게시물 (board)
CREATE TABLE user (
	email VARCHAR(50),
    password VARCHAR(255),
    nickname VARCHAR(20),
    tel_number VARCHAR(15),
    address TEXT,
    address_detail TEXT,
    agreed_personal BOOLEAN,
    profile_image TEXT
);
