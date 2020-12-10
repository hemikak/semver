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
public function creationTest() {
    Version v = checkpanic new("1.2.3");
    v = checkpanic new("1.2.3-beta1");
    v = checkpanic new("1.2.3-beta2");
    v = checkpanic new("1.2.3-alpha1");
    v = checkpanic new("1.2.3-alpha2");
    v = checkpanic new("1.2.3-SNAPSHOT");
    v = checkpanic new("1.2.4-SNAPSHOT");
    v = checkpanic new("1.8.4-SNAPSHOT");

    Version|error vError = new("1.2.*");
    if vError is Version {
        test:assertFail("1.2.* is not a valid version");
    }

    vError = new("1");
    if vError is Version {
        test:assertFail("1 is not a valid version");
    }
}