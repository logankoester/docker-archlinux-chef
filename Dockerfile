# archlinux-chef
# VERSION 0.1.0
#
# Arch Linux with Chef installed from AUR package omnibus-chef-git

FROM logankoester/archlinux
MAINTAINER Logan Koester <logan@logankoester.com>

ENV CHEF_VERSION 11.16.4

RUN pacman -Syy --noprogressbar
RUN pacman pacman -S --noprogressbar --noconfirm --needed wget base-devel expect git

RUN wget https://aur.archlinux.org/packages/ru/ruby-bundler/ruby-bundler.tar.gz
RUN  tar -xzvf ruby-bundler.tar.gz
RUN (cd ruby-bundler; makepkg -s -f --asroot --noconfirm --noprogressbar)
RUN pacman -U --noconfirm ./ruby-bundler/ruby-bundler-*.pkg.tar.xz

RUN git config --system user.email "logan@logankoester.com"
RUN git config --system user.name "Logan Koester"

RUN wget https://aur.archlinux.org/packages/om/omnibus-chef-git/omnibus-chef-git.tar.gz
RUN tar -xzvf omnibus-chef-git.tar.gz
RUN (cd omnibus-chef-git; sudo makepkg -s -f --asroot --noconfirm --noprogressbar)

COPY install_chef.sh install_chef.sh
RUN chmod +x install_chef.sh
RUN install_chef.sh

RUN rm -f /etc/gitconfig
