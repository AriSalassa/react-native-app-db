CREATE TABLE `User` (
  id                        int(10) NOT NULL AUTO_INCREMENT, 
  name                      varchar(20) NOT NULL, 
  lastName                  varchar(20) NOT NULL, 
  userName                  varchar(40) NOT NULL UNIQUE, 
  hash                      varchar(32) NOT NULL, 
  salt                      varchar(32) NOT NULL, 
  idLocation                int(10), 
  idZonaDepartamentoPartido int(2) NOT NULL, 
  profileImage              int(10) NOT NULL, 
  status                    tinyint(1) NOT NULL, 
  registeredTime            datetime NOT NULL, 
  retiredTime               datetime NULL, 
  modificationTime          datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idLocation), 
  INDEX (idZonaDepartamentoPartido), 
  UNIQUE INDEX (profileImage), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Location (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  latitude         varchar(255) NOT NULL, 
  longitude        varchar(255) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Field (
  id                    int(10) NOT NULL AUTO_INCREMENT, 
  name                  varchar(20) NOT NULL, 
  idFacility            int(10) NOT NULL, 
  idType                int(10) NOT NULL, 
  allowCancelation      tinyint(1) NOT NULL, 
  automaticConfirmation tinyint(1) NOT NULL, 
  deadline              varchar(5) NOT NULL comment 'formato HH:mm', 
  status                tinyint(1) NOT NULL, 
  registeredTime        datetime NOT NULL, 
  retiredTime           datetime NULL, 
  modificationTime      datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idFacility), 
  INDEX (idType), 
  INDEX (status)) type=InnoDB;
CREATE TABLE FieldType (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  name             int(10) NOT NULL comment 'El nombre podría ser, futbol o paddle', 
  playerNumber     int(2) NOT NULL comment 'Cantidad de jugadores que entran en el capo', 
  description      varchar(255), 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Shift (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  idField          int(10) NOT NULL, 
  available        tinyint(1) NOT NULL, 
  startTime        varchar(5) NOT NULL, 
  endTime          varchar(5) NOT NULL, 
  price            int(10) NOT NULL, 
  `date`           varchar(10) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idField), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Reservation (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  idField          int(10) NOT NULL, 
  idShift          int(10) NOT NULL, 
  idUser           int(10) NOT NULL, 
  registeredTime   varchar(8) NOT NULL comment 'formato HH:mm:ss', 
  registeredDate   varchar(10) NOT NULL comment 'formato aaaa-mm-dd', 
  state            varchar(10) NOT NULL comment 'Si está pendiente, confirmada o rechazada', 
  status           tinyint(1) NOT NULL, 
  registeredTime2  datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  UNIQUE INDEX (idShift), 
  INDEX (idUser), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Facility (
  id                        int(10) NOT NULL AUTO_INCREMENT, 
  name                      varchar(30) NOT NULL, 
  description               varchar(255), 
  idLocation                int(10) NOT NULL, 
  idOwner                   int(10) NOT NULL, 
  idZonaDepartamentoPartido int(2) NOT NULL, 
  status                    tinyint(1) NOT NULL, 
  registeredTime            datetime NOT NULL, 
  retiredTime               datetime NULL, 
  modificationTime          datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idLocation), 
  INDEX (idOwner), 
  INDEX (idZonaDepartamentoPartido), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Confirmation (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  idReservation    int(10) NOT NULL, 
  registeredTime   varchar(8) NOT NULL, 
  registeredDate   varchar(10) NOT NULL, 
  state            varchar(10) NOT NULL comment 'Este estado se hace para tener una persistencia ante una posible baja de una reserva ya confirmada por el propietario.', 
  status           tinyint(1) NOT NULL, 
  registeredTime2  datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  UNIQUE INDEX (idReservation), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Review (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  idUser           int(10) NOT NULL, 
  idFacility       int(10), 
  rating           int(1) NOT NULL, 
  comment          varchar(255), 
  anonymous        tinyint(1) DEFAULT 1 NOT NULL, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idUser), 
  INDEX (idFacility), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Image (
  id             int(10) NOT NULL AUTO_INCREMENT, 
  url            varchar(255) NOT NULL UNIQUE, 
  alt            varchar(50), 
  idFacility     int(10) NOT NULL, 
  status         tinyint(1) NOT NULL, 
  registeredTime datetime NOT NULL, 
  retiredTime    datetime NULL, 
  moficationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idFacility), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Province (
  id               int(2) NOT NULL AUTO_INCREMENT, 
  name             varchar(10) NOT NULL UNIQUE, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status)) type=InnoDB;
CREATE TABLE ZonaDepartmentoPartido (
  id               int(2) NOT NULL AUTO_INCREMENT, 
  idProvince       int(2) NOT NULL, 
  name             varchar(255) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idProvince), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Community (
  id                 int(10) NOT NULL AUTO_INCREMENT, 
  name               varchar(20) NOT NULL, 
  description        varchar(255), 
  automaticAdmission tinyint(1) NOT NULL, 
  status             tinyint(1) NOT NULL, 
  registeredTime     datetime NOT NULL, 
  retiredTime        datetime NULL, 
  modificationTime   datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status)) type=InnoDB;
CREATE TABLE AdmissionRequest (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  idUser           int(10) NOT NULL, 
  idCommunity      int(10) NOT NULL, 
  state            tinyint(1) NOT NULL comment 'abierto o cerrado', 
  message          varchar(255), 
  resolved         varchar(10) comment 'Cómo se resolvió la admisión', 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idUser), 
  INDEX (idCommunity), 
  INDEX (status)) type=InnoDB;
