#!/bin/sh
cd $(dirname "$(readlink -f "$0")")
git clone https://centrifuge.hectabit.org/hectabit/burgernotes --depth=1
cd burgernotes
mkdir -p ../website/static ../website/app ../website/error ../website/login ../website/logout ../website/privacy ../website/signup
cp -r static/* ../website/static
cp templates/app.html ../website/app/index.html
cp templates/error.html ../website/error/index.html
cp templates/login.html ../website/login/index.html
cp ../logout.html ../website/logout/index.html
cp templates/privacy.html ../website/privacy/index.html
cp templates/signup.html ../website/signup/index.html
cd ..
rm -rf burgernotes
