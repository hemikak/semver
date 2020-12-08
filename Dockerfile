FROM ballerina/ballerina:1.2.11

COPY src/semver src/semver
COPY Ballerina.lock Ballerina.lock
COPY Ballerina.toml Ballerina.toml

RUN ballerina build -c semver
