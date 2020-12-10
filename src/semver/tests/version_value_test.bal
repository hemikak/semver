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

import ballerina/test;

@test:Config {}
public function valueTest() {
    Version v = checkpanic new("1.2.3");
    test:assertEquals(v.toValue(), 10000200003);
    v = checkpanic new("1.2.3-beta1");
    test:assertEquals(v.toValue(), 10000200003);
    v = checkpanic new("1.2.3-beta2");
    test:assertEquals(v.toValue(), 10000200003);
    v = checkpanic new("1.2.3-alpha1");
    test:assertEquals(v.toValue(), 10000200003);
    v = checkpanic new("1.2.3-alpha2");
    test:assertEquals(v.toValue(), 10000200003);
    v = checkpanic new("1.2.3-SNAPSHOT");
    test:assertEquals(v.toValue(), 10000200003);
    v = checkpanic new("1.2.4-SNAPSHOT");
    test:assertEquals(v.toValue(), 10000200004);
    v = checkpanic new("1.8.4-SNAPSHOT");
    test:assertEquals(v.toValue(), 10000800004);
}

@test:Config {}
public function getLatestInRange() {
    Version v1_0_0 = checkpanic new("1.0.0");
    Version v2_1_2 = checkpanic new("2.1.2");
    Version v1_3_2 = checkpanic new("1.3.2");
    Version v1_3_8 = checkpanic new("1.3.8");
    Version v2_0_8 = checkpanic new("2.0.8");
    Version v2_0_0 = checkpanic new("2.0.0");
    Version v1_0_7 = checkpanic new("1.0.7");

    Version? latestV1 = checkpanic findLatestInRange("*", [v1_0_0, v2_1_2, v1_3_2, v1_3_8, v2_0_8, v2_0_0, v1_0_7]);
    if latestV1 is () {
        test:assertFail("matching version not found for '*'");
    } else {
        test:assertEquals(latestV1.toString(), "2.1.2");
    }

    latestV1 = checkpanic findLatestInRange("1", [v1_0_0, v2_1_2, v1_3_2, v1_3_8, v2_0_8, v2_0_0, v1_0_7]);
    if latestV1 is () {
        test:assertFail("matching version not found for '1'");
    } else {
        test:assertEquals(latestV1.toString(), "1.3.8");
    }

    latestV1 = checkpanic findLatestInRange("1.3", [v1_0_0, v2_1_2, v1_3_2, v1_3_8, v2_0_8, v2_0_0, v1_0_7]);
    if latestV1 is () {
        test:assertFail("matching version not found for '1.3'");
    } else {
        test:assertEquals(latestV1.toString(), "1.3.8");
    }

    latestV1 = checkpanic findLatestInRange("1.3.x", [v1_0_0, v2_1_2, v1_3_2, v1_3_8, v2_0_8, v2_0_0, v1_0_7]);
    if latestV1 is () {
        test:assertFail("matching version not found for '1.3.x'");
    } else {
        test:assertEquals(latestV1.toString(), "1.3.8");
    }

    latestV1 = checkpanic findLatestInRange("2", [v1_0_0, v2_1_2, v1_3_2, v1_3_8, v2_0_8, v2_0_0, v1_0_7]);
    if latestV1 is () {
        test:assertFail("matching version not found for '2'");
    } else {
        test:assertEquals(latestV1.toString(), "2.1.2");
    }

    latestV1 = checkpanic findLatestInRange("<2.0.0", [v1_0_0, v2_1_2, v1_3_2, v1_3_8, v2_0_8, v2_0_0, v1_0_7]);
    if latestV1 is () {
        test:assertFail("matching version not found for '<2.0.0'");
    } else {
        test:assertEquals(latestV1.toString(), "1.3.8");
    }

    latestV1 = checkpanic findLatestInRange("<=2.0.0", [v1_0_0, v2_1_2, v1_3_2, v1_3_8, v2_0_8, v2_0_0, v1_0_7]);
    if latestV1 is () {
        test:assertFail("matching version not found for '<=2.0.0'");
    } else {
        test:assertEquals(latestV1.toString(), "2.0.0");
    }
}