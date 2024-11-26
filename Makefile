SRC := ./srcs

all: $(SRC)/docker-compose.yml
	docker compose -f $(SRC)/docker-compose.yml up --build

clean:
