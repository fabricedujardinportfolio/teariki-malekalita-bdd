LOAD DATA INFILE '../Uploads/books.csv'
INTO TABLE books 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(`title`, `author`, `genre`, `height`, `publisher`);