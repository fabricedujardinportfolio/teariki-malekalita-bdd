set date=%Date:~4,2%%Date:~7,2%%Date:~10,2%
mysqldump -u root -p bookshop > backups\bookshop-save%date%.sql