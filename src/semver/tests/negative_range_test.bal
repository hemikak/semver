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

import ballerina/test;

@test:Config {
    dataProvider: "negativeDataProvider"
}
function testInNotRange(string range, string expected) {
    Version expectedVersion = checkpanic new(expected);
    Version[] expectedVs = [expectedVersion];
    Version? foundV = checkpanic findLatestInRange(range, expectedVs);
    if foundV is Version {
        test:assertFail(msg = string `found in range:[${range}, ${expected}]`);
    }
}

function negativeDataProvider() returns string[][] {
    return [
        ["1.0.0", "1.0.1"],
        [">=1.0.0", "0.0.0"],
        [">=1.0.0", "0.0.1"],
        [">=1.0.0", "0.1.0"],
        [">1.0.0", "0.0.1"],
        [">1.0.0", "0.1.0"],
        ["<=2.0.0", "3.0.0"],
        ["<=2.0.0", "2.9999.9999"],
        ["<=2.0.0", "2.2.9"],
        ["<2.0.0", "2.9999.9999"],
        ["<2.0.0", "2.2.9"],
        [">=0.1.97", "0.1.93"],
        // ["2.x.x", "1.1.3"],
        // ["2.x.x", "3.1.3"],
        ["1.2.x", "1.3.3"],
        // ["2.*.*", "1.1.3"],
        // ["2.*.*", "3.1.3"],
        ["1.2.*", "1.3.3"],
        ["2", "1.1.2"],
        ["2.3", "2.4.1"],
        ["~0.0.1", "0.1.0"],
        ["~2.4", "2.5.0"], // >=2.4.0 <2.5.0
        ["~2.4", "2.3.9"],
        ["~1", "0.2.3"], // >=1.0.0 <2.0.0
        ["~1.0", "1.1.0"], // >=1.0.0 <1.1.0
        ["<1", "1.0.0"],
        [">=1.2", "1.1.1"],
        // ["=0.7.x", "0.8.2"],
        // [">=0.7.x", "0.6.2"],
        // ["<0.7.x", "0.7.2"],
        // [">1.2", "1.2.8"],
        ["^0.0.1", "0.0.2"],
        ["^1.2.3", "1.2.2"],
        ["^1.2", "1.1.9"],
        ["1.3.x", "1.2.5-alpha1"],
        ["1.3.x", "1.2.5-alpha.13"],
        ["1.x", "2.2.5-beta3"],
        ["^1.4", "1.3.2-alpha2"],
        ["~2.5", "2.4.5-beta3"]
    ];
}