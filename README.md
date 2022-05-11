# README

## Installation instruction
this is Rails 7 application + Postgresql. The applications has containerized use docker. Please make sure install docker on your system.

```
- clone this repository
- cd to the folder, ex: cd url-shortener
- and run this following command:
	- docker-compose build
	- docker-compose up -d
	- docker-compose exec web bundle exec rake db:setup db:migrate
```

if there are no something wrong, we can access API url through `http://localhost:3000/shorten`

