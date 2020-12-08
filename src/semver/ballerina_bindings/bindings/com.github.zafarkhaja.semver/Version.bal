
import ballerina/java;

# Ballerina object mapping for Java class `com/github/zafarkhaja/semver/Version`.
#
# + _Version - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Comparable - The field that represents the superclass object `Comparable`.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    class: "com.github.zafarkhaja.semver.Version"
}
public type Version object {

    *java:JObject;

    VersionT _Version = VersionT;
    ComparableT _Comparable = ComparableT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `com/github/zafarkhaja/semver/Version` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    function __init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string value of a Ballerina object mapping a Java class.
    #
    # + return - The `string` form of the object instance.
    function toString() returns string {
        return java:jObjToString(self.jObj);
    }

    # The function that maps to the `compareTo` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `Version` value required to map with the Java method parameter.
    # + return - The `int` value returning from the Java mapping.
    function compareTo(Version arg0) returns int {
        int externalObj = com_github_zafarkhaja_semver_Version_compareTo(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `compareWithBuildsTo` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `Version` value required to map with the Java method parameter.
    # + return - The `int` value returning from the Java mapping.
    function compareWithBuildsTo(Version arg0) returns int {
        int externalObj = com_github_zafarkhaja_semver_Version_compareWithBuildsTo(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `equals` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function equals(Object arg0) returns boolean {
        boolean externalObj = com_github_zafarkhaja_semver_Version_equals(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `getBuildMetadata` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getBuildMetadata() returns string? {
        handle externalObj = com_github_zafarkhaja_semver_Version_getBuildMetadata(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `getClass` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `Class` value returning from the Java mapping.
    function getClass() returns Class {
        handle externalObj = com_github_zafarkhaja_semver_Version_getClass(self.jObj);
        Class obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `getMajorVersion` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function getMajorVersion() returns int {
        int externalObj = com_github_zafarkhaja_semver_Version_getMajorVersion(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getMinorVersion` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function getMinorVersion() returns int {
        int externalObj = com_github_zafarkhaja_semver_Version_getMinorVersion(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getNormalVersion` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getNormalVersion() returns string? {
        handle externalObj = com_github_zafarkhaja_semver_Version_getNormalVersion(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `getPatchVersion` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function getPatchVersion() returns int {
        int externalObj = com_github_zafarkhaja_semver_Version_getPatchVersion(self.jObj);
        return externalObj;
    }

    # The function that maps to the `getPreReleaseVersion` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `string?` value returning from the Java mapping.
    function getPreReleaseVersion() returns string? {
        handle externalObj = com_github_zafarkhaja_semver_Version_getPreReleaseVersion(self.jObj);
        return java:toString(externalObj);
    }

    # The function that maps to the `greaterThan` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `Version` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function greaterThan(Version arg0) returns boolean {
        boolean externalObj = com_github_zafarkhaja_semver_Version_greaterThan(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `greaterThanOrEqualTo` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `Version` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function greaterThanOrEqualTo(Version arg0) returns boolean {
        boolean externalObj = com_github_zafarkhaja_semver_Version_greaterThanOrEqualTo(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `hashCode` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `int` value returning from the Java mapping.
    function hashCode() returns int {
        int externalObj = com_github_zafarkhaja_semver_Version_hashCode(self.jObj);
        return externalObj;
    }

    # The function that maps to the `incrementBuildMetadata` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `Version` value returning from the Java mapping.
    function incrementBuildMetadata() returns Version {
        handle externalObj = com_github_zafarkhaja_semver_Version_incrementBuildMetadata(self.jObj);
        Version obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `incrementMajorVersion` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `Version` value returning from the Java mapping.
    function incrementMajorVersion() returns Version {
        handle externalObj = com_github_zafarkhaja_semver_Version_incrementMajorVersion(self.jObj);
        Version obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `incrementMajorVersion` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Version` value returning from the Java mapping.
    function incrementMajorVersion2(string arg0) returns Version {
        handle externalObj = com_github_zafarkhaja_semver_Version_incrementMajorVersion2(self.jObj, java:fromString(arg0));
        Version obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `incrementMinorVersion` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `Version` value returning from the Java mapping.
    function incrementMinorVersion() returns Version {
        handle externalObj = com_github_zafarkhaja_semver_Version_incrementMinorVersion(self.jObj);
        Version obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `incrementMinorVersion` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Version` value returning from the Java mapping.
    function incrementMinorVersion2(string arg0) returns Version {
        handle externalObj = com_github_zafarkhaja_semver_Version_incrementMinorVersion2(self.jObj, java:fromString(arg0));
        Version obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `incrementPatchVersion` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `Version` value returning from the Java mapping.
    function incrementPatchVersion() returns Version {
        handle externalObj = com_github_zafarkhaja_semver_Version_incrementPatchVersion(self.jObj);
        Version obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `incrementPatchVersion` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Version` value returning from the Java mapping.
    function incrementPatchVersion2(string arg0) returns Version {
        handle externalObj = com_github_zafarkhaja_semver_Version_incrementPatchVersion2(self.jObj, java:fromString(arg0));
        Version obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `incrementPreReleaseVersion` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `Version` value returning from the Java mapping.
    function incrementPreReleaseVersion() returns Version {
        handle externalObj = com_github_zafarkhaja_semver_Version_incrementPreReleaseVersion(self.jObj);
        Version obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `lessThan` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `Version` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function lessThan(Version arg0) returns boolean {
        boolean externalObj = com_github_zafarkhaja_semver_Version_lessThan(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `lessThanOrEqualTo` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `Version` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function lessThanOrEqualTo(Version arg0) returns boolean {
        boolean externalObj = com_github_zafarkhaja_semver_Version_lessThanOrEqualTo(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `notify` method of `com/github/zafarkhaja/semver/Version`.
    function notify() {
        () obj = com_github_zafarkhaja_semver_Version_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `com/github/zafarkhaja/semver/Version`.
    function notifyAll() {
        () obj = com_github_zafarkhaja_semver_Version_notifyAll(self.jObj);
    }

    # The function that maps to the `satisfies` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `Expression` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function satisfies(Expression arg0) returns boolean {
        boolean externalObj = com_github_zafarkhaja_semver_Version_satisfies(self.jObj, arg0.jObj);
        return externalObj;
    }

    # The function that maps to the `satisfies` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    function satisfies2(string arg0) returns boolean {
        boolean externalObj = com_github_zafarkhaja_semver_Version_satisfies2(self.jObj, java:fromString(arg0));
        return externalObj;
    }

    # The function that maps to the `setBuildMetadata` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Version` value returning from the Java mapping.
    function setBuildMetadata(string arg0) returns Version {
        handle externalObj = com_github_zafarkhaja_semver_Version_setBuildMetadata(self.jObj, java:fromString(arg0));
        Version obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `setPreReleaseVersion` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Version` value returning from the Java mapping.
    function setPreReleaseVersion(string arg0) returns Version {
        handle externalObj = com_github_zafarkhaja_semver_Version_setPreReleaseVersion(self.jObj, java:fromString(arg0));
        Version obj = new(externalObj);
        return obj;
    }

    # The function that maps to the `wait` method of `com/github/zafarkhaja/semver/Version`.
    # 
    # + return - The `error?` value returning from the Java mapping.
    function 'wait() returns error? {
        error|() obj = com_github_zafarkhaja_semver_Version_wait(self.jObj);
        if (obj is error) {
            InterruptedException e = InterruptedException(message = obj.reason(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait2(int arg0) returns error? {
        error|() obj = com_github_zafarkhaja_semver_Version_wait2(self.jObj, arg0);
        if (obj is error) {
            InterruptedException e = InterruptedException(message = obj.reason(), cause = obj);
            return e;
        }
    }

    # The function that maps to the `wait` method of `com/github/zafarkhaja/semver/Version`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    function 'wait3(int arg0, int arg1) returns error? {
        error|() obj = com_github_zafarkhaja_semver_Version_wait3(self.jObj, arg0, arg1);
        if (obj is error) {
            InterruptedException e = InterruptedException(message = obj.reason(), cause = obj);
            return e;
        }
    }
};

# The function that maps to the `forIntegers` method of `com/github/zafarkhaja/semver/Version`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `Version` value returning from the Java mapping.
function Version_forIntegers(int arg0) returns Version {
    handle externalObj = com_github_zafarkhaja_semver_Version_forIntegers(arg0);
    Version obj = new(externalObj);
    return obj;
}

# The function that maps to the `forIntegers` method of `com/github/zafarkhaja/semver/Version`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `Version` value returning from the Java mapping.
function Version_forIntegers2(int arg0, int arg1) returns Version {
    handle externalObj = com_github_zafarkhaja_semver_Version_forIntegers2(arg0, arg1);
    Version obj = new(externalObj);
    return obj;
}

# The function that maps to the `forIntegers` method of `com/github/zafarkhaja/semver/Version`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + arg2 - The `int` value required to map with the Java method parameter.
# + return - The `Version` value returning from the Java mapping.
function Version_forIntegers3(int arg0, int arg1, int arg2) returns Version {
    handle externalObj = com_github_zafarkhaja_semver_Version_forIntegers3(arg0, arg1, arg2);
    Version obj = new(externalObj);
    return obj;
}

# The function that maps to the `valueOf` method of `com/github/zafarkhaja/semver/Version`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + return - The `Version` value returning from the Java mapping.
function Version_valueOf(string arg0) returns Version {
    handle externalObj = com_github_zafarkhaja_semver_Version_valueOf(java:fromString(arg0));
    Version obj = new(externalObj);
    return obj;
}

# The function that retrieves the value of the public field BUILD_AWARE_ORDER.
#
# + return - The `Comparator` value of the field.
function Version_getBUILD_AWARE_ORDER() returns Comparator {
    
    Comparator obj = new(com_github_zafarkhaja_semver_Version_getBUILD_AWARE_ORDER());
    return obj;
}

// External interop functions for mapping public methods.

function com_github_zafarkhaja_semver_Version_compareTo(handle receiver, handle arg0) returns int = @java:Method {
    name: "compareTo",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["com.github.zafarkhaja.semver.Version"]
} external;

function com_github_zafarkhaja_semver_Version_compareWithBuildsTo(handle receiver, handle arg0) returns int = @java:Method {
    name: "compareWithBuildsTo",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["com.github.zafarkhaja.semver.Version"]
} external;

function com_github_zafarkhaja_semver_Version_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["java.lang.Object"]
} external;

function com_github_zafarkhaja_semver_Version_forIntegers(int arg0) returns handle = @java:Method {
    name: "forIntegers",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["int"]
} external;

function com_github_zafarkhaja_semver_Version_forIntegers2(int arg0, int arg1) returns handle = @java:Method {
    name: "forIntegers",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["int", "int"]
} external;

function com_github_zafarkhaja_semver_Version_forIntegers3(int arg0, int arg1, int arg2) returns handle = @java:Method {
    name: "forIntegers",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["int", "int", "int"]
} external;

function com_github_zafarkhaja_semver_Version_getBuildMetadata(handle receiver) returns handle = @java:Method {
    name: "getBuildMetadata",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_getMajorVersion(handle receiver) returns int = @java:Method {
    name: "getMajorVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_getMinorVersion(handle receiver) returns int = @java:Method {
    name: "getMinorVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_getNormalVersion(handle receiver) returns handle = @java:Method {
    name: "getNormalVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_getPatchVersion(handle receiver) returns int = @java:Method {
    name: "getPatchVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_getPreReleaseVersion(handle receiver) returns handle = @java:Method {
    name: "getPreReleaseVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_greaterThan(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "greaterThan",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["com.github.zafarkhaja.semver.Version"]
} external;

function com_github_zafarkhaja_semver_Version_greaterThanOrEqualTo(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "greaterThanOrEqualTo",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["com.github.zafarkhaja.semver.Version"]
} external;

function com_github_zafarkhaja_semver_Version_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_incrementBuildMetadata(handle receiver) returns handle = @java:Method {
    name: "incrementBuildMetadata",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_incrementMajorVersion(handle receiver) returns handle = @java:Method {
    name: "incrementMajorVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_incrementMajorVersion2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "incrementMajorVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["java.lang.String"]
} external;

function com_github_zafarkhaja_semver_Version_incrementMinorVersion(handle receiver) returns handle = @java:Method {
    name: "incrementMinorVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_incrementMinorVersion2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "incrementMinorVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["java.lang.String"]
} external;

function com_github_zafarkhaja_semver_Version_incrementPatchVersion(handle receiver) returns handle = @java:Method {
    name: "incrementPatchVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_incrementPatchVersion2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "incrementPatchVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["java.lang.String"]
} external;

function com_github_zafarkhaja_semver_Version_incrementPreReleaseVersion(handle receiver) returns handle = @java:Method {
    name: "incrementPreReleaseVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_lessThan(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "lessThan",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["com.github.zafarkhaja.semver.Version"]
} external;

function com_github_zafarkhaja_semver_Version_lessThanOrEqualTo(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "lessThanOrEqualTo",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["com.github.zafarkhaja.semver.Version"]
} external;

function com_github_zafarkhaja_semver_Version_notify(handle receiver) = @java:Method {
    name: "notify",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_satisfies(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "satisfies",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["com.github.zafarkhaja.semver.expr.Expression"]
} external;

function com_github_zafarkhaja_semver_Version_satisfies2(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "satisfies",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["java.lang.String"]
} external;

function com_github_zafarkhaja_semver_Version_setBuildMetadata(handle receiver, handle arg0) returns handle = @java:Method {
    name: "setBuildMetadata",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["java.lang.String"]
} external;

function com_github_zafarkhaja_semver_Version_setPreReleaseVersion(handle receiver, handle arg0) returns handle = @java:Method {
    name: "setPreReleaseVersion",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["java.lang.String"]
} external;

function com_github_zafarkhaja_semver_Version_valueOf(handle arg0) returns handle = @java:Method {
    name: "valueOf",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["java.lang.String"]
} external;

function com_github_zafarkhaja_semver_Version_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: []
} external;

function com_github_zafarkhaja_semver_Version_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["long"]
} external;

function com_github_zafarkhaja_semver_Version_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    class: "com.github.zafarkhaja.semver.Version",
    paramTypes: ["long", "int"]
} external;

// External interop functions for mapping public fields.

function com_github_zafarkhaja_semver_Version_getBUILD_AWARE_ORDER() returns handle = @java:FieldGet {
    name: "BUILD_AWARE_ORDER",
    class: "com.github.zafarkhaja.semver.Version"
} external;


