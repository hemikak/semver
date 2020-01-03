FROM ballerina/ballerina:1.1.0

COPY src/semver src/semver
COPY Ballerina.lock Ballerina.lock
COPY Ballerina.toml Ballerina.toml

RUN ballerina build -c semver
