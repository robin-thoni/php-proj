# Starter kit for Angular Material

Here is an angular material starter kit to use with Luticate (https://git.rthoni.com/luticate/)

## Install front
```shell
# git clone https://git.rthoni.com/robin.thoni/starter-angular-material
cd public
bower install
```


## Install php

```shell
composer install
chmod -R 777 storage
cp example.env .env # Then edit it
# exec sql/struct_init.sql and sql/data_init.sql on database
```
