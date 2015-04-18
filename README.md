# docker-archlinux-chef [![Docker Repository on Quay.io](https://quay.io/repository/logankoester/archlinux-chef/status "Docker Repository on Quay.io")](https://quay.io/repository/logankoester/archlinux-chef)

> Arch Linux with Chef installed system-wide from Rubygems

[![DockerCI](http://dockeri.co/image/logankoester/archlinux-chef)](https://registry.hub.docker.com/u/logankoester/archlinux-chef/)

## Install

Pull this image with `docker pull logankoester/archlinux-chef`.

Set the `CHEF_VERSION` ENV variable if a [specific version](https://rubygems.org/gems/chef/versions/) is desired.

## Usage

In your Dockerfile, include the line `FROM logankoester/archlinux-chef`.

If you are using [Automated Builds](http://docs.docker.com/docker-hub/builds/), 
you may also want to create a Repository Link.

To do so, go to the Settings panel of your build repository on Docker Hub registry and
add a repository link to `logankoester/archlinux-chef`.

This means your image will be rebuilt whenever a build has executed on `logankoester/archlinux-chef`.

Be careful if you decide to do this, since package updates might break your image.

## Changelog

### 1.0.0

  * Chef is now installed through Rubygems (system-wide) instead of Omnibus. This was prompted
    by a change in `pacman` which broke the [omnibus-chef-git](https://aur.archlinux.org/packages/omnibus-chef-git/)
    package, but turned out to be much better. This image now takes far less time to build, is
    less error-prone, and offers the full choice of Chef versions through the `CHEF_VERSION` environment variable.

### 0.1.0

  * Initial release.

## License

Copyright (c) 2014-2015 Logan Koester. Released under the MIT license. See `LICENSE` file for details.
