#!/bin/bash

GRAALVM_BUILD=${GRAALVM_BUILD:-"1.0.0-rc9"}

FILENAME=graalvm-ce-$GRAALVM_BUILD-linux-amd64.tar.gz
URL=https://github.com/oracle/graal/releases/download/vm-$GRAALVM_BUILD/$FILENAME


if ! [ -f $FILENAME ]; then
curl -L -o $FILENAME $URL
fi

docker build . --build-arg GRAALVM_BUILD=$GRAALVM_BUILD --tag wwadge/graalvm-ce:$GRAALVM_BUILD --tag wwadge/graalvm-ce:latest
