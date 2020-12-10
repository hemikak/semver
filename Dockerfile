FROM ballerina/ballerina:1.2.10

COPY src/semver src/semver
COPY Ballerina.lock Ballerina.lock
COPY Ballerina.toml Ballerina.toml
COPY libs libs

RUN ballerina build -c semver
