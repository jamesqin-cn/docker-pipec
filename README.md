Compile the yaml to the intermediate representation:

```
docker run --rm -v <YOUR_YML_DIR>:/data cnjamesqin/docker-pipec compile -in /data/pipeline.yml -out /data/pipeline.json
```

Execute the intermediate representation:

```
docker run --rm -v <YOUR_YML_DIR>:/data cnjamesqin/docker-pipec exec -in /data/pipeline.json
```