CREATE TABLE CommunityMember (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  idCommunity      int(10) NOT NULL, 
  idUser           int(10) NOT NULL, 
  communityAdmin   tinyint(1) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idCommunity), 
  INDEX (idUser), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Post (
  id                int(10) NOT NULL AUTO_INCREMENT, 
  title             varchar(50) NOT NULL, 
  message           varchar(255) NOT NULL, 
  idCommunityMember int(10) NOT NULL, 
  idCommunity       int(10) NOT NULL, 
  postAsFacility    tinyint(1) NOT NULL, 
  status            tinyint(1) NOT NULL, 
  registeredTime    datetime NOT NULL, 
  retiredTime       datetime NULL, 
  modificationTime  datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idCommunityMember), 
  INDEX (idCommunity), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Answer (
  id                int(10) NOT NULL AUTO_INCREMENT, 
  idPost            int(10) NOT NULL, 
  idCommunityMember int(10) NOT NULL, 
  postAsFacility    tinyint(1) NOT NULL, 
  status            tinyint(1) NOT NULL, 
  registeredTime    datetime NOT NULL, 
  retiredTime       datetime NULL, 
  modificationTime  datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idPost), 
  INDEX (idCommunityMember), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Reaction (
  id                int(10) NOT NULL AUTO_INCREMENT, 
  idPost            int(10) NOT NULL, 
  idCommunityMember int(10) NOT NULL, 
  idReactionType    int(1) NOT NULL, 
  status            tinyint(1) NOT NULL, 
  registeredTime    datetime NOT NULL, 
  retiredTime       datetime NULL, 
  modificationTime  datetime NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (idPost), 
  INDEX (idCommunityMember), 
  INDEX (idReactionType), 
  INDEX (status)) type=InnoDB;
CREATE TABLE ReactionType (
  id               int(1) NOT NULL AUTO_INCREMENT, 
  name             varchar(10) NOT NULL UNIQUE, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Favourites (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  idUser           int(10) NOT NULL, 
  idFacility       int(10) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idUser), 
  INDEX (idFacility), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Notification (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  title            varchar(50) NOT NULL, 
  message          varchar(255) NOT NULL, 
  cause            varchar(255) NOT NULL, 
  idUser           int(10) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idUser), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Room (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  name             varchar(50) NOT NULL, 
  idRoomType       int(1) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idRoomType), 
  INDEX (status)) type=InnoDB;
CREATE TABLE RommType (
  id               int(1) NOT NULL AUTO_INCREMENT CHECK(id), 
  name             varchar(10) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status)) type=InnoDB;
CREATE TABLE RoomMember (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  idUser           int(10) NOT NULL, 
  idRoom           int(10) NOT NULL, 
  status           tinyint(1) NOT NULL CHECK(status), 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idUser), 
  INDEX (idRoom), 
  INDEX (status)) type=InnoDB;
CREATE TABLE Message (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  idRoomMember     int(10) NOT NULL, 
  idRoom           int(10) NOT NULL, 
  message          varchar(255) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idRoomMember), 
  INDEX (idRoom), 
  INDEX (status)) type=InnoDB;
