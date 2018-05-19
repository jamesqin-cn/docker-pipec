OUTPUT := pipec
CURR_DIR := $(shell cd `pwd` && pwd)
DOCKER_WORK_DIR := /go/src/github.com/cncd/pipeline/pipec

$(OUTPUT):
	docker run --rm -v $(CURR_DIR)/bin/:/data/bin/ golang bash -c "\
		go get -v github.com/cncd/pipeline; \
		cd $(DOCKER_WORK_DIR); \
		CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /data/bin/$(OUTPUT)"

test_compile:
	docker run --rm -v $(CURR_DIR)/testdata/:/data cnjamesqin/docker-pipec compile -in /data/pipeline.yml -out /data/pipeline.json

test_exec:
	docker run --rm -v $(CURR_DIR)/testdata/:/data -v /var/run/docker.sock:/var/run/docker.sock cnjamesqin/docker-pipec exec -in /data/pipeline.json

clean:
	rm -f ./bin/$(OUTPUT)
