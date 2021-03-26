CREATE TABLE  media  (
   media_ID       VARCHAR(8),
   media_Type     VARCHAR(7),
   "NAME"        VARCHAR(60),
   Year_Released  DATE,
   Length_Seconds INTEGER,
   "LANGUAGE"    VARCHAR(20),
   "DESCRIPTION" VARCHAR(100),
   imdb_rating   DECIMAL(3,1),
   
   PRIMARY KEY ( media_ID ),
   
   CHECK (media_Type IN ('Movie', 'Episode')),
   CHECK ("LANGUAGE" IN ('English', 'Spanish', 'Hindi', 'German', 'French')),
   CHECK (imdb_rating <= 10)
);


-- Still need to add foreign key for genre_id
CREATE TABLE movies (
    media_id     VARCHAR(8),
    mpa_rating   VARCHAR(5),
    genre_id     INTEGER,
    
    FOREIGN KEY ( media_id ) REFERENCES media(media_id),
    
    CHECK (mpa_rating IN ('G', 'PG', 'PG-13', 'R', 'NR'))
);
