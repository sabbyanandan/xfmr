#!/usr/bin/env sh

set -e -u

cd xfmr

THE_VERSION=$(grep -o '<revision[^"]*' pom.xml | sed -e 's/<revision>\(.*\)<\/revision>/\1/')

echo "Updating xfmr in K8S with ${THE_VERSION} of Docker Image"

# Replace `<HOST>` with the hostname of the SCDF-server running in Kubernetes.
curl \
	-X \
	POST "http://35.230.1.218/streams/deployments/update/barxfmr" \
	-uuser:password \
    -d '{"updateProperties":{"version.xfmr":"'"${THE_VERSION}"'"},"releaseName":"barxfmr","packageIdentifier":{"packageName":"barxfmr"}}' \
    -H "Content-Type: application/json"