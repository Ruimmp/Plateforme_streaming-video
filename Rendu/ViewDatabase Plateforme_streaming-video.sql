-- -----------------------------------------------------
-- Projet :			Plateforme de streaming (vidéo)
-- Auteurs :		Rui et Timothée
-- Création :		24.01.2021
-- Modification :	24.01.2021
-- Version :		1.0
-- -----------------------------------------------------

/*
-- Créer la vue
CREATE VIEW [nbEnregistrements] AS
*/
SELECT COUNT(id) AS account FROM dbo.account;
SELECT COUNT(id) AS ageRestrictions FROM dbo.ageRestrictions;
SELECT COUNT(id) AS audioResolutions FROM dbo.audioResolutions;
SELECT COUNT(id) AS categorie FROM dbo.categories;
SELECT COUNT(id) AS categories_has_movies FROM dbo.categories_has_movies;
SELECT COUNT(id) AS categories_has_series FROM dbo.categories_has_series;
SELECT COUNT(id) AS episodes FROM dbo.episodes;
SELECT COUNT(id) AS episodes_has_roles FROM dbo.episodes_has_roles;
SELECT COUNT(id) AS favorites FROM dbo.favorites;
SELECT COUNT(id) AS favorites_has_movies FROM dbo.favorites_has_movies;
SELECT COUNT(id) AS favorites_has_series FROM dbo.favorites_has_series;
SELECT COUNT(id) AS imageResolutions FROM dbo.imageResolutions;
SELECT COUNT(id) AS meansOfPayment FROM dbo.meansOfPayment;
SELECT COUNT(id) AS movies FROM dbo.movies;
SELECT COUNT(id) AS people FROM dbo.people;
SELECT COUNT(id) AS productionStudios FROM dbo.productionStudios;
SELECT COUNT(id) AS productionStudios_has_movies FROM dbo.productionStudios_has_movies;
SELECT COUNT(id) AS roles FROM dbo.roles;
SELECT COUNT(id) AS roles_has_movies FROM dbo.roles_has_movies;
SELECT COUNT(id) AS seasons FROM dbo.seasons;
SELECT COUNT(id) AS series FROM dbo.series;
SELECT COUNT(id) AS series_has_productionStudios FROM dbo.series_has_productionStudios;
SELECT COUNT(id) AS series_has_roles FROM dbo.series_has_roles;
SELECT COUNT(id) AS subscriptions FROM dbo.subscriptions;
SELECT COUNT(id) AS subscriptions_has_imageResolutions FROM dbo.subscriptions_has_imageResolutions;
SELECT COUNT(id) AS users FROM dbo.users;
SELECT COUNT(id) AS users_has_episodes FROM dbo.users_has_episodes;
SELECT COUNT(id) AS users_has_movies FROM dbo.users_has_movies;
/*
-- Afficher la vue
SELECT * FROM [nbEnregistrements];
*/