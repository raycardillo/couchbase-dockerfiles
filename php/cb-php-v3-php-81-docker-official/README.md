# cb-php-v3-universal
This image builds the PHP `v3` SDK from source files so that it's more universally portable. It can otherwise be difficult to run on certain platforms (e.g., when using `Docker` on a `Silicon`/`M1` Mac) where Couchbase may not yet have prebuilt images widely available.

## Image Overview
- `FROM php:8.1-bullseye`, see reference info on the [PHP dockerhub page](https://hub.docker.com/_/php).
- `PHP 8.1`, `pecl`, `composer`
- [Couchbase PHP](https://github.com/couchbase/couchbase-php-client) `3.1.0` built from source.
- Couchbase extension is installed using `docker-php-ext-enable` (see Quick Reference on PHP dockerhub).

## Commands
- [docker-build.sh](../../scripts/docker-build.sh) - Performs the initial build and creates the docker image.
- [docker-run.sh](../../scripts/docker-run.sh) - After the initial build, this creates a container from the image, starts a container, and opens a `bash` command line shell.
- [docker-shell.sh](../../scripts/docker-shell.sh) - After the initial run, use this on subsequent runs to start the container and open a `bash` command line shell.

## Examples
- [couchbase-php-examples](couchbase-php-examples) - Contains examples that can be executed with the `php` command and produce simple command line output for quick testing.
- Requires the `travel-sample` bucket that can be installed easily via the admin web UI.
- Requires the following services for testing:
  - Data (KV)
  - Query
  - Index

## WARNING
See warning statement in the [repository root README](../../README.md).
