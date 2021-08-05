// Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Get the latest verions out of a list of versions which complies a range.
# 
# + semverRange - Semver range.
# + matchToVersions - List of versions.
# + return - The lates version. If not found nil is returned. If semver version cannot be parsed then an error is thrown.
public function findLatestInRange(string semverRange, Version[] matchToVersions) returns Version|()|error {
    // If no versions are passed
    if matchToVersions.length() == 0 {
        return;
    }

    // Filter versions for semver range
    Version[] versionsInRange = [];
    foreach int i in 0 ..< matchToVersions.length() {
        boolean inRange = check matchToVersions[i].satisfies(semverRange);
        if inRange {
            versionsInRange[versionsInRange.length()] = matchToVersions[i];
        }
    }

    // Find latest version
    if versionsInRange.length() > 0 {
        Version maxVersion = matchToVersions[0];
        versionsInRange.forEach(function(Version 'version) {
            if 'version.greaterThan(maxVersion) {
                maxVersion = 'version;
            }
        });
        return maxVersion;
    }

    return;
}

# Checks if a given semver is valid.
# 
# + semverAsString - Semver value.
# + return - `true` if valid, else `false`.
public function isValidSemver(string semverAsString) returns boolean {
    Version|error semver = new(semverAsString);
    return semver is Version;
}

