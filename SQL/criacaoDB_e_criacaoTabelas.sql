--Criando o Banco de Dados--
create database Projeto

--Cria as tabelas--
CREATE TABLE tbl_user (
    user_id         INT         PRIMARY KEY     not null,
    firstName       VARCHAR(50)                 not null,
    lastName        VARCHAR(50)                 not null,
    email           VARCHAR(255)                not null,
    cpf             CHAR(11)                    not null,
    cell            VARCHAR(50)                 not null,
    birthDate       date                        not null
)

CREATE TABLE tbl_address (
    address_id      INT         PRIMARY KEY     not null,
    streetName      VARCHAR(255),
    streetNumber    CHAR(10),
    city            VARCHAR(255),
    state           VARCHAR(255),
    country         VARCHAR(255),
    postCode        VARCHAR(255)
)

CREATE TABLE tbl_picture (
    picture_id      INT         PRIMARY KEY     not null,
    small           VARCHAR(255),
    medium          VARCHAR(255),
    thumbNail       VARCHAR(255)
)

--cria as FK--

ALTER TABLE tbl_user 
    add column  address_id  int,
    add column  picture_id  int;

ALTER TABLE tbl_user
    ADD CONSTRAINT fk_address FOREIGN KEY (address_id) REFERENCES tbl_address(address_id),
    ADD CONSTRAINT fk_pictures FOREIGN KEY (picture_id) REFERENCES tbl_picture (picture_id);

ALTER TABLE tbl_address 
    add column  user_id     int     not null,
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES tbl_user (user_id);


ALTER TABLE tbl_picture 
    add column  user_id     int,
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES tbl_user (user_id);
