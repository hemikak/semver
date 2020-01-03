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

import ballerina/math;
import ballerina/stringutils;
import ballerina/lang.'int as lints;
import ballerina/lang.'string as lstring;

public const string VERSION_REGEX = "^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)?$";

# Record for a semver version.
# 
# + major - Major version.
# + minor - Minor version.
# + patch - Patch version.
public type Version record {|
    int major;
    int minor;
    int patch;
|};

# Convert a string to a semver verison.
# 
# + sVersion - Semver version as a string.
# + return - Error if cannot be converted. 
public function convertToVersion(string sVersion) returns Version|error {
    if (!(check isRange(sVersion))) {
        string[] versionParts = stringutils:split(sVersion, "\\.");

        Version ver = {
            major: checkpanic lints:fromString(versionParts[0]),
            minor: checkpanic lints:fromString(versionParts[1]),
            patch: checkpanic lints:fromString(versionParts[2])
        };

        return ver;
    } else {
        error err = error("semver range found and not a fixed version: '" + sVersion +"'");
        return err;
    }
}

# Check if a string is semver range.
# 
# + sVersion - Semver as a string.
# + return - true if range, false if its not a range, error if neither.
public function isRange(string sVersion) returns boolean|error {
    string[] versionParts = stringutils:split(sVersion, "\\.");

    if (versionParts.length() == 1) {
        string p0 = versionParts[0];

        if (isInt(p0) || p0 == "*" || p0 == "x") {
            return true;
        }

        if (lstring:startsWith(p0, "~") || lstring:startsWith(p0, "^") || isInt(p0)) {
            string p0Int = stringutils:replace(stringutils:replace(p0, "~", ""), "^", "");
            if (isInt(p0Int)) {
                return true;
            }
        }

        if (lstring:startsWith(p0, ">=") || lstring:startsWith(p0, ">") || lstring:startsWith(p0, "<=") || lstring:startsWith(p0, "<") || lstring:startsWith(p0, "=")) {
            string p0Int = stringutils:replace(stringutils:replace(stringutils:replace(stringutils:replace(stringutils:replace(p0, ">=", ""), ">", ""), "<=", ""), "<", ""), "=", "");
            if (isInt(p0Int)) {
                return true;
            }
        }
    }

    if (versionParts.length() == 2) {
        string p0 = versionParts[0];
        string p1 = versionParts[1];

        if (isInt(p0) && isInt(p1)) {
            return true;
        }

        if (isInt(p0) && (p1 == "*" || p1 == "x")) {
            return true;
        }

        if (lstring:startsWith(p0, "~") || lstring:startsWith(p0, "^")) {
            string p0Int = stringutils:replace(stringutils:replace(p0, "~", ""), "^", "");
            if (isInt(p0Int) && isInt(p1)) {
                return true;
            }
        }

        if (lstring:startsWith(p0, ">=") || lstring:startsWith(p0, ">") || lstring:startsWith(p0, "<=") || lstring:startsWith(p0, "<") || lstring:startsWith(p0, "=")) {
            string p0Int = stringutils:replace(stringutils:replace(stringutils:replace(stringutils:replace(stringutils:replace(p0, ">=", ""), ">", ""), "<=", ""), "<", ""), "=", "");
            if (isInt(p0Int) && isInt(p1)) {
                return true;
            }
        }
    }

    if (versionParts.length() == 3) {
        string p0 = versionParts[0];
        string p1 = versionParts[1];
        string p2 = versionParts[2];

        if (isInt(p0) && isInt(p1) && isInt(p2)) {
            return false;
        }

        if (isInt(p0) && isInt(p1) && (p2 == "*" || p2 == "x")) {
            return true;
        }

        if (isInt(p0) && (p1 == "*" || p1 == "x") && (p2 == "*" || p2 == "x")) {
            return true;
        }

        if (lstring:startsWith(p0, "~") || lstring:startsWith(p0, "^")) {
            string p0Int = stringutils:replace(stringutils:replace(p0, "~", ""), "^", "");
            if (isInt(p0Int) && isInt(p1) && isInt(p2)) {
                return true;
            }
        }

        if (lstring:startsWith(p0, ">=") || lstring:startsWith(p0, ">") || lstring:startsWith(p0, "<=") || lstring:startsWith(p0, "<")) {
            string p0Int = stringutils:replace(stringutils:replace(stringutils:replace(stringutils:replace(p0, ">=", ""), ">", ""), "<=", ""), "<", "");
            if (isInt(p0Int) && isInt(p1) && isInt(p2)) {
                return true;
            }
        }
    }

    error invalidSemverError = error("invalid semver: '" + sVersion + "'");
    return invalidSemverError;
}

