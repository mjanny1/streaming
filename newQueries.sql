select * from movies;

select * from accounts;

select * from Subscriptions;

select * from Media;

select * from profile;

select * from genres;

select * from TV_shows;

select * from awards;

select * from industry_person;

Select * from actsin;

Select * from Directs;

select * from TV_show_awards;

select * from tv_genres;

select * from media_preferences;

select * from tv_preferences;

--Movies available;
Select media.Name as Movie_Name, media.Length_seconds, media.description, media.IMDB_rating, Movies.MPA_rating from media inner join movies on media.media_id = movies.media_id;

--Movies with IMDB rating greater than 5
Select media.Name as Movie_Name, media.Length_seconds, media.description, media.IMDB_rating, Movies.MPA_rating from media inner join movies on media.media_id = movies.media_id where media.media_id like 'M%'and media.imdb_rating > 5;

--Movies sorted by IMDB rating
Select media.Name as Movie_Name, media.Length_seconds, media.description, media.IMDB_rating, Movies.MPA_rating from media inner join movies on media.media_id = movies.media_id where media.media_id like 'M%' order by media.imdb_rating;

--Tv Shows available
Select name as TV_show_name, seasons, imdb_rating from tv_shows;

--Tv Shows available with filter
Select name as TV_show_name, seasons, imdb_rating from tv_shows order by imdb_rating desc;

--List of directors name
select media.Name, media.media_type,industry_person.first_name as Director_FirstName,industry_person.last_name as Director_LastName, media.length_seconds from media inner join directs on media.media_id = directs.media_id inner join industry_person on directs.industry_person_id = industry_person.industry_person_id;

--Director of one particular movie
select media.Name, media.media_type,industry_person.first_name as Director_FirstName,industry_person.last_name as Director_LastName, media.length_seconds from media inner join directs on media.media_id = directs.media_id inner join industry_person on directs.industry_person_id = industry_person.industry_person_id where media.name = 'Iron Man';

--list of actors
select media.Name, media.media_type,industry_person.first_name as Actors_FirstName,industry_person.last_name as Actors_LastName, media.length_seconds from media inner join actsin on media.media_id = actsin.media_id inner join industry_person on actsin.industry_person_id = industry_person.industry_person_id;

--Actors in one particular movie
select media.Name, media.media_type,industry_person.first_name as Actors_FirstName,industry_person.last_name as Actors_LastName, media.length_seconds from media inner join actsin on media.media_id = actsin.media_id inner join industry_person on actsin.industry_person_id = industry_person.industry_person_id where media.name = 'Fast And Furious';

--To fetch the email and username associated with account
select Email, username from accounts where account_id = 'A002';

--As a streaming service subscriber, I want to know the cost of my subscription and the frequency in which the charges occur (monthly or yearly) so that I can better manage my money.
select accounts.account_id,accounts.auto_renewal,subscriptions.cost,subscriptions.charged_annually,accounts.expiration_date from accounts inner join subscriptions on accounts.subscription_id = subscriptions.subscription_id where account_id = 'A002';

--As a streaming service subscriber, I want to know if the movie or tv show won any awards.
select media.media_id,media.name,awards.award_title,awards.name_of_organization from media inner join awards on media.media_id = awards.media_id where media.name = 'BreakingBad';

--As a streaming service subscriber, I want to know the rating of a movie or tv show (i.e. PG-13, R, etc.)
select media.name, movies.mpa_rating from media inner join movies on media.media_id = movies.media_id where media.name = 'The Incredible Hulk';

--finding genres of media
select media.name, genres.action, genres.comedy, genres.drama, genres.horror, genres.romance from media inner join genres on media.media_id = genres.media_id where media.name = 'Mission Impossible';

--episodes of a tv_show
select ep.season_number, ep.season_episode_number, m.name as episode_name, m.length_seconds, m.description
from tv_episodes ep join tv_shows ts
on ep.tv_show_id = ts.tv_show_id
join media m
on m.media_id = ep.media_id
where ts.name = 'Game of Thrones';