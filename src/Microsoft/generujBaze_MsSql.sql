-- Create new table PAPIERWARTOSCIOWY.
-- PAPIERWARTOSCIOWY : Table of PapierWartosciowy
-- 	SYMBOL : Symbol identifies PapierWartosciowy
-- 	AKTUALNAWARTOSC : AktualnaWartosc is of PapierWartosciowy
-- 	ILOSCWYDANYCHWALOROW : IloscWydanychWalorow is of PapierWartosciowy  
create table PAPIERWARTOSCIOWY (
	SYMBOL CHAR(10) not null,
	AKTUALNAWARTOSC NUMERIC(10,2) not null,
	ILOSCWYDANYCHWALOROW INT not null, constraint PAPIERWARTOSCIOWY_PK primary key (SYMBOL) ); 

	-- Create new table WALUTY.
-- WALUTY : Table of Waluty
-- 	SYMBOL : Symbol identifies Waluty
-- 	WALUTA : Waluta is of Waluty  
create table WALUTY (
	SYMBOL CHAR(10) not null,
	WALUTA CHAR(10) null, constraint WALUTY_PK primary key (SYMBOL) ); 

-- Create new table OBLIGACJE.
-- OBLIGACJE : Table of Obligacje
-- 	SYMBOL : Symbol identifies Obligacje
-- 	OBLIGACJE : Obligacje is of Obligacje  
create table OBLIGACJE (
	SYMBOL CHAR(10) not null,
	OBLIGACJE CHAR(10) null, constraint OBLIGACJE_PK primary key (SYMBOL) ); 

-- Create new table AKCJA.
-- AKCJA : Table of Akcja
-- 	SYMBOL : Symbol identifies Akcja
-- 	AKCJA : Akcja is of Akcja  
create table AKCJA (
	SYMBOL CHAR(10) not null,
	AKCJA CHAR(10) null, constraint AKCJA_PK primary key (SYMBOL) ); 

-- Create new table SUROWIEC.
-- SUROWIEC : Table of Surowiec
-- 	SYMBOL : Symbol identifies Surowiec
-- 	SUROWIEC : Surowiec is of Surowiec  
create table SUROWIEC (
	SYMBOL CHAR(10) not null,
	SUROWIEC CHAR(10) null, constraint SUROWIEC_PK primary key (SYMBOL) ); 

-- Create new table WYMIANA.
-- WYMIANA : Table of Wymiana
-- 	IDSPRZEDAWCY : IdSprzedawcy is of Wymiana
-- 	IDKUPUJACEGO : IdKupujacego is of Wymiana
-- 	CENA : Cena is of Wymiana
-- 	ILOSC : Ilosc is of Wymiana
-- 	DATA : Data identifies Wymiana
-- 	SYMBOL : Symbol partly identifies Wymiana  
create table WYMIANA (
	IDSPRZEDAWCY INTEGER not null,
	IDKUPUJACEGO INTEGER not null,
	CENA NUMERIC(10,2) not null,
	ILOSC INT not null,
	DATA DATETIME2 not null,
	SYMBOL CHAR(10) not null, constraint WYMIANA_PK primary key (DATA, SYMBOL) ); 

-- Create new table POSIADACZE.
-- POSIADACZE : Table of Posiadacze
-- 	IDWLASCICIELA : IdWlasciciela identifies Posiadacze
-- 	SYMBOL : Symbol partly identifies Posiadacze
-- 	ILOSCKUPIONYCHWALOROW : IloscKupionychWalorow is of Posiadacze  
create table POSIADACZE (
	IDWLASCICIELA INTEGER not null,
	SYMBOL CHAR(10) not null,
	ILOSCKUPIONYCHWALOROW INTEGER not null, constraint POSIADACZE_PK primary key (IDWLASCICIELA, SYMBOL) ); 

-- Create new table WLASCICIEL.
-- WLASCICIEL : Table of Wlasciciel
-- 	IMIE : Imie is of Wlasciciel
-- 	NAZWISKO : Nazwisko is of Wlasciciel
-- 	IDWLASCICIELA : IdWlasciciela identifies Wlasciciel  
create table WLASCICIEL (
	IMIE CHAR(10) not null,
	NAZWISKO CHAR(10) not null,
	IDWLASCICIELA INTEGER not null IDENTITY(1,1), constraint WLASCICIEL_PK primary key (IDWLASCICIELA) ); 

-- Add foreign key constraints to table WALUTY.
alter table WALUTY
	add constraint PAPIERWARTOSCIOWY_WALUTY_FK1 foreign key (
		SYMBOL)
	 references PAPIERWARTOSCIOWY (
		SYMBOL); 

-- Add foreign key constraints to table OBLIGACJE.
alter table OBLIGACJE
	add constraint PW_OBLIGACJE foreign key (
		SYMBOL)
	 references PAPIERWARTOSCIOWY (
		SYMBOL); 

-- Add foreign key constraints to table AKCJA.
alter table AKCJA
	add constraint PAPIERWARTOSCIOWY_AKCJA_FK1 foreign key (
		SYMBOL)
	 references PAPIERWARTOSCIOWY (
		SYMBOL); 

-- Add foreign key constraints to table SUROWIEC.
alter table SUROWIEC
	add constraint PAPIERWARTOSCIOWY_SUROWIEC_FK1 foreign key (
		SYMBOL)
	 references PAPIERWARTOSCIOWY (
		SYMBOL); 

-- Add foreign key constraints to table WYMIANA.
alter table WYMIANA
	add constraint WLASCICIEL_WYMIANA_FK1 foreign key (
		IDSPRZEDAWCY)
	 references WLASCICIEL (
		IDWLASCICIELA); 

alter table WYMIANA
	add constraint WLASCICIEL_WYMIANA_FK2 foreign key (
		IDKUPUJACEGO)
	 references WLASCICIEL (
		IDWLASCICIELA); 

alter table WYMIANA
	add constraint PAPIERWARTOSCIOWY_WYMIANA_FK1 foreign key (
		SYMBOL)
	 references PAPIERWARTOSCIOWY (
		SYMBOL); 

-- Add foreign key constraints to table POSIADACZE.
alter table POSIADACZE
	add constraint WLASCICIEL_POSIADACZE_FK1 foreign key (
		IDWLASCICIELA)
	 references WLASCICIEL (
		IDWLASCICIELA); 

alter table POSIADACZE
	add constraint PW_POSIADACZE_FK1 foreign key (
		SYMBOL)
	 references PAPIERWARTOSCIOWY (
		SYMBOL); 


-- This is the end of the Microsoft Visual Studio generated SQL DDL script.