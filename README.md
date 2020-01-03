[![Build Status](https://travis-ci.org/hemikak/semver.svg?branch=master)](https://travis-ci.org/hemikak/semver)

# hemikak/semver
A library for semver.

## Module Overview
A library to use semver, written in Ballerina using string manipulation.

## Sample
```ballerina
semver:Version v210 = checkpanic semver:convertToVersion("2.1.0");
string v210AsString = semver:toString(v210);

semver:Version v222 = checkpanic semver:convertToVersion("2.2.2");
string v222AsString = semver:toString(v222);

semver:Version[] semvers = [v210, v222];

semver:Version|()|error latestVersion = semver:findLatestInRange("*", semvers);

boolean isSemverRange = checkpanic semver:isRange("*");
```