ALTER TABLE `User` ADD CONSTRAINT FKUser156294 FOREIGN KEY (idLocation) REFERENCES Location (id);
ALTER TABLE Field ADD CONSTRAINT FKField127677 FOREIGN KEY (idType) REFERENCES FieldType (id);
ALTER TABLE Field ADD CONSTRAINT FKField500073 FOREIGN KEY (idFacility) REFERENCES Facility (id);
ALTER TABLE Facility ADD CONSTRAINT FKFacility271569 FOREIGN KEY (idLocation) REFERENCES Location (id);
ALTER TABLE Facility ADD CONSTRAINT FKFacility425991 FOREIGN KEY (idOwner) REFERENCES `User` (id);
ALTER TABLE Reservation ADD CONSTRAINT FKReservatio473222 FOREIGN KEY (idUser) REFERENCES `User` (id);
ALTER TABLE Reservation ADD CONSTRAINT FKReservatio22514 FOREIGN KEY (idShift) REFERENCES Shift (id);
ALTER TABLE Confirmation ADD CONSTRAINT FKConfirmati878438 FOREIGN KEY (idReservation) REFERENCES Reservation (id);
ALTER TABLE Review ADD CONSTRAINT FKReview227753 FOREIGN KEY (idUser) REFERENCES `User` (id);
ALTER TABLE Review ADD CONSTRAINT FKReview858678 FOREIGN KEY (idFacility) REFERENCES Facility (id);
ALTER TABLE ZonaDepartmentoPartido ADD CONSTRAINT FKZonaDepart352927 FOREIGN KEY (idProvince) REFERENCES Province (id);
ALTER TABLE `User` ADD CONSTRAINT FKUser256501 FOREIGN KEY (idZonaDepartamentoPartido) REFERENCES ZonaDepartmentoPartido (id);
ALTER TABLE Facility ADD CONSTRAINT FKFacility599814 FOREIGN KEY (idZonaDepartamentoPartido) REFERENCES ZonaDepartmentoPartido (id);
ALTER TABLE `User` ADD CONSTRAINT FKUser771439 FOREIGN KEY (profileImage) REFERENCES Image (id);
ALTER TABLE Image ADD CONSTRAINT FKImage385805 FOREIGN KEY (idFacility) REFERENCES Facility (id);
ALTER TABLE Shift ADD CONSTRAINT FKShift130983 FOREIGN KEY (idField) REFERENCES Field (id);
ALTER TABLE AdmissionRequest ADD CONSTRAINT FKAdmissionR782465 FOREIGN KEY (idUser) REFERENCES `User` (id);
ALTER TABLE AdmissionRequest ADD CONSTRAINT FKAdmissionR669097 FOREIGN KEY (idCommunity) REFERENCES Community (id);
ALTER TABLE CommunityMember ADD CONSTRAINT FKCommunityM523873 FOREIGN KEY (idCommunity) REFERENCES Community (id);
ALTER TABLE CommunityMember ADD CONSTRAINT FKCommunityM637241 FOREIGN KEY (idUser) REFERENCES `User` (id);
ALTER TABLE Post ADD CONSTRAINT FKPost879920 FOREIGN KEY (idCommunity) REFERENCES Community (id);
ALTER TABLE Post ADD CONSTRAINT FKPost863215 FOREIGN KEY (idCommunityMember) REFERENCES CommunityMember (id);
ALTER TABLE Answer ADD CONSTRAINT FKAnswer462746 FOREIGN KEY (idPost) REFERENCES Post (id);
ALTER TABLE Answer ADD CONSTRAINT FKAnswer670809 FOREIGN KEY (idCommunityMember) REFERENCES CommunityMember (id);
ALTER TABLE Reaction ADD CONSTRAINT FKReaction431307 FOREIGN KEY (idPost) REFERENCES Post (id);
ALTER TABLE Reaction ADD CONSTRAINT FKReaction748346 FOREIGN KEY (idCommunityMember) REFERENCES CommunityMember (id);
ALTER TABLE Reaction ADD CONSTRAINT FKReaction870377 FOREIGN KEY (idReactionType) REFERENCES ReactionType (id);
ALTER TABLE Favourites ADD CONSTRAINT FKFavourites260098 FOREIGN KEY (idUser) REFERENCES `User` (id);
ALTER TABLE Favourites ADD CONSTRAINT FKFavourites826333 FOREIGN KEY (idFacility) REFERENCES Facility (id);
ALTER TABLE Notification ADD CONSTRAINT FKNotificati706136 FOREIGN KEY (idUser) REFERENCES `User` (id);
ALTER TABLE Room ADD CONSTRAINT FKRoom81009 FOREIGN KEY (idRoomType) REFERENCES RommType (id);
ALTER TABLE RoomMember ADD CONSTRAINT FKRoomMember659016 FOREIGN KEY (idUser) REFERENCES `User` (id);
ALTER TABLE RoomMember ADD CONSTRAINT FKRoomMember473192 FOREIGN KEY (idRoom) REFERENCES Room (id);
ALTER TABLE Message ADD CONSTRAINT FKMessage755044 FOREIGN KEY (idRoomMember) REFERENCES RoomMember (id);
ALTER TABLE Message ADD CONSTRAINT FKMessage134951 FOREIGN KEY (idRoom) REFERENCES Room (id);
