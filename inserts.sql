--Media
INSERT INTO Media VALUES('M0001', 'Movie', 'Fast And Furious', to_date('01-02-1996', 'dd-mm-yyyy'), 1,199772, 'English', 'good movie');
INSERT INTO Media VALUES('M0002', 'Movie', 'John Wick', to_date('01-02-1997', 'dd-mm-yyyy'), 2,736363, 'Spanish', 'great one');
INSERT INTO Media VALUES('M0003', 'Movie', 'Finding Nemo', to_date('01-02-1998', 'dd-mm-yyyy'), 3,2378328, 'German', 'a fish movie');
INSERT INTO Media VALUES('M0005', 'Movie', 'Mission Impossible', to_date('01-02-1999', 'dd-mm-yyyy'), 4,88737, 'English', 'great action');
INSERT INTO Media VALUES('T0001', 'Episode', 'GOT2.2', to_date('01-02-1992', 'dd-mm-yyyy'), 5.5,44535, 'Spanish', 'Random People die');
INSERT INTO Media VALUES('T0002', 'Episode', 'BreakingBad', to_date('01-02-1995', 'dd-mm-yyyy'), 9,53737, 'German', 'Makes blue drugs');

--Movies
INSERT INTO Movies VALUES('M0001', 'G');
INSERT INTO Movies VALUES('M0002', 'PG');
INSERT INTO Movies VALUES('M0003', 'PG-13');
INSERT INTO Movies VALUES('M0005', 'R');

--TV Shows
INSERT INTO TV_Shows VALUES(0, 'Game of Thrones',7.9, '4');
INSERT INTO TV_Shows VALUES(1, 'Friends',4.5, '1');
INSERT INTO TV_Shows VALUES(2, 'Stranger Things',5.8, '4');
INSERT INTO TV_Shows VALUES(3, 'Narcos',8.6, '3');
INSERT INTO TV_Shows VALUES(4, 'Shooter',8.9, '5');
INSERT INTO TV_Shows VALUES(5, 'Arrow',7, '6');
INSERT INTO TV_Shows VALUES(6, 'Flash',7.2, '8');

--TV Episodes

--Genres
INSERT INTO Genres VALUES('M0001', 'Y', 'N', 'Y', 'Y', 'Y');
INSERT INTO Genres VALUES('M0002', 'Y', 'N', 'N', 'Y', 'N');
INSERT INTO Genres VALUES('M0003', 'N', 'N', 'N', 'Y', 'Y');
INSERT INTO Genres VALUES('M0005', 'N', 'Y', 'N', 'N', 'Y');
INSERT INTO Genres VALUES('T0001', 'N', 'N', 'N', 'N', 'Y');
INSERT INTO Genres VALUES('T0002', 'Y', 'Y', 'N', 'N', 'N');

--TV Genres
INSERT INTO TV_Genres VALUES(1, 'Y', 'N', 'Y', 'Y', 'Y');
INSERT INTO TV_Genres VALUES(2, 'Y', 'N', 'N', 'Y', 'N');
INSERT INTO TV_Genres VALUES(3, 'N', 'N', 'N', 'Y', 'Y');
INSERT INTO TV_Genres VALUES(4, 'N', 'Y', 'N', 'N', 'Y');
INSERT INTO TV_Genres VALUES(5, 'N', 'N', 'N', 'N', 'Y');
INSERT INTO TV_Genres VALUES(6, 'Y', 'Y', 'N', 'N', 'N');

--Industry Person
INSERT INTO Industry_Person VALUES(1, 'Jennifer', 'Garner');
INSERT INTO Industry_Person VALUES(2, 'Mark', 'Wahlberg');
INSERT INTO Industry_Person VALUES(3, 'Ben', 'Affleck');
INSERT INTO Industry_Person VALUES(4, 'Quentin', 'Tarantino');
INSERT INTO Industry_Person VALUES(5, 'Roger', 'Deakins');
INSERT INTO Industry_Person VALUES(6, 'James', 'Drake');
INSERT INTO Industry_Person VALUES(7, 'Stark', 'Drago');
INSERT INTO Industry_Person VALUES(8, 'Max', 'Coal');
INSERT INTO Industry_Person VALUES(9, 'Walter', 'White');
INSERT INTO Industry_Person VALUES(10, 'Carlton', 'Drake');

--Directs
INSERT INTO Directs VALUES(6, 'M0002');
INSERT INTO Directs VALUES(8, 'M0003');
INSERT INTO Directs VALUES(7,  'M0005');
INSERT INTO Directs VALUES(9, 'M0005');
INSERT INTO Directs VALUES(10, 'T0002');

