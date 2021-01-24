-- -----------------------------------------------------
-- Projet :			Plateforme de streaming (vidéo)
-- Auteurs :		Rui et Timothée
-- Création :		24.01.2021
-- Modification :	24.01.2021
-- Version :		1.0
-- -----------------------------------------------------

SELECT * FROM dbo.account;
SELECT * FROM dbo.ageRestrictions;
SELECT * FROM dbo.audioResolutions;
SELECT * FROM dbo.categories;
SELECT * FROM dbo.categories_has_movies;
SELECT * FROM dbo.categories_has_series;
SELECT * FROM dbo.episodes;
SELECT * FROM dbo.episodes_has_roles;
SELECT * FROM dbo.favorites;
SELECT * FROM dbo.favorites_has_movies;
SELECT * FROM dbo.favorites_has_series;
SELECT * FROM dbo.imageResolutions;
SELECT * FROM dbo.meansOfPayment;
SELECT * FROM dbo.movies;
SELECT * FROM dbo.people;
SELECT * FROM dbo.productionStudios;
SELECT * FROM dbo.productionStudios_has_movies;
SELECT * FROM dbo.roles;
SELECT * FROM dbo.roles_has_movies;
SELECT * FROM dbo.seasons;
SELECT * FROM dbo.series;
SELECT * FROM dbo.series_has_productionStudios;
SELECT * FROM dbo.series_has_roles;
SELECT * FROM dbo.subscriptions;
SELECT * FROM dbo.subscriptions_has_imageResolutions;
SELECT * FROM dbo.users;
SELECT * FROM dbo.users_has_episodes;
SELECT * FROM dbo.users_has_movies;