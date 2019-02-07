Docker Shopware Box
====================

## Installation

Docker (min. Version 1.12) have to be installed on your local machine:

 - [Docker](https://docs.docker.com/engine/installation/linux/)

## Usage

Clone the repository to your local machine.

    $ git clone https://github.com/shopwareLabs/shopware-docker
    $ cd shopware-docker

Boot up your docker containers with psh.phar:

    $ ./psh.phar docker:start

The first boot may take a while, so feel free to get a cup of coffee.

Your machine will be available at [http://localhost:8083/](http://localhost:8083/)
All required tools like the LAMP stack are already installed.

- MySQL user: `app`, password: `app`

To SSH into the created Container:

    $ ./psh.phar docker:ssh

## Installing Shopware

SSH first into your VM:

    $ ./psh.phar docker:ssh
    
Call the init script:

    $ ./psh.phar init
    
This will download the latest release version of shopware and install it into /var/www/shopware/shopware

If you want an older shopware version just add --sw-version to the init script:

    $ ./psh.phar init --sw-version=5.2.26

#### For plugin development

For plugin development there is a script `init-vcs` to initialize and install shopware through github.  

    $ ./psh.phar init-vcs --sw-branch=5.2

The plugin(s) you want to start development should be located in `./plugins` (Only new plugin system is supported). They can be installed and linked into the Shopware checkout by executing

    $ ./psh.phar init-plugins
    

This can be used together with our [`plugin-dev-tools`](https://github.com/shopwareLabs/plugin-dev-tools) as the `local` environment.

#### Access

Configure your online store in a web browser with the credentials demo/demo:

- Backend: [http://localhost:8083/backend/](http://localhost:8083/backend/)

You can then access your storefront at:

- Front-end: [http://localhost:8083/](http://localhost:8083/)

#### Shopwarecoach

Erstelle eine config.php Datei im shopware Ordner, falls noch nicht vorhanden und überschreibt die DB-Einstellungen mit denen von Docker:

    $ ./psh.phar config-create

Legt eine Datenbank im Docker Container an:

    $ ./psh.phar swcoach:create-database

Erstellt einen SQL-Dump auf dem Live-Server und speichert diesen lokal unter /dumps/dump.sql:

    $ ./psh.phar swcoach:pull-dump

Importiert einen SQL-Dump von /dumps/dump.sql, ändert die Shopware-Domain auf die verwendete Variable ab, deaktiviert SSL und leert den Cache:

    $ ./psh.phar swcoach:import-dump

Schreibt die neue Domain in die /etc/hosts:

    $ ./psh.phar swcoach:update-hosts

Prüft, ob eine .gitignore und eine .gitlab-ci.yml Datei im /shopware Ordner vorhanden ist und erstellt diese andernfalls mit sinnvollen default Werten:

    $ ./psh.phar swcoach:gitify

## Troubleshooting 

If the elasticsearch or redis container didn't start make sure that the directory dev-ops/docker/_volumes/app-esdata|app-redisdata has chmod 777.
