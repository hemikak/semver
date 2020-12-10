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
    dataProvider: "positiveDataProvider"
}
function testInRange(string range, string expected) {
    Version expectedVersion = checkpanic new(expected);
    Version[] expectedVs = [expectedVersion];
    Version? foundV = checkpanic findLatestInRange(range, expectedVs);
    if (foundV is Version) {
        test:assertEquals(foundV.toString(), expected, msg = "int values not equal");
    } else {
        test:assertFail(msg = string `could not find in range:[${range}, ${expected}]`);
    }
}

function positiveDataProvider() returns string[][] {
    return [
        ["1.0.0", "1.0.0"],
        ["*", "1.2.3"],
        // ["*", "v1.2.3"],
        [">=1.0.0", "1.0.0"],
        [">=1.0.0", "1.0.1"],
        [">=1.0.0", "1.1.0"],
        [">1.0.0", "1.0.1"],
        [">1.0.0", "1.1.0"],
        ["<=2.0.0", "2.0.0"],
        ["<=2.0.0", "1.9999.9999"],
        ["<=2.0.0", "0.2.9"],
        ["<2.0.0", "1.9999.9999"],
        ["<2.0.0", "0.2.9"],
        [">=1.0.0", "1.0.0"],
        [">=1.0.0", "1.0.1"],
        [">=1.0.0", "1.1.0"],
        [">1.0.0", "1.0.1"],
        [">1.0.0", "1.1.0"],
        ["<=2.0.0", "2.0.0"],
        ["<=2.0.0", "1.9999.9999"],
        ["<=2.0.0", "0.2.9"],
        ["<2.0.0", "1.9999.9999"],
        ["<2.0.0", "0.2.9"],
        // [">=0.1.97", "v0.1.97"],
        [">=0.1.97", "0.1.97"],
        // ["0.1.20 || 1.2.4", "1.2.4"],
        // [">=0.2.3 || <0.0.1", "0.0.0"],
        // [">=0.2.3 || <0.0.1", "0.2.3"],
        // [">=0.2.3 || <0.0.1", "0.2.4"],
        // ["||", "1.3.4"],
        // ["2.x.x", "2.1.3"],
        ["1.2.x", "1.2.3"],
        // ["1.2.x || 2.x", "2.1.3"],
        // ["1.2.x || 2.x", "1.2.3"],
        ["x", "1.2.3"],
        // ["2.*.*", "2.1.3"],
        ["1.2.*", "1.2.3"],
        // ["1.2.* || 2.*", "2.1.3"],
        // ["1.2.* || 2.*", "1.2.3"],
        ["*", "1.2.3"],
        ["2", "2.1.2"],
        ["2.3", "2.3.1"],
        ["~0.0.1", "0.0.1"],
        ["~0.0.1", "0.0.2"],
        // ["~x", "0.0.9"], // >=2.4.0 <2.5.0
        ["~2", "2.0.9"], // >=2.4.0 <2.5.0
        ["~2.4", "2.4.0"], // >=2.4.0 <2.5.0
        ["~2.4", "2.4.5"],
        // ["~>3.2.1", "3.2.2"], // >=3.2.1 <3.3.0,
        ["~1", "1.2.3"], // >=1.0.0 <2.0.0
        // ["~>1", "1.2.3"],
        // ["~> 1", "1.2.3"],
        ["~1.0", "1.0.2"], // >=1.0.0 <1.1.0,
        ["~1.0.3", "1.0.12"],
        // ["~ 1.0.3alpha", "1.0.12", { loose: true }],
        [">=1", "1.0.0"],
        ["<1.2", "1.1.1"],
        // ["~v0.5.4-pre", "0.5.5"],
        // ["~v0.5.4-pre", "0.5.4"],
        // ["=0.7.x", "0.7.2"],
        // ["<=0.7.x", "0.7.2"],
        // [">=0.7.x", "0.7.2"],
        // ["<=0.7.x", "0.6.2"],
        // ["~1.2.1 >=1.2.3", "1.2.3"],
        // ["~1.2.1 =1.2.3", "1.2.3"],
        // ["~1.2.1 1.2.3", "1.2.3"],
        // ["~1.2.1 >=1.2.3 1.2.3", "1.2.3"],
        // ["~1.2.1 1.2.3 >=1.2.3", "1.2.3"],
        // ["~1.2.1 1.2.3", "1.2.3"],
        // [">=1.2.1 1.2.3", "1.2.3"],
        // ["1.2.3 >=1.2.1", "1.2.3"],
        // [">=1.2.3 >=1.2.1", "1.2.3"],
        // [">=1.2.1 >=1.2.3", "1.2.3"],
        [">=1.2", "1.2.8"],
        ["^1.2.3", "1.8.1"],
        ["^0.1.3", "0.1.3"],
        ["^0.1", "0.1.2"],
        ["^0.0.1", "0.0.1"],
        ["^1.2", "1.4.2"]
        // ["^1.2 ^1", "1.4.2"],
        // ["^1.2.3-alpha", "1.2.3-pre"],
        // ["^1.2.0-alpha", "1.2.0-pre"],
        // ["^0.0.1-alpha", "0.0.1-beta"],
        // ["^0.0.1-alpha", "0.0.1"],
        // ["^0.1.1-alpha", "0.1.1-beta"],
        // ["^x", "1.2.3"],
        // ["x - 1.0.0", "0.9.7"],
        // ["x - 1.x", "0.9.7"],
        // ["1.0.0 - x", "1.9.7"],
        // ["1.x - x", "1.9.7"],
        // ["<=7.x", "7.9.9"]
    ];
}