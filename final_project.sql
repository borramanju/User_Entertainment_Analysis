create database DMIT_Final_Project;
use DMIT_Final_Project;

CREATE TABLE entertainment_data (
  ID INT PRIMARY KEY,
  Name VARCHAR(255),
  Gender VARCHAR(255),
  Age INT,
  Favorite_Movie VARCHAR(255),
  Favorite_TV_Show VARCHAR(255),
  Preferred_Genre VARCHAR(255),
  Most_Used_Streaming_Platform VARCHAR(255),
  Weekly_Hours_Spent_Watching INT,
  Do_you_Binge_Watch VARCHAR(255)
);

INSERT INTO entertainment_data (ID, Name, Gender, Age, Favorite_Movie, Favorite_TV_Show, Preferred_Genre, Most_Used_Streaming_Platform, Weekly_Hours_Spent_Watching, Do_you_Binge_Watch) VALUES
(1, 'Likitha', 'Female', 24, 'Titanic', 'Game of Thrones', 'Romance', 'Netflix', 8, 'Sometimes'),
(2, 'Lahary', 'Female', 25, 'Gravity', 'Friends', 'Comedy', 'Netflix', 10, 'Yes'),
(3, 'Rene', 'Female', 21, 'Zindagi na mile doobara', 'Vampire Diaries', 'Action', 'Netflix', 25, 'Yes'),
(4, 'Roshini', 'Female', 26, 'Pulp Fiction', 'Friends', 'Action', 'Disney+', 12, 'Sometimes'),
(5, 'Niharika', 'Female', 24, 'Forrest Gump', 'Breaking Bad', 'Action', 'Prime Video', 6, 'Sometimes'),
(6, 'Deepak', 'Male', 24, 'The Dark Knight', 'Breaking Bad', 'Action', 'Netflix', 12, 'Sometimes'),
(7, 'Sree', 'Female', 22, 'Dil Chahta Hai', 'Mismatch', 'Romance', 'Prime Video', 18, 'Yes'),
(8, 'Mounica', 'Female', 28, 'Avengers End Game', 'Friends', 'Sci-Fi', 'Netflix', 12, 'Yes'),
(9, 'Saya', 'Female', 25, 'Tenet', 'The Vikings', 'Action', 'Hulu', 18, 'Yes'),
(10, 'Rishitha', 'Female', 21, 'Khaleja', 'Panchayath', 'Drama', 'YouTube', 6, 'No'),
(11, 'Sai Teja', 'Male', 25, 'Raguvaran btech', 'NA', 'Sci-Fi', 'Netflix', 18, 'Sometimes'),
(12, 'Vinodh', 'Male', 25, 'Jigarthanda duplex', 'Jabardasth', 'Action', 'Netflix', 48, 'No'),
(13, 'deepak', 'Male', 24, 'Brahmotsavam', 'breaking bad', 'Action', 'Netflix', 2, 'Sometimes'),
(14, 'Vinnu', 'Male', 24, 'Breaking bad', 'Bigboss', 'Action', 'YouTube', 24, 'Sometimes'),
(15, 'Kumar', 'Male', 25, '3', 'Super singers', 'Comedy', 'YouTube', 52, 'Yes'),
(16, 'Vinodh kumar', 'Male', 26, 'Mission impossible', 'Drama juniors', 'Horror', 'Prime Video', 56, 'No'),
(17, 'Skrillex', 'Male', 24, 'Dil bechara', 'Vampire diaries', 'Romance', 'YouTube', 24, 'Sometimes'),
(18, 'Shyam', 'Male', 25, 'Hi nanna', 'Star mahila', 'Romance', 'Prime Video', 84, 'Yes'),
(19, 'Chattumala vinodh kumar', 'Male', 25, 'KGF', 'Mayadipam', 'Action', 'Netflix', 90, 'Yes'),
(20, 'Teja', 'Male', 25, 'Debba Debba', 'Maya deppam', 'Horror', 'Disney+', 94, 'No'),
(21, 'Incognito', 'Male', 24, 'Shankar dada MBBS', 'Breaking bad', 'Romance', 'YouTube', 48, 'Sometimes'),
(22, 'shakila', 'Female', 35, 'shakila diaries', 'greem mancham', 'Romance', 'Hulu', 24, 'Yes'),
(23, 'Robo', 'Male', 22, 'Bahubali', 'Game of thrones', 'Action', 'Netflix', 22, 'Sometimes'),
(24, 'charan', 'Male', 24, 'manjus ras leela', 'rasa kreeda', 'Action', 'YouTube', 4, 'Yes'),
(25, 'charan', 'Male', 24, 'jersey', 'friends', 'Action', 'YouTube', 8, 'Yes'),
(26, 'chintu reddy', 'Female', 18, 'dhammu', 'dark', 'Comedy', 'Prime Video', 6, 'No');

