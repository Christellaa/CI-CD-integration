up: down
	docker build -t ci-cd-integration .
	docker run -d --name ci-cd-integration -p 8080:8080 -v $(CURDIR):/app ci-cd-integration

test:
	chmod +x ./tests/unit-tests.sh
	./tests/unit-tests.sh

exec:
	docker exec -it ci-cd-integration sh

down:
	docker stop ci-cd-integration || true
	docker rm ci-cd-integration || true
	docker rmi ci-cd-integration || true