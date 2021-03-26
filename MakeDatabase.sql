CREATE TABLE  media  (
   mediaID  VARCHAR(8),
   mediaType  VARCHAR(7),
   
   PRIMARY KEY ( mediaID ),
   
   CHECK (mediaType IN ('Movie', 'Episode'))
);
