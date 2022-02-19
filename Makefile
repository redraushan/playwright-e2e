ifndef UNIQUE_BUILD_ID
		UNIQUE_BUILD_ID=local
endif		

DOCKER_COMPOSE_SMOKE=docker-compose -f docker-compose.smoke.yml

build: 
	docker build -t playwright:${UNIQUE_BUILD_ID} .

registry: 
	docker run -d -p 5000:5000 --restart=always --name registry registry:2

push: 
	docker tag playwright:${UNIQUE_BUILD_ID} localhost:5000/playwright:${UNIQUE_BUILD_ID}

publish:
	docker tag playwright:${UNIQUE_BUILD_ID} localhost:5000/playwright:latest
	docker push localhost:5000/playwright:latest

pull: 
	docker pull localhost:5000/playwright${UNIQUE_BUILD_ID}

run:
	${DOCKER_COMPOSE_SMOKE} run --rm playwright npm run test
