# Module DB 

### Objectif : 
L'objectif de ce projet était de réaliser en groupe de 2 une base de donnée relationnelle pour une bibliothère à l'aide du SGBD MySQL.Pour cela, nous devions commencer : 
 - Par recenser les informations du domaine étudié afin d'élaborer le MCD, puis le MPD. 
 - Ensuite, mettre en oeuvre la base de données à l'aide de script pour la création des tables, de définition des contraintes et d'insertions des données.
 - Puis fournir la procédure de sauvegarde et de restauration des données. 

Dans ce projet, vous pourrez retrouvez les différents fichiers qui répondent à la demande.

### Présentation du projet :
#### MCD :
Dans le MCD, pour la table "books" nous avons décidés de nous baser sur les noms des colonnes du fichier.csv, pour faciliter l'import des données.

#### Script
Vous pourrez retrouver les différents scripts qui vous permettront d'installer la base de donnée sur votre ordinateur : 
 - "create_db_bookshop.bat", vous servira à installer la base de donnée, et créer les différentes tables (appel le script "create_db_bookshop.bat" pour l'exécution). 
 - "import_books.bat", vous permettra d'importer les donnée dans la table "books" (appel le script "import_books.bat" pour exécuter l'import des données).
 - "save_bookshop.bat", vous permettra de sauvegarder votre base de donnée. Le fichier s'enregistrera dans le dossier "backup"
 - "restore_bookshop.bat", vous servira à restaurer la dernière sauvegarde que vous avez faits (restaure à partir du fichier dans le dossier "backup")

#### Dossier 
Dans le dossier "backup", il y aura la dernière sauvegarde effectué avec le script "save_bookshop.bat".
Dans dossier "sql", il y aura le script qui permet la creation de la base de donnée et le script exécuter l'import des données.
Nous avons choisis de procéder de cette manière pour être sûre que le script s'effectue étape par étape.

### Spécification du projet :
 - Pour le fichier "books.csv" pour l'import des données, doit se situer dans le dossier "Uploads" (C:\ProgramData\MySQL\MySQL Server 8.0\Uploads) pour autoriser l'import des données dans notre base de données.
 - Dans Le fichier "books.csv", nous avons décidés de supprimer la première ligne pour ne pas à avoir à inclure la commande "IGNORE 1 LINES".
 - Pour vérifier la sauvegarde avec le script "save_bookshop.bat" ajouter une donnée lambda : 
 
INSERT INTO books (title, author, genre, height, publisher)
VALUES
('Harry Potter à l'école des sorciers', 'J.K Rowlings', 'science_fiction', 330, 'poche');
 




