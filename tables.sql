-- Should work in this order
DROP TABLE Accounts;
DROP TABLE TV_Show_Awards;
DROP Table Media_Preferences;
DROP TABLE TV_Preferences;
DROP TABLE Views;
DROP TABLE ActsIn;
DROP TABLE Directs;
DROP TABLE Awards;
DROP TABLE Profile;
DROP TABLE Subscriptions;
DROP TABLE Industry_Person;
DROP TABLE TV_Episodes;
DROP TABLE TV_Shows;
DROP TABLE Movies;
DROP TABLE Genres;


CREATE TABLE Genres (
    Genre_ID  NUMBER(10) PRIMARY KEY,
    Comedy    CHAR(1) ,
    Action    CHAR(1) ,
    Romance   CHAR(1) ,
    Horror    CHAR(1),
    Drama     CHAR(1),

    check (Comedy = 'Y' or comedy = 'N'),
    check (Action = 'Y' or Action = 'N'),
    check (Romance = 'Y' or Romance = 'N'),
    check (Horror = 'Y' or Horror = 'N'),
    check (Drama = 'Y' or Drama = 'N')
);


CREATE TABLE Movies (
    Media_ID      NUMBER(10)   PRIMARY KEY,
    Name          VARCHAR(50),
    Year_Released NUMBER(4),
    IMDB_Rating   NUMBER(5),
    MPA_Rating    NUMBER(5),
    Genre_ID      NUMBER(10)   NOT NULL,
    Length        NUMBER(6),
    Language      VARCHAR(20),
    Description   VARCHAR(300),
   
    FOREIGN KEY (Genre_ID) REFERENCES Genres(Genre_ID),

    CHECK (Year_Released > 1880)
);


CREATE TABLE TV_Shows (
    TV_Show_ID  NUMBER(10)    PRIMARY KEY,
    Name        VARCHAR(50),
    IMDB_Rating NUMBER(5),
    Genre_ID    NUMBER(10)    NOT NULL,
    Description VARCHAR(300),
   
    FOREIGN KEY (Genre_ID) REFERENCES Genres(Genre_ID)
);


CREATE TABLE TV_Episodes (
    Media_ID               NUMBER(10)   PRIMARY KEY,
    TV_Show_ID             NUMBER(10),
    Name                   VARCHAR(50),
    Year_Released          NUMBER(4),
    IMDB_Rating            NUMBER(5),
    TV_Parental_Guidelines VARCHAR(4),
    Length                 NUMBER(6),
    Language               VARCHAR(20),
    Description            VARCHAR(300),
    Season_Number          NUMBER(3),
    Season_Episode_Number  NUMBER(3),

    CHECK (Year_Released > 1880)  
);


CREATE TABLE Industry_Person (
    Industry_Person_ID NUMBER(10)  PRIMARY KEY,
    first_Name         VARCHAR(20) NOT NULL,
    last_Name          VARCHAR(20) NOT NULL
);


CREATE TABLE Directs (
    Industry_Person_ID NUMBER(10) NOT NULL,
    Media_ID           NUMBER(10) NOT NULL,

    FOREIGN KEY (Industry_Person_ID) REFERENCES Industry_Person(Industry_Person_ID),
    FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID)
);


CREATE TABLE Awards (
    Award_ID             NUMBER(10)    PRIMARY KEY,
    Award_Title          VARCHAR(50),
    Name_of_Organization VARCHAR(50),
    Year_of_Award        NUMBER(4),
    Media_ID             NUMBER(10)    NOT NULL,

    FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID),

    CHECK (Year_of_Award > 1880)
);


-- Assume a subscription can only be charged monthly or yearly
CREATE TABLE Subscriptions (
    Subscription_ID  VARCHAR(1)    PRIMARY KEY,
    Cost             DECIMAL(5,2),
    Charged_Annually CHAR(1)
);


CREATE TABLE Accounts (
    Account_ID       VARCHAR(10)   PRIMARY KEY,
    Username         VARCHAR(20),
    Email            VARCHAR(40),
    Subscription_ID  VARCHAR(1),
    Auto_Renewal     CHAR(1),
    Expiration_Date  DATE,
    
    FOREIGN KEY ( Subscription_ID ) REFERENCES Subscriptions(Subscription_ID)
);


CREATE TABLE Profile (
    Profile_ID       NUMBER(10)   PRIMARY KEY,
    Subscription_ID  VARCHAR(1),
    Name             VARCHAR(40),
    Age              INT,
    Gender           CHAR(5),

    FOREIGN KEY ( Subscription_ID ) REFERENCES Subscriptions(Subscription_ID),

    check (Gender in ('M', 'F', 'OTHER')),
    check (Age in (5, 100))
);



CREATE TABLE TV_Show_Awards (
    TVAward_ID           NUMBER(10)   PRIMARY KEY,
    Award_Title          VARCHAR(50),
    Name_of_Organization VARCHAR(50),
    Year_of_Award        NUMBER(4),
    TV_show_ID           NUMBER(10)    NOT NULL,

    FOREIGN KEY (TV_show_ID) REFERENCES TV_Shows(TV_show_ID),

    CHECK (Year_of_Award > 1880)
);


CREATE TABLE Media_Preferences (
    Profile_ID NUMBER(10),
    Media_ID   NUMBER(10),
    Liked      CHAR(1),

    FOREIGN KEY (Profile_ID) REFERENCES Profile(Profile_ID),
    FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID),

    check (Liked = 'Y' or Liked = 'N')
);

CREATE TABLE TV_Preferences (
    Profile_ID NUMBER(10),
    TV_Show_ID NUMBER(10),
    liked      CHAR(1),

    FOREIGN KEY (Profile_ID) REFERENCES Profile(Profile_ID),
    FOREIGN KEY (TV_Show_ID) REFERENCES TV_Shows(TV_Show_ID),

    check (liked = 'Y' or Liked = 'N')
);


create table Views (
    View_ID        NUMBER(10)  PRIMARY KEY,
    Profile_ID     NUMBER(10),
    Media_ID       NUMBER(10),
    TV_Show_ID     NUMBER(10),
    View_Date      DATE,
    View_Time      NUMBER(7),
    Location       VARCHAR(50),
    Hours_Watched  NUMBER(7),
    FOREIGN KEY (Profile_ID) REFERENCES Profile(Profile_ID),
    FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID),
    FOREIGN KEY (TV_Show_ID) REFERENCES TV_Shows(TV_Show_ID)
);

CREATE TABLE ActsIn (
    Industry_Person_ID NUMBER(10) NOT NULL,
    Media_ID           NUMBER(10) NOT NULL,

    FOREIGN KEY (Industry_Person_ID) REFERENCES Industry_Person(Industry_Person_ID),
    FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID)
);
