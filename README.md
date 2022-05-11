# README

## Installation instruction
this application has containerize use docker. Please make sure install docker on your system.

```
- clone this repository
- cd to the folder, ex: cd url-shortener
- and run this follwoing command:
	- docker-compose build
	- docker-compose up -d
	- docker-compose exec web bundle exec rake db:setup db:migrate

