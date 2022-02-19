CREATE TABLE `ispitni_rok` (
  `ID_ROKA` int(11) NOT NULL AUTO_INCREMENT,
  `NAZIV` varchar(15) NOT NULL,
  `SKOLSKA_GOD` varchar(7) NOT NULL,
  `STATUS_ROKA` enum('redovni','vanredni') NOT NULL,
  PRIMARY KEY (`ID_ROKA`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `profesor` (
  `ID_PROFESORA` int(11) NOT NULL,
  `IME` varchar(25) NOT NULL,
  `PREZIME` varchar(50) NOT NULL,
  `ZVANJE` enum('dr','mr') NOT NULL,
  `DATUM_ZAP` date NOT NULL,
  PRIMARY KEY (`ID_PROFESORA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `predmet` (
  `ID_PREDMETA` int(11) NOT NULL,
  `ID_PROFESORA` int(11) NOT NULL,
  `NAZIV` varchar(50) NOT NULL,
  `ESPB` int(11) NOT NULL,
  `STATUS` enum('obavezan','izborni') NOT NULL,
  PRIMARY KEY (`ID_PREDMETA`)
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ispit` (
  `ID_ISPITA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ROKA` int(11) NOT NULL,
  `ID_PREDMETA` int(11) NOT NULL,
  `DATUM` date NOT NULL,
  PRIMARY KEY (`ID_ISPITA`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `student` (
  `ID_STUDENTA` int(11) NOT NULL,
  `IME` varchar(25) NOT NULL,
  `PREZIME` varchar(40) NOT NULL,
  `SMER` varchar(5) NOT NULL,
  `BROJ` int(11) NOT NULL,
  `GODINA_UPISA` varchar(4) NOT NULL,
  PRIMARY KEY (`ID_STUDENTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `student_predmet` (
  `ID_STUDENTA` int(11) NOT NULL,
  `ID_PREDMETA` int(11) NOT NULL,
  `SKOLSKA_GODINA` varchar(7) NOT NULL,
  PRIMARY KEY (`ID_STUDENTA`,`ID_PREDMETA`,`SKOLSKA_GODINA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `zapisnik` (
  `ID_STUDENTA` int(11) NOT NULL,
  `ID_ISPITA` int(11) NOT NULL,
  `OCENA` int(11) NOT NULL,
  `BODOVI` varchar(3) NOT NULL,
  PRIMARY KEY (`ID_STUDENTA`,`ID_ISPITA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


alter table PREDMET add constraint FK_PREDMET_RELATIONS_PROFESOR foreign key (ID_PROFESORA)
      references PROFESOR (ID_PROFESORA) on delete restrict on update restrict;

alter table STUDENT_PREDMET add constraint FK_STUDENT__RELATIONS_STUDENT foreign key (ID_STUDENTA)
      references STUDENT (ID_STUDENTA) on delete restrict on update restrict;

alter table STUDENT_PREDMET add constraint FK_STUDENT__RELATIONS_PREDMET foreign key (ID_PREDMETA)
      references PREDMET (ID_PREDMETA) on delete restrict on update restrict;

alter table ZAPISNIK add constraint FK_ZAPISNIK_RELATIONS_STUDENT foreign key (ID_STUDENTA)
      references STUDENT (ID_STUDENTA) on delete restrict on update restrict;

alter table ZAPISNIK add constraint FK_ZAPISNIK_RELATIONS_ISPITI foreign key (ID_ISPITA)
      references ISPIT (ID_ISPITA) on delete restrict on update restrict;


alter table ISPIT add constraint FK_ISPITI_RELATIONS_ISPITNI_ foreign key (ID_ROKA)
      references ISPITNI_ROK (ID_ROKA) on delete restrict on update restrict;

alter table ISPIT add constraint FK_ISPITI_RELATIONS_PREDMET foreign key (ID_PREDMETA)
      references PREDMET (ID_PREDMETA) on delete restrict on update restrict;

INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (1,'Sara ','Miljković','NRT ',33,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (2,'Marko','Bakić','ASUV',2,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (3,'Andrej','Lazić','NRT ',16,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (4,'Lazar','Marković','RT',12,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (5,'Andjela','Stanković','IS',3,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (6,'Miloš','Petrović','RT',25,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (7,'Marko','Rakić','ELITE',6,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (8,'Lena','Milić','IS',10,'2018');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (9,'Stefan','Nikolić','NRT',15,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (10,'Aleksandar','Markić','ELITE',11,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (11,'Nikola','Milutinović','ASUV',26,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (12,'Violeta','Grujić','IS',13,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (13,'Bojana','Tomić','NRT',96,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (14,'Aleksa','Todorović','RT',55,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (15,'Igor','Tadić','ELITE',35,'2018');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (16,'Petra','Kostić','IS',7,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (17,'Vuk','Mirković','NRT',3,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (18,'Branislav ','Vuletić','ASUV',61,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (19,'Nenad','Branković','RT',23,'2018');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (20,'Mateja','Stojković','IS',14,'2018');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (21,'Jovana','Minić','IS',72,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (22,'Milica','Đukić','NRT',32,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (23,'Filip','Jevtić','RT',29,'2018');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (24,'Dragan','Popović','ELITE',19,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (25,'Željko','Marković','ASUV',67,'2018');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (26,'Janko','Lekić','NRT',85,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (27,'Nikola','Obradović','IS',101,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (28,'Todor','Pantić','ELITE',68,'2019');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (29,'Nada','Ilić','IS',16,'2020');
INSERT INTO `student` (`ID_STUDENTA`,`IME`,`PREZIME`,`SMER`,`BROJ`,`GODINA_UPISA`) VALUES (30,'Lara','Ivanović','NRT',17,'2019');


INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (100,'Gordana','Vuletić','dr', '2002-10-01');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (101,'Miloš','Lazarević','dr', '1997-03-15');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (102,'Goran','Protić','mr', '1986-09-27');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (103,'Lazar','Gojković','dr', '2002-11-05');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (104,'Bojan','Mikić','mr', '2006-07-22');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (105,'Jelena','Pekić','mr', '2014-04-18');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (106,'Marijana','Petrović','dr', '1996-08-20');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (107,'Nemanja','Marković','dr', '2017-11-30');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (108,'Marko','Bojović','mr', '1979-12-25');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (109,'Dragan','Mirčetić','dr', '2000-05-16');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (110,'Milovan','Kovačević','dr', '2002-07-29');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (111,'Nada','Stanimirović','dr', '2011-04-26');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (112,'Vladimir','Vuletić','dr', '2015-08-01');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (113,'Radmila','Lekić','dr', '2019-05-20');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (114,'Bogdan','Prokić','mr', '1983-06-18');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (115,'Tomislav','Miljković','dr', '1998-09-03');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (116,'Željko','Jokić','dr', '2016-02-12');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (117,'Marija','Vasić','mr', '2006-07-22');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (118,'Aleksandra','Grozdić','dr', '1974-08-31');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (119,'Miloš','Stanković','dr', '1989-06-26');
INSERT INTO `profesor` (`ID_PROFESORA`,`IME`,`PREZIME`,`ZVANJE`, `DATUM_ZAP`) VALUES (120,'Nikola','Žiletić','mr', '1993-09-07');



INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (1259,107,'Inženjerska matematika',7,'obavezan');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (1589,117,'Programiranje računarskih igara',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (2458,115,'Verovatnoća i statistika',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (2569,105,'Baze podataka',6,'obavezan');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (2648,104,'Operativni sistemi 1',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (3264,114,'Objektno programiranje 1',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (3521,112,'Aplikativni softver',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (4238,118,'Digitalne multimedije',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (4296,110,'Elektrotehnika',7,'obavezan');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (4526,101,'Uvod u objektno programiranje',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (4851,119,'Programski jezici',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (5214,102,'Veb dizajn',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (5236,111,'Programiranje mobilnih uređaja',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (6345,116,'Mikroračunari',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (6752,103,'Mikrokontroleri',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (7526,108,'Računarske mreže',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (7584,109,'Interakcija čovek-računar',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (8546,113,'Objektno programiranje 2 ',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (9412,106,'Analogna elektronika',6,'izborni');
INSERT INTO `predmet` (`ID_PREDMETA`,`ID_PROFESORA`,`NAZIV`,`ESPB`,`STATUS`) VALUES (9542,120,'Mikroprocesorski softver',6,'izborni');



INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (1,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (1,4238,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (2,2458,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (2,5214,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (3,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (3,3264,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (3,4851,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (3,5214,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (3,1589,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (3,6752,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (3,3521,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (4,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (4,9542,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (4,8546,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (4,5214,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (4,4851,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (4,7526,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (4,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (4,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (4,6752,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (5,4851,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (5,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (5,7526,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (6,8546,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (6,6345,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (6,2458,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (6,3264,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (6,4238,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (6,4296,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (6,2569,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (6,9542,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (6,5236,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (7,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (7,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (7,6752,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (7,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (7,8546,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (7,4851,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (7,5214,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (8,3264,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (8,2569,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (8,4851,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (9,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (9,5214,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (10,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (10,8546,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (10,4851,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (10,2648,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (10,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (10,5214,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (10,4238,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (10,5236,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (10,9542,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (11,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (11,2648,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (11,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (11,4238,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (11,6752,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (11,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (11,3264,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (11,7526,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (11,9412,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (12,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (13,4526,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (13,4851,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (14,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (14,2648,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (14,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (14,5214,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (14,2569,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (14,3264,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (14,6345,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (14,8546,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (15,9542,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (16,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (16,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (16,2648,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (16,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (16,4238,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (16,5214,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (16,3264,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (16,6345,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (16,8546,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (17,9412,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (18,6752,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (19,4851,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (19,5236,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (19,7526,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (20,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (20,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (20,2458,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (20,2648,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (20,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (20,4238,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (20,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (20,6345,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (20,8546,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (21,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (21,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (21,6752,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (21,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (21,9542,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (21,4851,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (21,5214,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (21,8546,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (22,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (23,4238,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (23,2569,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (24,2648,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (24,4238,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (24,5236,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (25,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (25,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (25,2648,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (25,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (25,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (25,8546,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (25,3264,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (25,7526,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (26,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (26,2458,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (26,3264,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (26,4238,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (26,4296,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (26,2569,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (26,8546,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (26,5214,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (26,4851,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (27,2458,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (27,3264,'2019/20');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (28,4851,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (28,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (28,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (28,6752,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (28,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (28,9542,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (28,5214,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (28,8546,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (28,3264,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,4526,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,6752,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,5236,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,7526,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,4851,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,6345,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,8546,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (29,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (30,1259,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (30,1589,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (30,2648,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (30,3521,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (30,6752,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (30,7584,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (30,8546,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (30,9542,'2018/19');
INSERT INTO `student_predmet` (`id_studenta`,`id_predmeta`,`skolska_godina`) VALUES (30,7526,'2019/20');




INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (1,'Januar','2018/19','redovni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (2,'Februar','2018/19','redovni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (3,'Jun','2018/19','redovni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (4,'Septembar','2018/19','redovni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (5,'Oktobar','2018/19','redovni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (6,'Oktobar 2','2018/19','vanredni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (7,'Novembar','2018/19','vanredni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (8,'Januar','2019/20','redovni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (9,'Februar','2019/20','redovni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (10,'Jun','2019/20','redovni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (11,'Septembar','2019/20','redovni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (12,'Oktobar','2019/20','redovni');
INSERT INTO `ispitni_rok` (`ID_ROKA`,`NAZIV`,`SKOLSKA_GOD`,`STATUS_ROKA`) VALUES (13,'Oktobar 2','2019/20','vanredni');



INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (1,1,2458,'2019-01-30');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (2,2,3264,'2019-02-18');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (3,5,4238,'2019-09-17');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (4,6,4296,'2019-10-11');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (5,7,1259,'2019-11-07');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (6,8,2569,'2020-02-01');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (7,11,9542,'2020-09-09');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (8,13,9412,'2020-10-12');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (9,10,6752,'2020-06-16');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (10,5,5236,'2019-09-20');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (11,6,7584,'2019-09-12');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (12,4,8546,'2019-09-06');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (13,8,4851,'2020-02-03');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (14,7,2648,'2019-11-07');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (15,1,1589,'2019-02-01');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (16,1,1259,'2019-02-03');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (17,2,3521,'2019-02-14');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (18,9,5214,'2020-02-18');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (19,5,4238,'2019-09-24');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (20,3,6752,'2019-06-13');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (21,6,5236,'2019-10-13');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (22,12,7526,'2020-09-21');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (23,13,4851,'2020-10-11');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (24,11,6345,'2020-09-06');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (25,10,8546,'2020-06-21');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (26,1,9542,'2019-02-04');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (27,2,7584,'2019-02-24');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (28,3,4851,'2019-06-18');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (29,3,2648,'2019-06-12');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (30,6,1589,'2019-10-12');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (31,5,5214,'2019-09-23');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (32,7,4238,'2019-11-07');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (33,9,3264,'2020-02-18');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (34,8,2458,'2020-01-30');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (35,10,4296,'2020-06-21');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (36,13,2648,'2020-10-11');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (37,11,3264,'2020-09-04');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (38,4,4526,'2019-09-03');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (39,6,7584,'2019-10-13');
INSERT INTO `ispit`(`ID_ISPITA`,`ID_ROKA`,`ID_PREDMETA`,`DATUM`) VALUES (40,1,5236,'2019-02-04');



INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (1,3,7,'63');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (1,17,6,'51');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (2,1,10,'96');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (2,31,5,'33');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (3,16,9,'82');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (3,33,9,'89');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (3,5,7,'62');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (3,28,10,'91');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (3,31,6,'59');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (3,17,8,'75');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (4,26,6,'56');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (4,30,7,'67');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (4,25,5,'47');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (4,31,9,'87');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (4,28,6,'54');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (4,22,10,'97');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (4,9,8,'77');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (4,39,9,'93');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (5,11,10,'99');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (5,22,5,'45');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (5,28,6,'51');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (6,12,10,'93');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (6,24,10,'96');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (6,10,10,'91');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (6,2,6,'54');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (6,1,8,'76');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (6,7,8,'79');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (6,3,9,'85');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (6,4,5,'40');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (8,2,8,'76');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (8,6,9,'87');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (8,13,6,'56');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (9,16,6,'58');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (9,18,7,'61');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (10,27,7,'66');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (10,19,7,'69');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (10,17,8,'72');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (10,12,10,'96');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (10,7,5,'32');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (10,10,9,'98');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (10,13,7,'64');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (10,14,10,'93');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (11,3,9,'87');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (11,8,8,'71');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (11,17,8,'71');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (11,20,6,'71');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (11,22,7,'61');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (11,27,7,'61');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (11,29,8,'75');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (11,30,8,'75');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (11,33,6,'51');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (12,17,8,'71');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (13,28,9,'86');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (13,38,10,'91');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (14,6,10,'97');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (14,14,6,'52');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (15,7,5,'10');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (16,14,8,'71');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (16,16,5,'25');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (16,17,7,'61');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (16,19,5,'15');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (16,24,7,'61');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (16,25,6,'71');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (16,30,8,'75');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (16,31,9,'87');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (16,33,6,'51');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (17,8,10,'98');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (18,9,10,'100');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (19,22,7,'65');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (19,28,8,'79');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (19,40,9,'89');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (20,1,9,'87');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (20,5,6,'71');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (20,17,8,'71');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (20,24,8,'71');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (20,25,7,'68');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (20,27,7,'61');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (20,29,7,'61');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (20,30,6,'51');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (20,32,8,'75');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (21,5,8,'77');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (21,9,7,'64');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (21,39,9,'81');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (21,26,10,'99');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (21,31,10,'92');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (21,25,6,'58');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (22,16,6,'52');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (23,3,10,'92');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (23,6,9,'87');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (24,19,7,'61');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (24,29,10,'91');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (24,40,7,'65');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (25,5,9,'87');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (26,5,6,'51');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (26,1,10,'93');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (26,6,9,'87');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (26,2,10,'91');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (26,31,7,'63');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (26,28,7,'67');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (27,33,9,'86');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (27,34,5,'20');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (28,28,9,'85');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (28,5,9,'84');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (28,15,10,'100');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (28,9,8,'75');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (28,39,7,'65');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (28,26,10,'94');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (28,31,9,'85');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (28,25,6,'55');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (28,2,5,'41');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,38,10,'99');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,21,8,'79');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,25,7,'65');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,20,6,'59');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,22,10,'94');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,24,7,'67');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,23,10,'97');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,11,5,'27');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,5,6,'51');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,15,7,'61');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (29,17,5,'45');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (30,26,5,'15');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (30,29,7,'61');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (30,5,8,'74');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (30,15,9,'82');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (30,36,10,'96');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (30,17,5,'41');
INSERT INTO `zapisnik` (`ID_STUDENTA`,`ID_ISPITA`,`OCENA`,`BODOVI`) VALUES (30,22,9,'89');


