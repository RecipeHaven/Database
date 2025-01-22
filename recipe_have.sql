CREATE DATABASE recipe_haven;

CREATE TABLE users (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(25),
    Email VARCHAR(50),
    Password VARCHAR(25),
    Permissions VARCHAR(25) DEFAULT 1
)DEFAULT CHARSET = utf8;

CREATE TABLE difficulties (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Difficulty VARCHAR(20)
)DEFAULT CHARSET = utf8;

CREATE TABLE categories (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Category VARCHAR(20)
)DEFAULT CHARSET = utf8;

CREATE TABLE recipes (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Image LONGTEXT,
    Ingredients LONGTEXT,
    Description LONGTEXT,
    DifficultyId INT,
    Time INT,
    Cost DOUBLE,
    UserId INT,
    CategoryId INT,
    FOREIGN KEY (DifficultyId) REFERENCES difficulties(Id),
    FOREIGN KEY (UserId) REFERENCES users(Id),
    FOREIGN KEY (CategoryId) REFERENCES categories(Id)
)DEFAULT CHARSET = utf8;

CREATE TABLE forum (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Message LONGTEXT,
    Date VARCHAR(25),
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES users(id)
)DEFAULT CHARSET = utf8;

CREATE TABLE lists (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES users(id)
)DEFAULT CHARSET = utf8;

CREATE TABLE recipes_lists (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RecipeId INT,
    ListId INT,
    FOREIGN KEY (RecipeId) REFERENCES recipes(id),
    FOREIGN KEY (ListId) REFERENCES lists(id)
)DEFAULT CHARSET = utf8;

CREATE TABLE reviews (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Review VARCHAR(250),
    UserId INT,
    RecipeId INT,
    FOREIGN KEY (UserId) REFERENCES users(id),
    FOREIGN KEY (RecipeId) REFERENCES recipes(id)
)DEFAULT CHARSET = utf8;

INSERT INTO difficulties(Difficulty) VALUES ('Easy'), ('Medium'), ('Hard'), ('Extreme');
INSERT INTO categories(Category) VALUES ('Meal'), ('Dessert'), ('Drink'), ('Cocktail'), ('Soup');