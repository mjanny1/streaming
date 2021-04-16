-- Should work in this order
DROP TABLE TV_Show_Awards;
DROP Table Media_Preferences;
DROP TABLE TV_Preferences;
DROP TABLE Views;
DROP TABLE ActsIn;
DROP TABLE Directs;
DROP TABLE Awards;
DROP TABLE Profile;
DROP TABLE Industry_Person;
DROP TABLE TV_Episodes;
DROP TABLE TV_Shows;
DROP TABLE Movies;
DROP TABLE Genres;
DROP TABLE Accounts;
DROP TABLE Subscriptions;


CREATE TABLE Genres (
    Genre_ID  NUMBER(10) PRIMARY KEY,
    Comedy    CHAR(1)    NOT NULL,
    Action    CHAR(1)    NOT NULL,
    Romance   CHAR(1)    NOT NULL,
    Horror    CHAR(1)    NOT NULL,
    Drama     CHAR(1)    NOT NULL,

    check (Comedy = 'Y' or comedy = 'N'),
    check (Action = 'Y' or Action = 'N'),
    check (Romance = 'Y' or Romance = 'N'),
    check (Horror = 'Y' or Horror = 'N'),
    check (Drama = 'Y' or Drama = 'N')
);


CREATE TABLE Movies (
    Media_ID      NUMBER(10)   PRIMARY KEY,
    Name          VARCHAR(50)  NOT NULL,
    Date_Released DATE         NOT NULL,
    IMDB_Rating   DECIMAL(3,1),
    MPA_Rating    NUMBER(5)    NOT NULL,
    Genre_ID      NUMBER(10)   NOT NULL,
    Length        NUMBER(6)    NOT NULL,
    Language      VARCHAR(20)  NOT NULL,
    Description   VARCHAR(300),

    FOREIGN KEY (Genre_ID) REFERENCES Genres(Genre_ID),

    --CHECK (Date_Released > '1880-01-01'),
    CHECK (Language IN ('English', 'Spanish', 'Hindi', 'German', 'French')),
    CHECK (IMDB_Rating <= 10),
    CHECK (MPA_Rating IN ('G', 'PG', 'PG-13', 'R', 'NR'))
);


CREATE TABLE TV_Shows (
    TV_Show_ID  NUMBER(10)    PRIMARY KEY,
    Name        VARCHAR(50)   NOT NULL,
    IMDB_Rating DECIMAL(3,1),
    Genre_ID    NUMBER(10)    NOT NULL,
    Description VARCHAR(300),
    Seasons     INTEGER       NOT NULL,

    FOREIGN KEY (Genre_ID) REFERENCES Genres(Genre_ID),

    CHECK (IMDB_Rating <= 10)
);


CREATE TABLE TV_Episodes (
    Media_ID               NUMBER(10)   PRIMARY KEY,
    TV_Show_ID             NUMBER(10)   NOT NULL,
    Name                   VARCHAR(50),
    Date_Released          DATE         NOT NULL,
    IMDB_Rating            DECIMAL(3,1),
    TV_Parental_Guidelines VARCHAR(4)   NOT NULL,
    Length                 NUMBER(6)    NOT NULL,
    Language               VARCHAR(20)  NOT NULL,
    Description            VARCHAR(300),
    Season_Number          INTEGER      NOT NULL,
    Season_Episode_Number  INTEGER      NOT NULL,

    FOREIGN KEY (TV_Show_ID) REFERENCES TV_Shows(TV_Show_ID),

    --CHECK (Date_Released > '1880-01-01'),
    CHECK (IMDB_Rating <= 10),
    CHECK (TV_Parental_Guidelines IN ('TV-Y', 'TV-Y7', 'TV-G', 'TV-PG', 'TV-14', 'TV-MA')),
    CHECK (Language IN ('English', 'Spanish', 'Hindi', 'German', 'French'))
    --CHECK (Season_Number <= TV_Shows.Seasons)
);


CREATE TABLE Industry_Person (
    Industry_Person_ID NUMBER(10)  PRIMARY KEY,
    First_Name         VARCHAR(20) NOT NULL,
    Last_Name          VARCHAR(20) NOT NULL
);


