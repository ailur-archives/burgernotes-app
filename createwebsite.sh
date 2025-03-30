#!/bin/sh
rm -rf website/*
mkdir -p website
rm -rf burgernotes-client-web
git clone https://github.com/ailur-archives/burgernotes-web --depth=1
mv burgernotes-client-web/* website/
cp rdir.html website/index.html
rm -rf burgernotes-client-web website/README.md website/LICENSE.md
