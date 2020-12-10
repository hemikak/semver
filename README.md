[![Build Status](https://travis-ci.org/hemikak/semver.svg?branch=master)](https://travis-ci.org/hemikak/semver)

# hemikak/semver
A library for semver.

## Module Overview
A library to use semver.  

Credits to https://github.com/zafarkhaja/jsemver.

## Sample
```ballerina
semver:Version v210 = checkpanic new("2.1.0");
string v210AsString = v210.toString();

semver:Version v222 = checkpanic new("2.2.2");
string v222AsString = v222.toString();

semver:Version[] semvers = [v210, v222];

semver:Version|()|error latestVersion = semver:findLatestInRange("*", semvers);

boolean isValidSemver = checkpanic semver:isValidSemver("*");
```
