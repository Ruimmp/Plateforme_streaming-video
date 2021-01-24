-- -----------------------------------------------------
-- Projet :			Plateforme de streaming (vidéo)
-- Auteurs :		Rui et Timothée
-- Création :		06.01.2021
-- Modification :	23.01.2021
-- Version :		1.0
-- -----------------------------------------------------


/*
-- aller sur master pour pouvoir supprimer "plateformeStreamingVideo"
USE [master]
GO
ALTER DATABASE [plateformeStreamingVideo] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO

-- Supprime la base de données si elle existe
DROP DATABASE IF EXISTS [plateformeStreamingVideo]




-- Crée la base de donnée
CREATE DATABASE [plateformeStreamingVideo];



-- Aller sur "plateformeStreamingVideo"
USE [plateformeStreamingVideo];
*/



-- Création des tables

-- -----------------------------------------------------
-- Table series
-- -----------------------------------------------------
CREATE TABLE series(
  id INT NOT NULL identity,
  title VARCHAR(50) NOT NULL,
  onLine DATE NOT NULL,
  description VARCHAR(200) NULL,
  miniature image NULL,
  trailer image NULL,
  evaluation float NULL,
  PRIMARY KEY (id),
  INDEX UNIQUE_Index (title));


-- -----------------------------------------------------
-- Table seasons
-- -----------------------------------------------------
CREATE TABLE seasons(
  id INT NOT NULL identity,
  number INT NOT NULL,
  date DATE NOT NULL,
  series_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX UNIQUE_Index (number, date),
  INDEX fk_seasons_series_idx (series_id));

-- -----------------------------------------------------
-- Table imageResolutions
-- -----------------------------------------------------
CREATE TABLE imageResolutions (
  id INT NOT NULL identity,
  name VARCHAR(50) NULL,
  height INT NULL,
  width INT NULL,
  colorsFormats VARCHAR(5) NULL,
  hdr TINYINT NULL,
  PRIMARY KEY (id),
  INDEX UNIQUE_Index (height, width));


-- -----------------------------------------------------
-- Table episodes
-- -----------------------------------------------------
CREATE TABLE episodes(
  id INT NOT NULL identity,
  title VARCHAR(50) NOT NULL,
  number INT NOT NULL,
  duration TIME NULL,
  description VARCHAR(200) NULL,
  miniature image NULL,
  evaluation float NULL,
  seasons_id INT NOT NULL,
  imageResolutions_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX Unique_Index (title, number),
  INDEX fk_episodes_seasons1_idx (seasons_id),
  INDEX fk_episodes_imageResolutions1_idx (imageResolutions_id),
  CONSTRAINT fk_episodes_seasons1
    FOREIGN KEY (seasons_id)
    REFERENCES seasons (id),
  CONSTRAINT fk_episodes_imageResolutions1
    FOREIGN KEY (imageResolutions_id)
    REFERENCES imageResolutions (id));


-- -----------------------------------------------------
-- Table people
-- -----------------------------------------------------
CREATE TABLE people(
  id INT NOT NULL identity,
  firstName VARCHAR(50) NULL,
  lastName VARCHAR(50) NULL,
  email VARCHAR(100) NOT NULL,
  phone INT NULL,
  birth DATE NULL,
  npa INT NULL,
  city VARCHAR(50) NULL,
  street VARCHAR(100) NULL,
  PRIMARY KEY (id),
  INDEX email_UNIQUE (email));


-- -----------------------------------------------------
-- Table roles
-- -----------------------------------------------------
CREATE TABLE roles(
  id INT NOT NULL identity,
  type VARCHAR(100) NULL,
  people_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX type_UNIQUE (type),
  INDEX fk_roles_people1_idx (people_id),
  CONSTRAINT fk_roles_people1
    FOREIGN KEY (people_id)
    REFERENCES people (id));


-- -----------------------------------------------------
-- Table productionStudios
-- -----------------------------------------------------
CREATE TABLE productionStudios(
  id INT NOT NULL identity,
  name VARCHAR(50) NULL,
  ide VARCHAR(15) NOT NULL,
  email VARCHAR(100) NULL,
  phone INT NULL,
  npa INT NULL,
  city VARCHAR(50) NULL,
  street VARCHAR(100) NULL,
  creation DATE NULL,
  PRIMARY KEY (id),
  INDEX ide_UNIQUE (ide));


