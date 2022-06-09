# couchbase-dockerfiles
My personal collection of Couchbase `Dockerfile` images that I occasionally use while testing, experimenting, or debugging.

I try to document the scripts reasonably well and include `README` files to help understand the context for each.

## Docker Scripts

The `Docker` scripts are tested with the Docker Desktop runnin on an M1 MacBook Pro. In some cases, depending on platform availability of underlying images, you might have to run with `--platform linux/amd64` or similar instead.


## podman Scripts

The `podman` scripts are experimental because most of my work is on an M1 MacBook Pro at the moment. There is a Homebrew installation of `podman` available but there are lots of issues that come up. The recommended machine configuration is `rootful` with 8GB of memory and 2 CPUs.

**In short, if you're on OSX, save the headaches and use Docker Desktop instead.**

### podman Machine Problems on OSX M1

There are currently problems with the Homebrew installation on M1 mac, so if you cannot create the machine correctly, then start with 2GB and 2 CPUs and then hand modify the config file as suggested here:

https://github.com/containers/podman/issues/14303#issuecomment-1141402472

Initialize the default machine like this:
- `podman machine init --cpus 2 --memory 8192 --rootful`

If already created, you can try to change it like this (or `rm` the machine):
- `podman machine stop`
- `podman machine set --cpus 2`
- `podman machine set --memory 8192`
- `podman machine set --rootful`
- `podman machine start`

In either case, manually edit/verify the machine configuration:
- `podman machine stop`
- `vi ~/.config/containers/podman/machine/qemu/podman-machine-default.json`
  - change the `-cpu` value to `host`
  - change the `-M` to just `virt` (remove `,highmem=off`)
  - verify that the `-smp` and `CPUs` value are set to `2`
  - verify that the `-m` and `Memory` are set to `8192`
  - save changes
- `podman machine start`
- `podman machine inspect`

### podman Network problems on OSX

I've had trouble connecting to Capella and trouble with some apt repositories when using `podman` on OSX (an M1 MacBook Pro). The same exact image (same Dockerfile) has no problems with Docker, but `podman` was unable to connect, etc. Still investigating that, but I cannot recommend `podman` on OSX until that problem is resolved.

### podman Clock Drift on OSX

If you see strange problems with some install commands, it is probably due to clock drift causing problems. There is a known problem with clock drift in virtual machines with `podman` on OSX:
https://github.com/containers/podman/issues/11541

The easiest solution for now is to simply restart the machine as follows:
- `podman machine stop`
- `podman machine start`

### podman Odd Behavior on OSX

I've also had a few incidents where `podman` got into a strange state on OSX and the only solution was to `rm` the machine and recreate it. If you see errors regarding internal `/var` temp folders and such, it's usualy best to use a scorched earth approach and recreate the machine.

### podman AMD64 on OSX M1

https://edofic.com/posts/2021-09-12-podman-m1-amd64/

## WARNING
I've made this repo public so others can benefit from it, but this is just my personal collection of `Dockerfile`s and some may be out of date if I haven't needed to use them in a while.