CREATE TABLE Directs (
    Industry_Person_ID NUMBER(10) NOT NULL,
    Media_ID           NUMBER(10) NOT NULL,

    FOREIGN KEY (Industry_Person_ID) REFERENCES Industry_Person(Industry_Person_ID),
    FOREIGN KEY (Media_ID)           REFERENCES Movies(Media_ID)
);


CREATE TABLE Awards (
    Award_ID             NUMBER(10)    PRIMARY KEY,
    Award_Title          VARCHAR(50)   NOT NULL,
    Name_of_Organization VARCHAR(50)   NOT NULL,
    Year_of_Award        NUMBER(4)     NOT NULL,
    Media_ID             NUMBER(10)    NOT NULL,

    FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID),

    CHECK (Year_of_Award > 1880)
);


-- Assume a subscription can only be charged monthly or yearly
CREATE TABLE Subscriptions (
    Subscription_ID  VARCHAR(1)    PRIMARY KEY,
    Cost             DECIMAL(5,2)  NOT NULL,
    Charged_Annually CHAR(1)       NOT NULL
);


CREATE TABLE Accounts (
    Account_ID       VARCHAR(10)   PRIMARY KEY,
    Username         VARCHAR(20)   NOT NULL,
    Email            VARCHAR(40)   NOT NULL,
    Subscription_ID  VARCHAR(1)    NOT NULL,
    Auto_Renewal     CHAR(1)       NOT NULL,
    Expiration_Date  DATE          NOT NULL,
    
    FOREIGN KEY ( Subscription_ID ) REFERENCES Subscriptions(Subscription_ID)
);


CREATE TABLE Profile (
    Profile_ID       NUMBER(10)   PRIMARY KEY,
    Account_ID       VARCHAR(10)  NOT NULL,
    Name             VARCHAR(40)  NOT NULL,
    Age              INTEGER,
    Gender           CHAR(5),

    FOREIGN KEY ( Account_ID ) REFERENCES Accounts(Account_ID),

    check (Gender in ('M', 'F', 'OTHER')),
    check (Age in (5, 100))
);



CREATE TABLE TV_Show_Awards (
    TVAward_ID           NUMBER(10)   PRIMARY KEY,
    Award_Title          VARCHAR(50)  NOT NULL,
    Name_of_Organization VARCHAR(50)  NOT NULL,
    Year_of_Award        NUMBER(4)    NOT NULL,
    TV_show_ID           NUMBER(10)   NOT NULL,

    FOREIGN KEY (TV_show_ID) REFERENCES TV_Shows(TV_show_ID),

    CHECK (Year_of_Award > 1880)
);


CREATE TABLE Media_Preferences (
    Profile_ID NUMBER(10)  NOT NULL,
    Media_ID   NUMBER(10)  NOT NULL,
    Liked      CHAR(1),

    FOREIGN KEY (Profile_ID) REFERENCES Profile(Profile_ID),
    FOREIGN KEY (Media_ID)   REFERENCES Movies(Media_ID),

    check (Liked = 'Y' or Liked = 'N')
);

CREATE TABLE TV_Preferences (
    Profile_ID NUMBER(10)  NOT NULL,
    TV_Show_ID NUMBER(10)  NOT NULL,
    liked      CHAR(1),

    FOREIGN KEY (Profile_ID) REFERENCES Profile(Profile_ID),
    FOREIGN KEY (TV_Show_ID) REFERENCES TV_Shows(TV_Show_ID),

    check (liked = 'Y' or Liked = 'N')
);


CREATE TABLE Views (
    View_ID          NUMBER(10)  PRIMARY KEY,
    Profile_ID       NUMBER(10)  NOT NULL,
    Media_ID         NUMBER(10)  NOT NULL,
    Time             DATE        NOT NULL,
    Location         VARCHAR(50),
    Seconds_Watched  INTEGER     NOT NULL,

    FOREIGN KEY (Profile_ID) REFERENCES Profile(Profile_ID),
    FOREIGN KEY (Media_ID)   REFERENCES Movies(Media_ID)
);

CREATE TABLE ActsIn (
    Industry_Person_ID NUMBER(10) NOT NULL,
    Media_ID           NUMBER(10) NOT NULL,

    FOREIGN KEY (Industry_Person_ID) REFERENCES Industry_Person(Industry_Person_ID),
    FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID)
);
