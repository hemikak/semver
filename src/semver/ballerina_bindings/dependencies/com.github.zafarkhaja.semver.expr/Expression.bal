// This is an empty Ballerina object autogenerated to represent the `com.github.zafarkhaja.semver.expr.Expression` Java class.
//
// If you need the implementation of this class generated, please use the following command.
//
// $ ballerina bindgen [(-cp|--classpath) <classpath>...] [(-o|--output) <output>] (<class-name>...)
//
// E.g. $ ballerina bindgen com.github.zafarkhaja.semver.expr.Expression


import ballerina/java;

# Ballerina object mapping for Java interface `com/github/zafarkhaja/semver/expr/Expression`.
#
# + _Expression - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Object - The field that represents the superclass object `Object`.
@java:Binding {
    class: "com.github.zafarkhaja.semver.expr.Expression"
}
type Expression object {

    *java:JObject;

    ExpressionT _Expression = ExpressionT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `com/github/zafarkhaja/semver/expr/Expression` Java class.
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
};