# Convert a version to a string.
# 
# + sVersion - The version.
# + return - Version as a string.
public function toString(Version sVersion) returns string {
    return string `${sVersion.major}.${sVersion.minor}.${sVersion.patch}`;
}

# Check if a version exists on an array of version.
# 
# + sVersion - Version to check.
# + matchVersions - List of versions.
# + return - True if version exists, else false.
public function hasVersion(Version sVersion, Version[] matchVersions) returns boolean {
    foreach Version matchVersion in matchVersions {
        if (convertToValue(matchVersion) == convertToValue(sVersion)) {
            return true;
        }
    }

    return false;
}

# Get the latest verions out of a list of versions which complies a range.
# 
# + semver - Semver range.
# + matchToVersions - List of versions.
# + return - The lates version. If not found nil is returned. If semver version cannot be parsed then an error is thrown.
public function findLatestInRange(string semver, Version[] matchToVersions) returns Version|()|error {
    Version[] matchVersions = matchToVersions;

    if (matchVersions.length() == 0) {
        return;
    }

    if ((check isRange(semver))) {
        string[] versionParts = stringutils:split(semver, "\\.");

        if (versionParts.length() == 1) {
            string p0 = versionParts[0];
            
            if (p0 == "*" || p0 == "x") {
                Version[] sortedVersions = sortVersions(matchVersions);
                if (sortedVersions.length() > 0) {
                    return sortedVersions[sortedVersions.length() - 1];
                }
            }

            if (lstring:startsWith(p0, "~") || lstring:startsWith(p0, "^") || isInt(p0)) {
                string p0Int = stringutils:replace(stringutils:replace(p0, "~", ""), "^", "");
                if (isInt(p0Int)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vLow = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: 0,
                            patch: 0
                        };
                        float rLow = convertToValue(vLow);
                        Version vHigh = {
                            major: (checkpanic lints:fromString(p0Int)) + 1,
                            minor: 0,
                            patch: 0
                        };
                        float rHigh = convertToValue(vHigh);
                        return rLow <= vValue && vValue < rHigh;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, ">=")) {
                string p0Int = stringutils:replace(p0, ">=", "");
                if (isInt(p0Int)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vLow = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: 0,
                            patch: 0
                        };
                        float rLow = convertToValue(vLow);
                        return vValue >= rLow;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, ">")) {
                string p0Int = stringutils:replace(p0, ">", "");
                if (isInt(p0Int)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vLow = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: 0,
                            patch: 0
                        };
                        float rLow = convertToValue(vLow);
                        return vValue > rLow;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, "<")) {
                string p0Int = stringutils:replace(p0, "<", "");
                if (isInt(p0Int)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vHigh = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: 0,
                            patch: 0
                        };
                        float rHigh = convertToValue(vHigh);
                        return vValue < rHigh;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, "<=")) {
                string p0Int = stringutils:replace(p0, "<=", "");
                if (isInt(p0Int)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vHigh = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: 0,
                            patch: 0
                        };
                        float rHigh = convertToValue(vHigh);
                        return vValue <= rHigh;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }
        }

        if (versionParts.length() == 2) {
            string p0 = versionParts[0];
            string p1 = versionParts[1];

            if (isInt(p0) && (p1 == "*" || p1 == "x")) {
                matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                    return matchVersion.major >= checkpanic lints:fromString(p0) && matchVersion.major < (checkpanic lints:fromString(p0) + 1);
                });

                Version[] sortedVersions = sortVersions(matchVersions);
                if (sortedVersions.length() > 0) {
                    return sortedVersions[sortedVersions.length() - 1];
                }
            }

            if (lstring:startsWith(p0, "~") || (isInt(p0) && isInt(p1))) {
                string p0Int = stringutils:replace(p0, "~", "");
                if (isInt(p0Int) && isInt(p1)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vLow = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: (checkpanic lints:fromString(p1)),
                            patch: 0
                        };
                        float rLow = convertToValue(vLow);
                        Version vHigh = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: (checkpanic lints:fromString(p1)) + 1,
                            patch: 0
                        };
                        float rHigh = convertToValue(vHigh);
                        return vValue >= rLow && vValue < rHigh;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, "^")) {
                string p0Int = stringutils:replace(p0, "^", "");
                if (isInt(p0Int) && isInt(p1)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                            float vValue = convertToValue(matchVersion);
                            Version vLow = {
                                major: (checkpanic lints:fromString(p0Int)),
                                minor: (checkpanic lints:fromString(p1)),
                                patch: 0
                            };
                            float rLow = convertToValue(vLow);
                            Version vHigh = {
                                major: (checkpanic lints:fromString(p0Int)) + 1,
                                minor: 0,
                                patch: 0
                            };
                            float rHigh = convertToValue(vHigh);
                            return rLow <= vValue && vValue < rHigh;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, ">=")) {
                string p0Int = stringutils:replace(p0, ">=", "");
                if (isInt(p0Int) && isInt(p1)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                            float vValue = convertToValue(matchVersion);
                            Version vLow = {
                                major: (checkpanic lints:fromString(p0Int)),
                                minor: (checkpanic lints:fromString(p1)),
                                patch: 0
                            };
                            float rLow = convertToValue(vLow);
                            return vValue >= rLow;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, ">")) {
                string p0Int = stringutils:replace(p0, ">", "");
                if (isInt(p0Int) && isInt(p1)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                            float vValue = convertToValue(matchVersion);
                            Version vLow = {
                                major: (checkpanic lints:fromString(p0Int)),
                                minor: (checkpanic lints:fromString(p1)) + 1,
                                patch: 0
                            };
                            float rLow = convertToValue(vLow);
                            return vValue >= rLow;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, "<=")) {
                string p0Int = stringutils:replace(p0, "<=", "");
                if (isInt(p0Int) && isInt(p1)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                            float vValue = convertToValue(matchVersion);
                            Version vHigh = {
                                major: (checkpanic lints:fromString(p0Int)),
                                minor: (checkpanic lints:fromString(p1)),
                                patch: 0
                            };
                            float rHigh = convertToValue(vHigh);
                            return vValue <= rHigh;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, "<")) {
                string p0Int = stringutils:replace(p0, "<", "");
                if (isInt(p0Int) && isInt(p1)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                            float vValue = convertToValue(matchVersion);
                            Version vHigh = {
                                major: (checkpanic lints:fromString(p0Int)),
                                minor: (checkpanic lints:fromString(p1)),
                                patch: 0
                            };
                            float rHigh = convertToValue(vHigh);
                            return vValue <=rHigh;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }
        }

        if (versionParts.length() == 3) {
            string p0 = versionParts[0];
            string p1 = versionParts[1];
            string p2 = versionParts[2];

            if (isInt(p0) && isInt(p1) && (p2 == "*" || p2 == "x")) {
                matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                    return matchVersion.major == checkpanic lints:fromString(p0) && matchVersion.minor == checkpanic lints:fromString(p1);
                });

                Version[] sortedVersions = sortVersions(matchVersions);
                if (sortedVersions.length() > 0) {
                    return sortedVersions[sortedVersions.length() - 1];
                }
            }

            if (isInt(p0) && (p1 == "*" || p1 == "x") && (p2 == "*" || p2 == "x")) {
                matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                    return matchVersion.major == checkpanic lints:fromString(p0);
                });

                Version[] sortedVersions = sortVersions(matchVersions);
                if (sortedVersions.length() > 0) {
                    return sortedVersions[sortedVersions.length() - 1];
                }
            }

            if (lstring:startsWith(p0, "~") || (isInt(p0) && isInt(p1) && isInt(p2))) {
                string p0Int = stringutils:replace(p0, "~", "");
                if (isInt(p0Int) && isInt(p1) && isInt(p2)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vLow = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: (checkpanic lints:fromString(p1)),
                            patch: (checkpanic lints:fromString(p2))
                        };
                        float rLow = convertToValue(vLow);
                        Version vHigh = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: (checkpanic lints:fromString(p1)) + 1,
                            patch: 0
                        };
                        float rHigh = convertToValue(vHigh);
                        return vValue >= rLow && vValue < rHigh;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }
            
            if (lstring:startsWith(p0, "^")) {
                string p0Int = stringutils:replace(p0, "^", "");
                if (isInt(p0Int) && isInt(p1) && isInt(p2)) {
                    if ((checkpanic lints:fromString(p0Int)) != 0) {
                        matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                            float vValue = convertToValue(matchVersion);
                            Version vLow = {
                                major: (checkpanic lints:fromString(p0Int)),
                                minor: (checkpanic lints:fromString(p1)),
                                patch: (checkpanic lints:fromString(p2))
                            };
                            float rLow = convertToValue(vLow);
                            Version vHigh = {
                                major: (checkpanic lints:fromString(p0Int)) + 1,
                                minor: 0,
                                patch: 0
                            };
                            float rHigh = convertToValue(vHigh);
                            return rLow <= vValue && vValue < rHigh;
                        });
                    } else {
                        if ((checkpanic lints:fromString(p1)) != 0) {
                            matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                                float vValue = convertToValue(matchVersion);
                                Version vLow = {
                                    major: 0,
                                    minor: (checkpanic lints:fromString(p1)),
                                    patch: (checkpanic lints:fromString(p2))
                                };
                                float rLow = convertToValue(vLow);
                                Version vHigh = {
                                    major: 0,
                                    minor: (checkpanic lints:fromString(p1)) + 1,
                                    patch: 0
                                };
                                float rHigh = convertToValue(vHigh);
                                return rLow <= vValue && vValue < rHigh;
                            });
                        } else {
                            Version v = {
                                major: (checkpanic lints:fromString(p0Int)),
                                minor: (checkpanic lints:fromString(p1)),
                                patch: (checkpanic lints:fromString(p2))
                            };
                            if (hasVersion(v, matchVersions)) {
                                return v;
                            } else {
                                return;
                            }
                        }
                    }
                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, ">=")) {
                string p0Int = stringutils:replace(p0, ">=", "");
                if (isInt(p0Int) && isInt(p1) && isInt(p2)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vLow = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: (checkpanic lints:fromString(p1)),
                            patch: (checkpanic lints:fromString(p2))
                        };
                        float rLow = convertToValue(vLow);
                        return vValue >= rLow;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, ">")) {
                string p0Int = stringutils:replace(p0, ">", "");
                if (isInt(p0Int) && isInt(p1) && isInt(p2)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vLow = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: (checkpanic lints:fromString(p1)),
                            patch: (checkpanic lints:fromString(p2))
                        };
                        float rLow = convertToValue(vLow);
                        return vValue > rLow;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, "<=")) {
                string p0Int = stringutils:replace(p0, "<=", "");
                if (isInt(p0Int) && isInt(p1) && isInt(p2)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vHigh = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: (checkpanic lints:fromString(p1)),
                            patch: (checkpanic lints:fromString(p2))
                        };
                        float rHigh = convertToValue(vHigh);
                        return vValue <= rHigh;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }

            if (lstring:startsWith(p0, "<")) {
                string p0Int = stringutils:replace(p0, "<", "");
                if (isInt(p0Int) && isInt(p1) && isInt(p2)) {
                    matchVersions = matchVersions.filter(function (Version matchVersion) returns boolean {
                        float vValue = convertToValue(matchVersion);
                        Version vHigh = {
                            major: (checkpanic lints:fromString(p0Int)),
                            minor: (checkpanic lints:fromString(p1)),
                            patch: (checkpanic lints:fromString(p2))
                        };
                        float rHigh = convertToValue(vHigh);
                        return vValue < rHigh;
                    });

                    Version[] sortedVersions = sortVersions(matchVersions);
                    if (sortedVersions.length() > 0) {
                        return sortedVersions[sortedVersions.length() - 1];
                    }
                }
            }
        } 

        return;
    } else {
        Version v = checkpanic convertToVersion(semver);
        if (hasVersion(v, matchVersions)) {
            return v;
        }

        return;
    }
}

