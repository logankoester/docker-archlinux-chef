#!/bin/env bash

expect -c "
  set timeout 60
  spawn pacman -U --noconfirm --noprogressbar $(find . -name omnibus-chef-git*.pkg.tar.xz)
  expect {
    \"y/n\" {
      send \"y\r\"
      exp_continue
    } \"Thank you for installing Chef!\" {
      exit
    }
  }
"
