## engine-sync

This repo serves only to hold tooling neccessary to sync moby/moby to docker/engine.

Some background:

- moby/moby is the upstream of docker/engine
- docker/engine holds branches and tags for Docker CE releases
- We are consolidating branches and tags to moby/moby
- Docker CE (currently) releases from docker/engine
- This allows the existing release scripts to work unmodified
