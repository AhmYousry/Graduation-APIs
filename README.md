# Graduation APIs

Backend APIs for Graduation project.

## Environment
* Ruby 3.2.2
* Rails 7.1.2
* PostgreSQL 9.3 

## Getting started

1. Install `docker` and `docker-compose` if not installed
2. Make sure that `git` is installed and configured

    ```bash
    sudo apt-get install git
    
    git config --global user.email "your.email@any.domain"
    git config --global user.name "Your Name"
    ```

3. Clone the project branch:

    ```bash
    git@github.com:AhmYousry/Graduation-APIs.git
    ```

4. Head to the project directory `cd APIs`

## Running Development Environment Using Docker

1. Copy `.env.example` to `.env`.

    ```bash
    chmod +x script.sh
    ./script.sh
    ```

2. Run `docker-compose up`
3. You can now visit `http://localhost:3000/`
