FROM java:8-alpine

ADD xfmr-*.jar xfmr.jar

ENTRYPOINT exec java -Djava.security.egd=file:/dev/./urandom -jar /xfmr.jar