# Sort a list of versions.
# 
# + versions - The list of versions
# + reverse - Sort order. Default is in ascending order with `false` value.
# + return - Versions sorted out
public function sortVersions(Version[] versions, boolean reverse = false) returns (Version[]) {
    if (versions.length() == 0) {
        return versions;
    }
    string temp;
    boolean swapped = false;

    foreach int i in 0 ..< versions.length() { 
        swapped = false;
        foreach int j in 0 ... versions.length() - 2 - i {
            if (versionCompartor(versions[j], versions[j + 1]) == (reverse ? -1 : 1)) {
                Version vTemp = versions[j];
                versions[j] = versions[j+1];
                versions[j+1] = vTemp;
                swapped = true;
            }
        }

        if (!swapped) {
            break;
        }
    }
    return versions;
}

public function convertToValue(Version sVersion) returns float {
    return (sVersion.major * math:pow(10, 10)) + (sVersion.minor * math:pow(10, 5)) + sVersion.patch;
}

# Compare 2 versions.
# 
# + version1 - Compare version.
# + version2 - Compare to version.
# + return - 1 if version1 is greater than version2. -1 if version2 greater than version1. 0 if same version.
function versionCompartor(Version version1, Version version2) returns (int) {
    if (convertToValue(version1) > convertToValue(version2)) {
        return 1;
    }

    if (convertToValue(version1) < convertToValue(version2)) {
        return -1;
    }

    return 0;
}

# Check if a string value is an integer.
# 
# + value - The string value
# + return - Check if value is integer.
function isInt(string value) returns (boolean) {
    int|error intResult = lints:fromString(value);
    return intResult is int;
}
