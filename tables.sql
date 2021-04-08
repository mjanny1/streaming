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
