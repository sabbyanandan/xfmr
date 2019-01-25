#!/usr/bin/env sh

set -e -u

cd git-repo

THE_VERSION=$(grep -o '<revision[^"]*' pom.xml | sed -e 's/<revision>\(.*\)<\/revision>/\1/')

echo "Updating xfmr in CF with ${THE_VERSION} of Maven artifact"

# Replace `<ROUTE>` with the route of SCDF-server running in CF.
# curl \
# 	-X \
# 	POST "http://sabby-test-dataflow-server.cfapps.io/streams/deployments/update/fooxfmr" \
#     -d '{"updateProperties":{"version.xfmr":"'"${THE_VERSION}"'"},"releaseName":"fooxfmr","packageIdentifier":{"packageName":"fooxfmr"}}' \
#     -H "Content-Type: application/json" \
#     -v