--Awards
INSERT INTO Awards VALUES(1, 'Best Picture', 'Academy Awards', 2010, 'M0001');
INSERT INTO Awards VALUES(2, 'Best TV Episode', 'Golden Globes', 2020, 'T0002');
INSERT INTO Awards VALUES(3, 'Best Picture', 'Golden Globes', 2010, 'M0001');

--Subscriptions
INSERT INTO Subscriptions VALUES(1, 0, 'Y');
INSERT INTO Subscriptions VALUES(2, 4.99, 'N');
INSERT INTO Subscriptions VALUES(3, 9.99, 'Y');
INSERT INTO Subscriptions VALUES(4, 24.99, 'N');

--Accounts
INSERT INTO Accounts VALUES('A001', 'mdugan', 'ma@gmail.com', 2, 'Y', to_date('03-12-2022', 'dd-mm-yyyy'));
INSERT INTO Accounts VALUES('A002', 'watcher12', 'watch@gmail.com', 1, 'Y',to_date('03-08-2022', 'dd-mm-yyyy'));
INSERT INTO Accounts VALUES('A003', 'll33', 'Affleck@gmail.com', 3, 'N', to_date('03-12-2022', 'dd-mm-yyyy'));
INSERT INTO Accounts VALUES('A004', 'Quentin', 'Tarantino@gmail.com', 3, 'N', to_date('03-12-2022', 'dd-mm-yyyy'));
INSERT INTO Accounts VALUES('A005', 'Roger', 'Deakins@gmail.com', 4, 'Y', to_date('03-12-2022', 'dd-mm-yyyy'));--Profiles

--Profile
INSERT INTO Profile VALUES(1, 'A002', 'Bill', 21, 'M');
INSERT INTO Profile VALUES(2, 'A001', 'Marshall', 34, 'F');
INSERT INTO Profile VALUES(3, 'A003', 'Kate', 23, 'F');
INSERT INTO Profile VALUES(4, 'A005', 'Rodger', 56, 'M');
INSERT INTO Profile VALUES(5, 'A004', 'Quientin', 16, 'M');

--TV Show Awards
INSERT INTO TV_Show_Awards VALUES(1, 'Best Picture', 'Academy Awards', 2010, 0);
INSERT INTO TV_Show_Awards VALUES(2, 'Best TV Episode', 'Golden Globes', 2020, 1);
INSERT INTO TV_Show_Awards VALUES(3, 'Best Picture', 'Golden Globes', 2010, 1);
INSERT INTO TV_Show_Awards VALUES(4, 'Emmy', 'Television Academy', 2019, 2);
INSERT INTO TV_Show_Awards VALUES(5, 'OCCS', 'Prime Time ', 2002, 3);
INSERT INTO TV_Show_Awards VALUES(6, 'OCLS', 'Nobel', 2004, 3);

--Media Preferences
INSERT INTO Media_Preferences VALUES(1,'M0001', 'Y');
INSERT INTO Media_Preferences VALUES(1,'M0002', 'N');
INSERT INTO Media_Preferences VALUES(2,'M0003', 'Y');
INSERT INTO Media_Preferences VALUES(3,'M0005', 'N');
INSERT INTO Media_Preferences VALUES(3,'T0002', 'N');
INSERT INTO Media_Preferences VALUES(4,'M0001', 'Y');
INSERT INTO Media_Preferences VALUES(2,'M0002', 'Y');
INSERT INTO Media_Preferences VALUES(5,'T0001', 'Y');

--TV Preferences
INSERT INTO TV_Preferences VALUES(1,1, 'Y');
INSERT INTO TV_Preferences VALUES(1,2, 'N');
INSERT INTO TV_Preferences VALUES(2,2, 'Y');
INSERT INTO TV_Preferences VALUES(3,2, 'N');
INSERT INTO TV_Preferences VALUES(3,3, 'N');
INSERT INTO TV_Preferences VALUES(4,4, 'Y');
INSERT INTO TV_Preferences VALUES(2,4, 'Y');
INSERT INTO TV_Preferences VALUES(5,3, 'Y');

--Views


--Acts In
INSERT INTO ACTSIN VALUES(1, 'M0001');
INSERT INTO ACTSIN VALUES(2, 'M0001');
INSERT INTO ACTSIN VALUES(3,  'M0001');
INSERT INTO ACTSIN VALUES(4, 'M0003');
INSERT INTO ACTSIN VALUES(5, 'T0001');

