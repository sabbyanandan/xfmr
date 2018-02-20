#!/usr/bin/env sh

set -e -u

cd xfmr

THE_VERSION=$(grep -o '<revision[^"]*' pom.xml | sed -e 's/<revision>\(.*\)<\/revision>/\1/')

echo "Registering xfmr ${THE_VERSION}"

curl \
	-X \
	POST "http://35.193.155.145/apps/processor/xfmr?force=true" \
	-uuser:password \
    -d "uri=docker:sabby/xfmr:${THE_VERSION}"