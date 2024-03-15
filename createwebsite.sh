#!/bin/sh
git clone https://centrifuge.hectabit.org/hectabit/burgernotes-client-web.git --depth=1
mv burgernotes-client-web/* website/
rm -r burgernotes-client-web website/index.html website/README.md website/LICENSE
