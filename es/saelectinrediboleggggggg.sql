CREATE DATABASE dbeconomy;

USE dbecomomy

CREATE TABLE tblrappresentante(
    cf VARCHAR(16) not null,
    nome VARCHAR(20) not null,
    cognome VARCHAR(30) not null,
    data_n DATE,
    PRIMARY KEY(cf)
);

CREATE TABLE tblcliente(
    cf VARCHAR(16) not null,
    nome VARCHAR(20) not null,
    cognome VARCHAR(30) not null,
    data_n DATE,
    rappresentante VARCHAR(16) not null,
    PRIMARY KEY(cf),
    FOREIGN KEY(rappresentante) REFERENCES tblrappresentante(cf) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE tblfattura(
    rappresentante VARCHAR(16) not null,
    emittente VARCHAR(16) not null,
    valore INT not null,
    data_emissione DATE,
    FOREIGN KEY(emittente) REFERENCES tblcliente(cf) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY(rappresentante) REFERENCES tblrappresentante(cf) ON DELETE RESTRICT ON UPDATE RESTRICT
);

/*es.1*/
select * FROM tblcliente WHERE rappresentante = /*cf del rappresentante*/;

/*es.2*/
select COUNT(rappresentante)FROM tblcliente WHERE rappresentante =  /*cf del rappresentante*/;

/*es.3*/
select SUM(valore)FROM tblfattura WHERE emittente =  /*cf del rappresentante*/;

/*es.4*/

select nome, data_emissione, MAX(valore) FROM tblcliente INNER JOIN tblfattura ON cf = emittente;

/*es.5*/

select nome, MAX(valore) FROM tblrappresentante INNER JOIN  tblfattura ON cf = rappresentante;

/*es.6*/
select nome, cognome, SUM(valore) FROM tblrappresentante INNER JOIN tblfattura ON cf = rappresentante;

