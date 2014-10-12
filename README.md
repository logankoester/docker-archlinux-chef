# docker-archlinux-chef [![Docker Repository on Quay.io](https://quay.io/repository/logankoester/archlinux-chef/status "Docker Repository on Quay.io")](https://quay.io/repository/logankoester/archlinux-chef)

> Arch Linux with [Chef](https://www.getchef.com/) installed from AUR package [omnibus-chef-git](https://aur.archlinux.org/packages/omnibus-chef-git)

[![DockerCI](http://dockeri.co/image/logankoester/archlinux-chef)](https://registry.hub.docker.com/u/logankoester/archlinux-chef/)

## Install

Pull this image with `docker pull logankoester/archlinux-chef`.

## Usage

In your Dockerfile, include the line `FROM logankoester/archlinux-chef`.

If you are using [Automated Builds](http://docs.docker.com/docker-hub/builds/), 
you may also want to create a Repository Link.

To do so, go to the Settings panel of your build repository on Docker Hub registry and
add a repository link to `logankoester/archlinux-chef`.

This means your image will be rebuilt whenever a build has executed on `logankoester/archlinux-chef`.

Be careful if you decide to do this, since package updates might break your image.

## License

Copyright (c) 2013-2014 Logan Koester. Released under the MIT license. See `LICENSE` file for details.
