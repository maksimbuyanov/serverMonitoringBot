build:
	docker build -t gary-shell .

run:
	docker run -d --name gary-shell --restart always gary-shell

stop:
	docker stop gary-shell

up:
	docker-compose up -d

up:
	docker-compose down
