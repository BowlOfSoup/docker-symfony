# docker-symfony
A simple Docker setup that can run Symfony 6. Uses `php8.1-apache-buster` and `mariadb:10.5.9`.

### How to use

1. Clone the repository into your (new) application directory:

```shell
git clone https://github.com/BowlOfSoup/docker-symfony.git YOUR_APP_DIR
```

2. Setup environment variables

```shell
cp .env.default .env
```

3. Edit your `.env` file. Choose unique names, and ports (e.g. `APP_PORT=8091` and `DB_PORT=33061`)


4. Run the following commands to build and run the containers:

```shell
make build 
make up
```

5. You can now get into the container by running:

```shell
make sh
```

6. The `symfony` command is now available. Check usage [here](https://symfony.com/download).


7. For example, to create a new Symfony install, run the following outside your container:

```shell
mkdir app
make sh

symfony new --dir=. --no-git
```

Usage of the `app` directory is mandatory, it's how the Docker containers are configured.

### 'make' commands
This project makes use of a Makefile. A list of commands can be found by running:

```shell
make --help
```

#### Xdebug
Make sure to configure the correct path mappings on your IDE and xdebug port 9000.
```shell
make xdebug.enable
```

### Git repository
You can choose to add Git in the app directory, of use the whole project. It's up to you!

If you want to use the project including this Docker setup within your own version control (run outside container):

```shell
rm -rf .git
```

### Symfony commands
Composer commands:
```shell
make composer args="install"
```

Symfony commands:
```shell
make symfony args="new --dir=. --no-git"
```

(Symfony) Console commands:
```shell
make console args="migrations:migrate"
```