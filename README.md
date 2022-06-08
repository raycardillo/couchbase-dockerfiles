# couchbase-dockerfiles
My personal collection of Couchbase `Dockerfile` images that I occasionally use while testing, experimenting, or debugging.

I try to document the scripts reasonably well and include `README` files to help understand the context for each.

## Docker Scripts

The `Docker` scripts are tested with the Docker Desktop runnin on an M1 MacBook Pro. In some cases, depending on platform availability of underlying images, you might have to run with `--platform linux/amd64` or similar instead.

## podman Scripts

The `podman` scripts are tested with a Homebrew installation of `podman` on an M1 MacBook Pro. The recommended configuration is 8GB of memory and 2 CPUs.

There are currently problems with the Homebrew installation on M1 mac, so if you cannot create the machine correctly, then start with 2GB and 2 CPUs and then hand modify the config file as suggested here:

https://github.com/containers/podman/issues/14303#issuecomment-1141402472

For example:
- `podman machine stop`
- `podman machine set --cpus 2`
- `podman machine set --memory 8192`
- `vi ~/.config/containers/podman/machine/qemu/podman-machine-default.json`
  - change the `-cpu` value to `host`
  - change the `-M` to just `virt` (remove `highmem=off`)
  - verify that the `-m` and `Memory` are set to `8192`
  - save changes
- `podman machine start`
- `podman machine inspect`

## WARNING
I've made this repo public so others can benefit from it, but this is just my personal collection of `Dockerfile`s and some may be out of date if I haven't needed to use them in a while.
