#!/bin/sh
rm -rf website/*
mkdir -p website
rm -rf burgernotes-client-web
git clone https://centrifuge.hectabit.org/hectabit/burgernotes-client-web.git --depth=1
mv burgernotes-client-web/* website/
cp rdir.html website/index.html
rm -rf burgernotes-client-web website/README.md website/LICENSE.md