-- -----------------------------------------------------
-- Table categories
-- -----------------------------------------------------
CREATE TABLE categories(
  id INT NOT NULL identity,
  name VARCHAR(50) NOT NULL,
  type VARCHAR(50) NULL,
  description VARCHAR(200) NULL,
  PRIMARY KEY (id),
  INDEX name_UNIQUE (name));


-- -----------------------------------------------------
-- Table audioResolutions
-- -----------------------------------------------------
CREATE TABLE audioResolutions(
  id INT NOT NULL identity,
  name VARCHAR(50) NULL,
  resolution INT NULL,
  format VARCHAR(50) NULL,
  episodes_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX UNIQUE_Index (resolution, format),
  INDEX fk_audioResolutions_episodes1_idx (episodes_id),
  CONSTRAINT fk_audioResolutions_episodes1
    FOREIGN KEY (episodes_id)
    REFERENCES episodes (id));


-- -----------------------------------------------------
-- Table ageRestrictions
-- -----------------------------------------------------
CREATE TABLE ageRestrictions(
  id INT NOT NULL identity,
  age INT NOT NULL,
  description VARCHAR(200) NULL,
  episodes_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX age_UNIQUE (age),
  INDEX fk_ageRestrictions_episodes1_idx (episodes_id),
  CONSTRAINT fk_ageRestrictions_episodes1
    FOREIGN KEY (episodes_id)
    REFERENCES episodes (id));


-- -----------------------------------------------------
-- Table meansOfPayment
-- -----------------------------------------------------
CREATE TABLE meansOfPayment(
  id INT NOT NULL identity,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  INDEX name_UNIQUE (name));


-- -----------------------------------------------------
-- Table subscriptions
-- -----------------------------------------------------
CREATE TABLE subscriptions(
  id INT NOT NULL identity,
  name VARCHAR(50) NOT NULL,
  price float NULL,
  description VARCHAR(200) NULL,
  videoResolution INT NULL,
  simultaneousDevices INT NULL,
  PRIMARY KEY (id),
  INDEX name_UNIQUE (name));


-- -----------------------------------------------------
-- Table account
-- -----------------------------------------------------
CREATE TABLE account(
  id INT NOT NULL identity,
  firstName VARCHAR(100) NULL,
  lastName VARCHAR(100) NULL,
  birth DATE NULL,
  npa INT NULL,
  city VARCHAR(50) NULL,
  street VARCHAR(100) NULL,
  email VARCHAR(100) NOT NULL,
  phone INT NULL,
  meansOfPayment_id INT NOT NULL,
  subscriptions_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX email_UNIQUE (email),
  INDEX fk_account_meansOfPayment1_idx (meansOfPayment_id),
  INDEX fk_account_subscriptions1_idx (subscriptions_id),
  CONSTRAINT fk_account_meansOfPayment1
    FOREIGN KEY (meansOfPayment_id)
    REFERENCES meansOfPayment (id),
  CONSTRAINT fk_account_subscriptions1
    FOREIGN KEY (subscriptions_id)
    REFERENCES subscriptions (id));


-- -----------------------------------------------------
-- Table users
-- -----------------------------------------------------
CREATE TABLE users(
  id INT NOT NULL identity,
  name VARCHAR(20) NOT NULL,
  ageRestrictions_id INT NOT NULL,
  profilesImages_id INT NOT NULL,
  account_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX name_UNIQUE (name),
  INDEX fk_users_ageRestrictions1_idx (ageRestrictions_id),
  INDEX fk_users_profilesImages1_idx (profilesImages_id),
  INDEX fk_users_account1_idx (account_id),
  CONSTRAINT fk_users_ageRestrictions1
    FOREIGN KEY (ageRestrictions_id)
    REFERENCES ageRestrictions (id),
  CONSTRAINT fk_users_account1
    FOREIGN KEY (account_id)
    REFERENCES account (id));


-- -----------------------------------------------------
-- Table favorites
-- -----------------------------------------------------
CREATE TABLE favorites(
  id INT NOT NULL identity,
  name VARCHAR(50) NOT NULL,
  users_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX name_UNIQUE (name),
  INDEX fk_favorites_users1_idx (users_id),
  CONSTRAINT fk_favorites_users1
    FOREIGN KEY (users_id)
    REFERENCES users (id));


