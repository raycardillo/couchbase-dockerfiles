# cb-v4-python-v3.10-docker-official
This image installs the Couchbase Python `v4` SDK using the Docker Official Python `3.10` image.

It can sometimes be difficult to run on certain platforms (e.g., when using `Docker` on a `Silicon`/`M1` Mac) where Couchbase may not yet have prebuilt images widely available.

## Image Overview
- `FROM python:3.10`, see reference info on the [Python dockerhub page](https://hub.docker.com/_/python).
- `Python 3.10`, `pip`
- [Couchbase Python](https://github.com/couchbase/couchbase-python-client)

## Commands
- [docker-build-amd64.sh](../../scripts/docker-build-amd64.sh) - Performs the initial build for the AMD64 platform (enable Rosetta 2 on an M1 Mac OS) and creates the docker image.
- [docker-build.sh](../../scripts/docker-build.sh) - Performs the initial build (using the default platform) and creates the docker image.
- [docker-run.sh](../../scripts/docker-run.sh) - After the initial build, this creates a container from the image, starts the container, and opens a `bash` command line shell.
- [docker-shell.sh](../../scripts/docker-shell.sh) - After the initial run, use this on subsequent runs to start the container and open a `bash` command line shell.

## Examples
- [couchbase-python-examples](couchbase-python-examples) - Contains examples that can be executed with the `python` command and produce simple command line output for quick testing.
- Requires the `travel-sample` bucket that can be installed easily via the admin web UI.
- Requires the following services for testing:
  - Data (KV)
  - Query
  - Index

## WARNING
See warning statement in the [repository root README](../../README.md).
