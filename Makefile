NAME := gary-shell-bot

build:
	docker build -t $(NAME) .

run:
	docker run -d --name $(NAME)_c $(NAME)

stop:
	docker stop $(NAME)_c

rm:
	docker rm $(NAME)_c

rmi:
	docker rmi $(NAME)

reset: 	stop rm rmi build run