select * from entertainment_data;

CREATE TABLE user_profile (
  ID INT PRIMARY KEY,
  Name VARCHAR(255),
  Age INT,
  Gender VARCHAR(255)
);

CREATE TABLE user_favorites (
  ID INT PRIMARY KEY,
  Favorite_Movie VARCHAR(255),
  Favorite_TV_Show VARCHAR(255),
  FOREIGN KEY (ID) REFERENCES user_profile(ID)
);

CREATE TABLE user_streaming (
  ID INT PRIMARY KEY,
  Most_Used_Streaming_Platform VARCHAR(255),
  Weekly_Hours_Spent_Watching INT,
  Do_you_Binge_Watch VARCHAR(255),
  FOREIGN KEY (ID) REFERENCES user_profile(ID)
);

CREATE TABLE user_genre_preference (
  ID INT PRIMARY KEY,
  Gender VARCHAR(255),
  Preferred_Genre VARCHAR(255),
  FOREIGN KEY (ID) REFERENCES user_profile(ID)
);


INSERT INTO user_profile (ID, Name, Age, Gender)
SELECT ID, Name, Age, Gender FROM entertainment_data;


INSERT INTO user_favorites (ID, Favorite_Movie, Favorite_TV_Show)
SELECT ID, Favorite_Movie, Favorite_TV_Show FROM entertainment_data;


INSERT INTO user_streaming (ID, Most_Used_Streaming_Platform, Weekly_Hours_Spent_Watching, Do_you_Binge_Watch)
SELECT ID, Most_Used_Streaming_Platform, Weekly_Hours_Spent_Watching, Do_you_Binge_Watch FROM entertainment_data;


INSERT INTO user_genre_preference (ID, Gender, Preferred_Genre)
SELECT ID, Gender, Preferred_Genre FROM entertainment_data;

select * from user_profile;
select * from user_favorites;
select * from user_genre_preference;
select * from user_streaming;

SELECT u.ID, u.Name, f.Favorite_Movie, f.Favorite_TV_Show
FROM user_profile u
JOIN user_favorites f ON u.ID = f.ID;


SELECT u.Name, u.Gender, g.Preferred_Genre, s.Most_Used_Streaming_Platform, s.Weekly_Hours_Spent_Watching
FROM user_profile u
JOIN user_streaming s ON u.ID = s.ID
JOIN user_genre_preference g ON u.ID = g.ID;


SELECT g.Preferred_Genre, AVG(s.Weekly_Hours_Spent_Watching) AS Avg_Hours
FROM user_genre_preference g
JOIN user_streaming s ON g.ID = s.ID
GROUP BY g.Preferred_Genre;

SELECT u.Name, s.Weekly_Hours_Spent_Watching,
  CASE 
    WHEN s.Weekly_Hours_Spent_Watching < 10 THEN 'Light Viewer'
    WHEN s.Weekly_Hours_Spent_Watching BETWEEN 10 AND 30 THEN 'Moderate Viewer'
    ELSE 'Heavy Viewer'
  END AS Viewing_Category
FROM user_profile u
JOIN user_streaming s ON u.ID = s.ID;


SELECT g.Gender, g.Preferred_Genre, COUNT(*) AS User_Count
FROM user_genre_preference g
GROUP BY g.Gender, g.Preferred_Genre
ORDER BY User_Count DESC;


CREATE VIEW view_binge_watchers AS
SELECT u.Name, s.Most_Used_Streaming_Platform
FROM user_profile u
JOIN user_streaming s ON u.ID = s.ID
WHERE s.Do_you_Binge_Watch = 'Yes';


SELECT * FROM view_binge_watchers;



SELECT Most_Used_Streaming_Platform, AVG(Weekly_Hours_Spent_Watching) AS Avg_Hours
FROM user_streaming
GROUP BY Most_Used_Streaming_Platform
ORDER BY Avg_Hours DESC;


SELECT Preferred_Genre, COUNT(*) AS User_Count
FROM user_genre_preference
GROUP BY Preferred_Genre
ORDER BY User_Count DESC;









