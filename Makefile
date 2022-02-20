ifndef UNIQUE_BUILD_ID
		UNIQUE_BUILD_ID=local
endif		

DOCKER_COMPOSE_SMOKE=docker-compose -f docker-compose.smoke.yml

build: 
	echo building ${UNIQUE_BUILD_ID} ...
#   docker build -t playwright:${UNIQUE_BUILD_ID} .

registry: 
#	docker run -d -p 5000:5000 --restart=always --name registry registry:2

push: 
	echo pushing ${UNIQUE_BUILD_ID}
#	docker tag playwright:${UNIQUE_BUILD_ID} localhost:5000/playwright:${UNIQUE_BUILD_ID}

publish:
	echo publishing ${UNIQUE_BUILD_ID} as latest
#	docker tag playwright:${UNIQUE_BUILD_ID} localhost:5000/playwright:latest
#	docker push localhost:5000/playwright:latest

pull: 
	echo pulling ${UNIQUE_BUILD_ID} 
#	docker pull localhost:5000/playwright${UNIQUE_BUILD_ID}

run:
	echo running ${UNIQUE_BUILD_ID} 
#	${DOCKER_COMPOSE_SMOKE} run --rm playwright npm run test
