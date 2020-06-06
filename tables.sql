CREATE TABLE UsersTable (
  id                        int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  name                      nvarchar(20) NOT NULL, 
  lastName                  nvarchar(20) NOT NULL, 
  userName                  nvarchar(40) NOT NULL UNIQUE, 
  hash                      nvarchar(32) NOT NULL, 
  salt                      nvarchar(32) NOT NULL, 
  idLocation                int(10) UNSIGNED, 
  idProvinceZone 			int(10) UNSIGNED NOT NULL, 
  profileImage              int(10) UNSIGNED NOT NULL,
  state						nvarchar(20) NOT NULL comment 'active, pending email confirmation, inactive, etc',
  status                    bit NOT NULL, 
  registeredTime            datetime NOT NULL, 
  retiredTime               datetime NULL, 
  modificationTime          datetime NOT NULL, 
  PRIMARY KEY (id),   
  UNIQUE INDEX (id), 
  INDEX (idLocation), 
  INDEX (idProvinceZone), 
  UNIQUE INDEX (profileImage),
  INDEX (status)) engine=InnoDB;
CREATE TABLE Location (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  latitude         nvarchar(255) NOT NULL, 
  longitude        nvarchar(255) NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Field (
  id                    int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  name                  nvarchar(20) NOT NULL, 
  idFacility            int(10) UNSIGNED NOT NULL, 
  idType                int(10) UNSIGNED NOT NULL, 
  allowCancelation      bit NOT NULL, 
  automaticConfirmation bit NOT NULL, 
  deadline              nvarchar(5) NOT NULL comment 'formato HH:mm', 
  status                bit NOT NULL, 
  registeredTime        datetime NOT NULL, 
  retiredTime           datetime NULL, 
  modificationTime      datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idFacility), 
  INDEX (idType), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE FieldType (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  name             int(10) NOT NULL comment 'El nombre podría ser, futbol o paddle', 
  playerNumber     int(10) NOT NULL comment 'Cantidad de jugadores que entran en el capo', 
  description      nvarchar(255), 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Shift (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idField          int(10) UNSIGNED NOT NULL, 
  available        bit NOT NULL, 
  startTime        nvarchar(5) NOT NULL, 
  endTime          nvarchar(5) NOT NULL, 
  price            decimal(6,2) UNSIGNED NOT NULL, 
  `date`           nvarchar(10) NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idField), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Reservation (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idShift          int(10) UNSIGNED NOT NULL, 
  idUser           int(10) UNSIGNED NOT NULL,
  state            nvarchar(10) NOT NULL comment 'Si está pendiente, confirmada o rechazada', 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  UNIQUE INDEX (idShift), 
  INDEX (idUser), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Facility (
  id                        int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  name                      nvarchar(30) NOT NULL, 
  description               nvarchar(255), 
  idLocation                int(10) UNSIGNED NOT NULL, 
  idOwner                   int(10) UNSIGNED NOT NULL, 
  idProvinceZone 			int(10) UNSIGNED NOT NULL, 
  status                    bit NOT NULL, 
  registeredTime            datetime NOT NULL, 
  retiredTime               datetime NULL, 
  modificationTime          datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idLocation), 
  INDEX (idOwner), 
  INDEX (idProvinceZone), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Confirmation (
  id               	int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idReservation    	int(10) UNSIGNED NOT NULL,
  state            	nvarchar(10) NOT NULL comment 'Este estado se hace para tener una persistencia ante una posible baja de una reserva ya confirmada por el propietario.', 
  status           	bit NOT NULL, 
  registeredTime   	datetime NOT NULL, 
  retiredTime      	datetime NULL, 
  modificationTime 	datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  UNIQUE INDEX (idReservation), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Review (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idUser           int(10) UNSIGNED NOT NULL, 
  idFacility       int(10) UNSIGNED NOT NULL, 
  rating           int(10) NOT NULL, 
  comment          nvarchar(255), 
  anonymous        bit DEFAULT 1 NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idUser), 
  INDEX (idFacility), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Image (
  id             int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  url            nvarchar(255) NOT NULL UNIQUE, 
  alt            nvarchar(50), 
  status         bit NOT NULL, 
  registeredTime datetime NOT NULL, 
  retiredTime    datetime NULL, 
  moficationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Province (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  name             nvarchar(10) NOT NULL UNIQUE, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE ProvinceZone (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idProvince       int(10) UNSIGNED NOT NULL, 
  name             nvarchar(255) NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idProvince), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Community (
  id                 int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  name               nvarchar(20) NOT NULL, 
  description        nvarchar(255), 
  automaticAdmission bit NOT NULL, 
  status             bit NOT NULL, 
  registeredTime     datetime NOT NULL, 
  retiredTime        datetime NULL, 
  modificationTime   datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE AdmissionRequest (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idUser           int(10) UNSIGNED NOT NULL, 
  idCommunity      int(10) UNSIGNED NOT NULL, 
  state            bit NOT NULL comment 'abierto o cerrado', 
  message          nvarchar(255), 
  resolved         nvarchar(10) comment 'Cómo se resolvió la admisión', 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idUser), 
  INDEX (idCommunity), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE CommunityMember (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idCommunity      int(10) UNSIGNED NOT NULL, 
  idUser           int(10) UNSIGNED NOT NULL, 
  communityAdmin   bit NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idCommunity), 
  INDEX (idUser), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Post (
  id                int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  title             nvarchar(50) NOT NULL, 
  message           nvarchar(255) NOT NULL, 
  idCommunityMember int(10) UNSIGNED NOT NULL, 
  idCommunity       int(10) UNSIGNED NOT NULL, 
  postAsFacility    bit NOT NULL, 
  status            bit NOT NULL, 
  registeredTime    datetime NOT NULL, 
  retiredTime       datetime NULL, 
  modificationTime  datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idCommunityMember), 
  INDEX (idCommunity), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Answer (
  id                int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idPost            int(10) UNSIGNED NOT NULL, 
  idCommunityMember int(10) UNSIGNED NOT NULL, 
  postAsFacility    bit NOT NULL, 
  status            bit NOT NULL, 
  registeredTime    datetime NOT NULL, 
  retiredTime       datetime NULL, 
  modificationTime  datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idPost), 
  INDEX (idCommunityMember), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Reaction (
  id                int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idPost            int(10) UNSIGNED NOT NULL, 
  idCommunityMember int(10) UNSIGNED NOT NULL, 
  idReactionType    int(10) UNSIGNED NOT NULL, 
  status            bit NOT NULL, 
  registeredTime    datetime NOT NULL, 
  retiredTime       datetime NULL, 
  modificationTime  datetime NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (idPost), 
  INDEX (idCommunityMember), 
  INDEX (idReactionType), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE ReactionType (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  name             nvarchar(10) NOT NULL UNIQUE, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Favourites (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idUser           int(10) UNSIGNED NOT NULL, 
  idFacility       int(10) UNSIGNED NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idUser), 
  INDEX (idFacility), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Notification (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  title            nvarchar(50) NOT NULL, 
  message          nvarchar(255) NOT NULL, 
  cause            nvarchar(255) NOT NULL, 
  idUser           int(10) UNSIGNED NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idUser), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Room (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  name             nvarchar(50) NOT NULL, 
  idRoomType       int(10) NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idRoomType), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE RommType (
  id               int(10) NOT NULL AUTO_INCREMENT, 
  name             nvarchar(10) NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE RoomMember (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idUser           int(10) UNSIGNED NOT NULL, 
  idRoom           int(10) UNSIGNED NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idUser), 
  INDEX (idRoom), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE Message (
  id               int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
  idRoomMember     int(10) UNSIGNED NOT NULL, 
  idRoom           int(10) UNSIGNED NOT NULL, 
  message          nvarchar(255) NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idRoomMember), 
  INDEX (idRoom), 
  INDEX (status))  engine=InnoDB;
CREATE TABLE FacilityImage (
  id               int(10) UNSIGNED NOT NULL, 
  idImage          int(10) UNSIGNED NOT NULL, 
  idFacility       int(10) UNSIGNED NOT NULL, 
  status           bit NOT NULL, 
  registeredTime   datetime NOT NULL, 
  retiredTime      datetime NULL, 
  modificationTime datetime NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id), 
  INDEX (idImage), 
  INDEX (idFacility), 
  INDEX (status))  engine=InnoDB;
ALTER TABLE UsersTable ADD CONSTRAINT FK_UsersTable_Location FOREIGN KEY (idLocation) REFERENCES Location (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Field ADD CONSTRAINT FK_Field_FieldType FOREIGN KEY (idType) REFERENCES FieldType (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Field ADD CONSTRAINT FK_Field_Facility FOREIGN KEY (idFacility) REFERENCES Facility (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Facility ADD CONSTRAINT FK_Facility_Location FOREIGN KEY (idLocation) REFERENCES Location (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Facility ADD CONSTRAINT FK_Facility_UsersTable FOREIGN KEY (idOwner) REFERENCES UsersTable (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Reservation ADD CONSTRAINT FK_Reservation_UsersTable FOREIGN KEY (idUser) REFERENCES UsersTable (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Reservation ADD CONSTRAINT FK_Reservation_Shift FOREIGN KEY (idShift) REFERENCES Shift (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Confirmation ADD CONSTRAINT FK_Confirmation_Reservation FOREIGN KEY (idReservation) REFERENCES Reservation (id) ;
ALTER TABLE Review ADD CONSTRAINT FK_Review_UsersTable FOREIGN KEY (idUser) REFERENCES UsersTable (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Review ADD CONSTRAINT FK_Review_Facility FOREIGN KEY (idFacility) REFERENCES Facility (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE ProvinceZone ADD CONSTRAINT FK_ZonaDepartamentoPartido_Province FOREIGN KEY (idProvince) REFERENCES Province (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE UsersTable ADD CONSTRAINT FK_UsersTable_ZonaDepartamentoPartido FOREIGN KEY (idProvinceZone) REFERENCES ProvinceZone (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Facility ADD CONSTRAINT FK_Facility_ZonaDepartamentoPartido FOREIGN KEY (idProvinceZone) REFERENCES ProvinceZone (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE UsersTable ADD CONSTRAINT FK_UsersTable_Image FOREIGN KEY (profileImage) REFERENCES Image (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Shift ADD CONSTRAINT FK_Shift_Field FOREIGN KEY (idField) REFERENCES Field (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE AdmissionRequest ADD CONSTRAINT FK_Admission_UsersTable FOREIGN KEY (idUser) REFERENCES UsersTable (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE AdmissionRequest ADD CONSTRAINT FK_Admission_Community FOREIGN KEY (idCommunity) REFERENCES Community (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE CommunityMember ADD CONSTRAINT FK_CommunityMember_Community FOREIGN KEY (idCommunity) REFERENCES Community (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE CommunityMember ADD CONSTRAINT FK_CommunityMember_UsersTable FOREIGN KEY (idUser) REFERENCES UsersTable (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Post ADD CONSTRAINT FK_Post_Community FOREIGN KEY (idCommunity) REFERENCES Community (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Post ADD CONSTRAINT FK_Post_CommunityMember FOREIGN KEY (idCommunityMember) REFERENCES CommunityMember (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Answer ADD CONSTRAINT FK_Answer_Post FOREIGN KEY (idPost) REFERENCES Post (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Answer ADD CONSTRAINT FK_Answer_CommunityMember FOREIGN KEY (idCommunityMember) REFERENCES CommunityMember (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Reaction ADD CONSTRAINT FK_Reaction_Post FOREIGN KEY (idPost) REFERENCES Post (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Reaction ADD CONSTRAINT FK_Reaction_CommunityMember FOREIGN KEY (idCommunityMember) REFERENCES CommunityMember (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Reaction ADD CONSTRAINT FK_Reaction_ReactionType FOREIGN KEY (idReactionType) REFERENCES ReactionType (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Favourites ADD CONSTRAINT FK_Favourites_UsersTable FOREIGN KEY (idUser) REFERENCES UsersTable (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Favourites ADD CONSTRAINT FK_Favourites_Facility FOREIGN KEY (idFacility) REFERENCES Facility (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Notification ADD CONSTRAINT FK_Notification_UsersTable FOREIGN KEY (idUser) REFERENCES UsersTable (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Room ADD CONSTRAINT FK_Room_RoomType FOREIGN KEY (idRoomType) REFERENCES RommType (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE RoomMember ADD CONSTRAINT FK_RoomMember_UsersTable FOREIGN KEY (idUser) REFERENCES UsersTable (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE RoomMember ADD CONSTRAINT FK_RoomMember_Room FOREIGN KEY (idRoom) REFERENCES Room (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Message ADD CONSTRAINT FK_Message_RoomMember FOREIGN KEY (idRoomMember) REFERENCES RoomMember (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE Message ADD CONSTRAINT FK_Message_Room FOREIGN KEY (idRoom) REFERENCES Room (id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE FacilityImage ADD CONSTRAINT FKFacilityImage_Image FOREIGN KEY (idImage) REFERENCES Image (id);
ALTER TABLE FacilityImage ADD CONSTRAINT FKFacilityImage_Facility FOREIGN KEY (idFacility) REFERENCES Facility (id);

