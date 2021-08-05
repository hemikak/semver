// Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/math;

# Semver version.
public type Version object {
    private InternalVersion internalVersion;

    public function __init(string sVersion) returns error? {
        InternalVersion|error versionOrError = trap Version_valueOf(sVersion);
        if versionOrError is error {
            error err = error("invalid semver: '" + sVersion + "'");
            return err;
        }

        self.internalVersion = <InternalVersion>versionOrError;
    }

    # Get the major version.
    # 
    # + return - Major version value.
    public function getMajorVersion() returns int {
        return self.internalVersion.getMajorVersion();
    }

    # Get the minor version.
    # 
    # + return - Minor version value.
    public function getMinorVersion() returns int {
        return self.internalVersion.getMinorVersion();
    }

    # Get the patch version.
    # 
    # + return - Patch version value.
    public function getPatchVersion() returns int {
        return self.internalVersion.getPatchVersion();
    }

    # Convert a version to a string.
    # 
    # + return - Version as a string.
    public function toString() returns string {
        return self.internalVersion.toString();
    }

    # Check if versions satisfies a semver range
    # 
    # + semverRange - A semver range.
    # + return - `true` if satisfies, else `false`. Error if unable parse semver range.
    public function satisfies(string semverRange) returns boolean|error {
        boolean|error satisfiesOrError = trap self.internalVersion.satisfies2(semverRange);
        if satisfiesOrError is error {
            error err = error("invalid semver range: '" + semverRange + "'");
            return err;
        }

        return <boolean>satisfiesOrError;
    }

    # Check if a version is greater in value
    # 
    # + version - The version to compare.
    # + return - `true` if greater, else `false`.
    public function greaterThan(Version 'version) returns boolean {
        return self.internalVersion.greaterThan('version.internalVersion);
    }

    # Check if a version is greater or equal in value
    # 
    # + version - The version to compare.
    # + return - `true` if greater or equal, else `false`.
    public function greaterThanOrEqualTo(Version 'version) returns boolean {
        return self.internalVersion.greaterThanOrEqualTo('version.internalVersion);
    }

    # Check if a version is less in value
    # 
    # + version - The version to compare.
    # + return - `true` if less, else `false`.
    public function lessThan(Version 'version) returns boolean {
        return self.internalVersion.lessThan('version.internalVersion);
    }

    # Check if a version is less or equal in value
    # 
    # + version - The version to compare.
    # + return - `true` if less or equal, else `false`.
    public function lessThanOrEqualTo(Version 'version) returns boolean {
        return self.internalVersion.lessThanOrEqualTo('version.internalVersion);
    }

    # Get value representation of the version.
    # 
    # + return - The value.
    public function toValue() returns int {
        return <int>(self.internalVersion.getMajorVersion() * math:pow(10, 10)) + 
                <int>(self.internalVersion.getMinorVersion() * math:pow(10, 5)) + 
                self.internalVersion.getPatchVersion();
    }
};
