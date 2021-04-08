DROP TABLE Movies;
DROP TABLE TV_Shows;
DROP TABLE TV_Episodes;
DROP TABLE Industry_Person;
DROP TABLE Directs;
DROP TABLE Awards;

CREATE TABLE Movies (
   Media_ID  NUMBER(10) PRIMARY KEY,
   Name VARCHAR(50),
   Year_Released NUMBER(4),
   IMDB_Rating NUMBER(5),
   MPA_Rating NUMBER(5),
   Genre_ID NUMBER(10) NOT NULL,
   Length NUMBER(6),
   Language VARCHAR(20),
   Description VARCHAR(300),
   
   FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID),
   CHECK (Year_Release > 1880)
);

CREATE TABLE TV_Shows (
   TV_Show_ID  NUMBER(10) PRIMARY KEY,
   Name VARCHAR(50),
   IMDB_Rating NUMBER(5),
   Genre_ID NUMBER(10) NOT NULL,
   Description VARCHAR(300),
   
   FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID)
);

CREATE TABLE TV_Episodes (
   Media_ID NUMBER(10) PRIMARY KEY,
   TV_Show_ID NUMBER(10),
   Name VARCHAR(50),
   Year_Released NUMBER(4),
   IMDB_Rating NUMBER(5),
   TV_Parental_Guidelines VARCHAR(4),
   Length NUMBER(6),
   Language VARCHAR(20),
   Description VARCHAR(300),
   Season_Number NUMBER(3),
   Season_Episode_Number NUMBER(3),

   CHECK (Year_Released > 1880)  
);

CREATE TABLE Industry_Person (
   Industry_Person_ID NUMBER(10) PRIMARY KEY,
   first_Name VARCHAR(20) NOT NULL,
   last_Name VARCHAR(20) NOT NULL
);

CREATE TABLE Directs (
   Industry_Person_ID NUMBER(10) NOT NULL,
   Media_ID NUMBER(10) NOT NULL,

   FOREIGN KEY (Industry_Person_ID) REFERENCES Industry_Person(Industry_Person_ID),
   FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID)
);

CREATE TABLE Awards (
   Award_ID NUMBER(10) PRIMARY KEY,
   Award_Title VARCHAR(50),
   Name_of_Organization VARCHAR(50),
   Year_of_Award NUMBER(4),
   Media_ID NUMBER(10) NOT NULL,

   FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID),
   CHECK (Year_of_Award > 1880)
);

-- Assume a subscription can only be charged monthly or yearly
CREATE TABLE subscriptions (
    subscription_id  VARCHAR(1),
    "COST"           DECIMAL(5,2),
    charged_annually CHAR(1),
    
    PRIMARY KEY (subscription_id)
);

CREATE TABLE accounts (
    account_id       VARCHAR(10),
    username         VARCHAR(20),
    email            VARCHAR(40),
    subscription_id  VARCHAR(1),
    auto_renewal     CHAR(1),
    expiration_date  DATE,
    
    PRIMARY KEY (account_id),
    
    FOREIGN KEY ( subscription_id ) REFERENCES subscriptions(subscription_id)
);
CREATE TABLE Genres (
                        Genre_ID  NUMBER(10) PRIMARY KEY,
                        Comedy CHAR(1) ,
                        Action CHAR(1) ,
                        Romance CHAR(1) ,
                        Horror CHAR(1),
                        Drama CHAR(1),
                        check (Comedy = 'Y' or comedy = 'N'),
                        check (Action = 'Y' or Action = 'N'),
   check (Romance = 'Y' or Romance = 'N'),
   check (Horror = 'Y' or Horror = 'N'),
   check (Drama = 'Y' or Drama = 'N')
);

CREATE TABLE Profile (
                         Profile_id       NUMBER(10) PRIMARY KEY,
                         subscription_ID  VARCHAR(1),
                         Name            VARCHAR(40),
                         Age            INT,
                         Gender          CHAR(5),
                         check (gender in ('M', 'F', 'OTHER')),
                         check (Age in (5, 100)),
                         FOREIGN KEY ( subscription_id ) REFERENCES subscriptions(subscription_id)
);



CREATE TABLE TV_Show_Awards (
                                TVAward_ID NUMBER(10) PRIMARY KEY,
                                Award_Title VARCHAR(50),
                                Name_of_Organization VARCHAR(50),
                                Year_of_Award NUMBER(4),
                                TV_show_ID NUMBER(10) NOT NULL,

                                FOREIGN KEY (TV_show_ID) REFERENCES TV_Shows(TV_show_ID),
                                CHECK (Year_of_Award > 1880)
);


CREATE TABLE Media_Preferences (
                                   Profile_ID NUMBER(10),
                                   Media_ID NUMBER(10),
                                   liked CHAR(1),
                                   check (liked = 'Y' or Liked = 'N'),
                                   FOREIGN KEY (Profile_ID) REFERENCES Profile(Profile_ID),
                                   FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID)
);

CREATE TABLE TV_Preferences (
                                Profile_ID NUMBER(10),
                                TV_Show_ID NUMBER(10),
                                liked CHAR(1),
                                check (liked = 'Y' or Liked = 'N'),
                                FOREIGN KEY (Profile_ID) REFERENCES Profile(Profile_ID),
                                FOREIGN KEY (TV_Show_ID) REFERENCES TV_shows(TV_Show_ID)
);


create table views (
                       View_ID Number(10) primary key,
                       Profile_ID NUMBER(10),
                       Media_ID NUMBER(10),
                       TV_Show_ID NUMBER(10),
                       view_date Date,
                       View_time Time,
                       Location VARCHAR(50),
                       houres_watched time,
                       FOREIGN KEY (Profile_ID) REFERENCES Profile(Profile_ID),
                       FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID),
                       FOREIGN KEY (TV_Show_ID) REFERENCES TV_shows(TV_Show_ID)

);

CREATE TABLE ActsIn (
                        Industry_Person_ID NUMBER(10) NOT NULL,
                        Media_ID NUMBER(10) NOT NULL,

                        FOREIGN KEY (Industry_Person_ID) REFERENCES Industry_Person(Industry_Person_ID),
                        FOREIGN KEY (Media_ID) REFERENCES Movies(Media_ID)
);