-- -----------------------------------------------------
-- Table movies
-- -----------------------------------------------------
CREATE TABLE movies(
  id INT NOT NULL identity,
  title VARCHAR(50) NULL,
  date DATE NULL,
  description VARCHAR(200) NULL,
  duration TIME NULL,
  miniature image NULL,
  trailer image NULL,
  evaluation float NULL,
  audioResolutions_id INT NOT NULL,
  ageRestrictions_id INT NOT NULL,
  imageResolutions_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX UNIQUE_Index (title, date),
  INDEX fk_movies_audioResolutions1_idx (audioResolutions_id),
  INDEX fk_movies_ageRestrictions1_idx (ageRestrictions_id),
  INDEX fk_movies_imageResolutions1_idx (imageResolutions_id),
  CONSTRAINT fk_movies_audioResolutions1
    FOREIGN KEY (audioResolutions_id)
    REFERENCES audioResolutions (id),
  CONSTRAINT fk_movies_ageRestrictions1
    FOREIGN KEY (ageRestrictions_id)
    REFERENCES ageRestrictions (id),
  CONSTRAINT fk_movies_imageResolutions1
    FOREIGN KEY (imageResolutions_id)
    REFERENCES imageResolutions (id));


-- -----------------------------------------------------
-- Table subscriptions_has_imageResolutions
-- -----------------------------------------------------
CREATE TABLE subscriptions_has_imageResolutions(
  subscriptions_id INT NOT NULL,
  imageResolutions_id INT NOT NULL,
  INDEX fk_subscriptions_has_imageResolutions_imageResolutions1_idx (imageResolutions_id),
  INDEX fk_subscriptions_has_imageResolutions_subscriptions1_idx (subscriptions_id),
  CONSTRAINT fk_subscriptions_has_imageResolutions_subscriptions1
    FOREIGN KEY (subscriptions_id)
    REFERENCES subscriptions (id),
  CONSTRAINT fk_subscriptions_has_imageResolutions_imageResolutions1
    FOREIGN KEY (imageResolutions_id)
    REFERENCES imageResolutions (id));


-- -----------------------------------------------------
-- Table series_has_roles
-- -----------------------------------------------------
CREATE TABLE series_has_roles(
  series_id INT NOT NULL,
  roles_id INT NOT NULL,
  INDEX fk_series_has_roles_roles1_idx (roles_id),
  INDEX fk_series_has_roles_series1_idx (series_id),
  CONSTRAINT fk_series_has_roles_series1
    FOREIGN KEY (series_id)
    REFERENCES series (id),
  CONSTRAINT fk_series_has_roles_roles1
    FOREIGN KEY (roles_id)
    REFERENCES roles (id));


-- -----------------------------------------------------
-- Table episodes_has_roles
-- -----------------------------------------------------
CREATE TABLE episodes_has_roles(
  episodes_id INT NOT NULL,
  roles_id INT NOT NULL,
  INDEX fk_episodes_has_roles_roles1_idx (roles_id),
  INDEX fk_episodes_has_roles_episodes1_idx (episodes_id),
  CONSTRAINT fk_episodes_has_roles_episodes1
    FOREIGN KEY (episodes_id)
    REFERENCES episodes (id),
  CONSTRAINT fk_episodes_has_roles_roles1
    FOREIGN KEY (roles_id)
    REFERENCES roles (id));


-- -----------------------------------------------------
-- Table series_has_productionStudios
-- -----------------------------------------------------
CREATE TABLE series_has_productionStudios(
  series_id INT NOT NULL,
  productionStudios_id INT NOT NULL,
  INDEX fk_series_has_productionStudios_productionStudios1_idx (productionStudios_id),
  INDEX fk_series_has_productionStudios_series1_idx (series_id),
  CONSTRAINT fk_series_has_productionStudios_series1
    FOREIGN KEY (series_id)
    REFERENCES series (id),
  CONSTRAINT fk_series_has_productionStudios_productionStudios1
    FOREIGN KEY (productionStudios_id)
    REFERENCES productionStudios (id));


-- -----------------------------------------------------
-- Table categories_has_series
-- -----------------------------------------------------
CREATE TABLE categories_has_series(
  categories_id INT NOT NULL,
  series_id INT NOT NULL,
  INDEX fk_categories_has_series_series1_idx (series_id),
  INDEX fk_categories_has_series_categories1_idx (categories_id),
  CONSTRAINT fk_categories_has_series_categories1
    FOREIGN KEY (categories_id)
    REFERENCES categories (id),
  CONSTRAINT fk_categories_has_series_series1
    FOREIGN KEY (series_id)
    REFERENCES series (id));


