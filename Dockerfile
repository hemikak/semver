FROM ballerina/ballerina:1.2.16

COPY src/semver src/semver
COPY Ballerina.lock Ballerina.lock
COPY Ballerina.toml Ballerina.toml
COPY libs libs

USER root
RUN bal build -c semver
USER ballerina
