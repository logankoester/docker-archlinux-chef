# archlinux-chef
# VERSION 0.1.0
#
# Arch Linux with Chef installed from AUR package omnibus-chef-git

FROM logankoester/archlinux
MAINTAINER Logan Koester <logan@logankoester.com>

ENV CHEF_VERSION 11.16.4

RUN pacman -Syy --noprogressbar
RUN pacman -S --noprogressbar --noconfirm --needed wget base-devel expect git

RUN mkdir -p /root/build
WORKDIR /root/build

RUN wget https://aur.archlinux.org/packages/ru/ruby-bundler/ruby-bundler.tar.gz
RUN tar -xzvf ruby-bundler.tar.gz
RUN (cd ruby-bundler; makepkg -s -f --asroot --noconfirm --noprogressbar)
RUN pacman -U --noconfirm ./ruby-bundler/ruby-bundler-*.pkg.tar.xz

RUN git config --system user.email "logan@logankoester.com" && git config --system user.name "Logan Koester"

RUN wget https://aur.archlinux.org/packages/om/omnibus-chef-git/omnibus-chef-git.tar.gz
RUN tar -xzvf omnibus-chef-git.tar.gz

RUN (cd omnibus-chef-git; sudo makepkg -s -f --asroot --noconfirm --noprogressbar)

COPY install_chef.sh /root/build/install_chef.sh
RUN chmod +x /root/build/install_chef.sh
RUN /root/build/install_chef.sh

RUN rm -f /etc/gitconfig
RUN rm -f /var/lib/pacman/db.lck
RUN rm -rf /root/build