-- -----------------------------------------------------
-- Table users_has_episodes
-- -----------------------------------------------------
CREATE TABLE users_has_episodes(
  users_id INT NOT NULL,
  episodes_id INT NOT NULL,
  INDEX fk_users_has_episodes_episodes1_idx (episodes_id),
  INDEX fk_users_has_episodes_users1_idx (users_id),
  CONSTRAINT fk_users_has_episodes_users1
    FOREIGN KEY (users_id)
    REFERENCES users (id),
  CONSTRAINT fk_users_has_episodes_episodes1
    FOREIGN KEY (episodes_id)
    REFERENCES episodes (id));


-- -----------------------------------------------------
-- Table roles_has_movies
-- -----------------------------------------------------
CREATE TABLE roles_has_movies(
  roles_id INT NOT NULL,
  movies_id INT NOT NULL,
  INDEX fk_roles_has_movies_movies1_idx (movies_id),
  INDEX fk_roles_has_movies_roles1_idx (roles_id),
  CONSTRAINT fk_roles_has_movies_roles1
    FOREIGN KEY (roles_id)
    REFERENCES roles (id),
  CONSTRAINT fk_roles_has_movies_movies1
    FOREIGN KEY (movies_id)
    REFERENCES movies (id));


-- -----------------------------------------------------
-- Table productionStudios_has_movies
-- -----------------------------------------------------
CREATE TABLE productionStudios_has_movies(
  productionStudios_id INT NOT NULL,
  movies_id INT NOT NULL,
  INDEX fk_productionStudios_has_movies_movies1_idx (movies_id),
  INDEX fk_productionStudios_has_movies_productionStudios1_idx (productionStudios_id),
  CONSTRAINT fk_productionStudios_has_movies_productionStudios1
    FOREIGN KEY (productionStudios_id)
    REFERENCES productionStudios (id),
  CONSTRAINT fk_productionStudios_has_movies_movies1
    FOREIGN KEY (movies_id)
    REFERENCES movies (id));


-- -----------------------------------------------------
-- Table categories_has_movies
-- -----------------------------------------------------
CREATE TABLE categories_has_movies(
  categories_id INT NOT NULL,
  movies_id INT NOT NULL,
  INDEX fk_categories_has_movies_movies1_idx (movies_id),
  INDEX fk_categories_has_movies_categories1_idx (categories_id),
  CONSTRAINT fk_categories_has_movies_categories1
    FOREIGN KEY (categories_id)
    REFERENCES categories (id),
  CONSTRAINT fk_categories_has_movies_movies1
    FOREIGN KEY (movies_id)
    REFERENCES movies (id));


-- -----------------------------------------------------
-- Table users_has_movies
-- -----------------------------------------------------
CREATE TABLE users_has_movies(
  users_id INT NOT NULL,
  movies_id INT NOT NULL,
  INDEX fk_users_has_movies_movies1_idx (movies_id),
  INDEX fk_users_has_movies_users1_idx (users_id),
  CONSTRAINT fk_users_has_movies_users1
    FOREIGN KEY (users_id)
    REFERENCES users (id),
  CONSTRAINT fk_users_has_movies_movies1
    FOREIGN KEY (movies_id)
    REFERENCES movies (id));


-- -----------------------------------------------------
-- Table favorites_has_movies
-- -----------------------------------------------------
CREATE TABLE favorites_has_movies(
  favorites_id INT NOT NULL,
  movies_id INT NOT NULL,
  INDEX fk_favorites_has_movies_movies1_idx (movies_id),
  INDEX fk_favorites_has_movies_favorites1_idx (favorites_id),
  CONSTRAINT fk_favorites_has_movies_favorites1
    FOREIGN KEY (favorites_id)
    REFERENCES favorites (id),
  CONSTRAINT fk_favorites_has_movies_movies1
    FOREIGN KEY (movies_id)
    REFERENCES movies (id));


-- -----------------------------------------------------
-- Table favorites_has_series
-- -----------------------------------------------------
CREATE TABLE favorites_has_series(
  favorites_id INT NOT NULL,
  series_id INT NOT NULL,
  INDEX fk_favorites_has_series_series1_idx (series_id),
  INDEX fk_favorites_has_series_favorites1_idx (favorites_id),
  CONSTRAINT fk_favorites_has_series_favorites1
    FOREIGN KEY (favorites_id)
    REFERENCES favorites (id),
  CONSTRAINT fk_favorites_has_series_series1
    FOREIGN KEY (series_id)
    REFERENCES series (id));
	