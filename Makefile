DOCKER_ENV_FILE_PATH = docker/.env
DOCKER_ENV_LOCAL_FILE_PATH = docker/.env.local

ifeq ($(shell test -f ${DOCKER_ENV_LOCAL_FILE_PATH} && echo yes),yes)
    DOCKER_ENV_FILE_PATH = ${DOCKER_ENV_LOCAL_FILE_PATH}
endif

include ${DOCKER_ENV_FILE_PATH}

DOCKER_COMPOSE = docker compose --env-file ${DOCKER_ENV_FILE_PATH}
DOCKER_COMPOSE_APP_EXEC = ${DOCKER_COMPOSE} exec app

##################
## Docker
##################

dc_build:
	${DOCKER_COMPOSE} build

dc_network:
	docker network create -d bridge book-service-network

dc_up:
	${DOCKER_COMPOSE} up -d --remove-orphans

dc_ps:
	${DOCKER_COMPOSE} ps -a

dc_down:
	${DOCKER_COMPOSE} down --remove-orphans

dc_enter_app:
	${DOCKER_COMPOSE} exec app bash

dc_logs_app:
	${DOCKER_COMPOSE} logs app

##################
## App
##################

main:
	${DOCKER_COMPOSE_APP_EXEC} go run src/main.go