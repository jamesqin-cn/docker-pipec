## Intro
The original project is https://github.com/cncd/pipeline, which is a Go package implements a container-based pipeline engine, Now I build it with docker

## Usage
Compile the yaml to the intermediate representation:

```
docker run --rm -v <YOUR_YML_DIR>:/data cnjamesqin/docker-pipec compile -in /data/pipeline.yml -out /data/pipeline.json
```

Execute the intermediate representation:

```
docker run --rm -v <YOUR_YML_DIR>:/data -v /var/run/docker.sock:/var/run/docker.sock cnjamesqin/docker-pipec exec -in /data/pipeline.json
```
