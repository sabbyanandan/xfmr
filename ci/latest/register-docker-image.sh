#!/usr/bin/env sh

set -e -u

cd git-repo

THE_VERSION=$(grep -o '<revision[^"]*' pom.xml | sed -e 's/<revision>\(.*\)<\/revision>/\1/')

echo "Registering xfmr ${THE_VERSION}"

# Replace `<HOST>` with the hostname of the SCDF-server running in Kubernetes.
# curl \
# 	-X \
# 	POST "http://35.230.5.225/apps/processor/xfmr?force=true" \
# 	-uuser:password \
#     -d "uri=docker:sabby/xfmr:${THE_VERSION}" \
# 	-d "metadata-uri=maven://org.springframework.cloud.stream.app:cassandra-sink-rabbit:jar:metadata:1.3.1.RELEASE" \
# 	-v