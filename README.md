## engine-sync

This repo serves only to hold tooling neccessary to sync moby/moby to docker/engine.

Some background:

- moby/moby is the upstream of docker/engine
- docker/engine holds branches and tags for Docker CE releases
- We are consolidating branches and tags to moby/moby
- Docker CE (currently) releases from docker/engine
- This allows the existing release scripts to work unmodified


### Usage

This script can be run as a one-off or periodically.
If for some reason there are conflicts the script will fail and exit.

For a full mirror:

```
$ origin=https://github.com/moby/moby.git
$ mirror=https://github.com/docker/engine.git
$ ./repo-sync $origin $mirror
```

You can also set specific branches to mirror:

```
$ origin=https://github.com/moby/moby.git
$ mirror=https://github.com/docker/engine.git
$ ./repo-sync $origin $mirror 17.03 17.05
```
