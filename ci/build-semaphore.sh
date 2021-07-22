#!/usr/bin/env bash

set -eu

#cp .env.prod .env

docker run \
       --rm \
       --volume "$(pwd):/home/tcakvo/public_html/si-hcf-wash" \
       --workdir /home/tcakvo/public_html/si-hcf-wash \
       --entrypoint /bin/sh \
       composer:1.10.17 -c 'composer install'

echo 'MIX_PUBLIC_URL="https://si-hcf-wash.tc.akvo.org"' > .env

docker run \
       --rm \
       --volume "$(pwd):/home/tcakvo/public_html/si-hcf-wash" \
       --workdir "/home/tcakvo/public_html/si-hcf-wash" \
       --entrypoint /bin/sh \
       node:14-alpine -c 'npm i && npm run prod'

