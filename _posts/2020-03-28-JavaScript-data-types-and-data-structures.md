---
layout: post
title:  "JavaScript data types and data structures"
date:   2020-03-28 14:45:39 +0100
categories: JavaScript
---
# JavaScript data types and data structures
[TOC]



## Dynamic typing

JavaScript is a *loosely typed* or a *dynamic* language. Variables in JavaScript are not directly associated with any particular value type, and any variable can be assigned (and resigned) values of all types:

```javascript
let foo = 42;    // foo is now a number
foo     = 'bar'; // foo is now a string
foo     = true;  // foo is now a boolean
```

------

## Data types

The latest ECMAScript standard defines eight data types:

- Seven data types that are primitives

  [^Notes]: explanation of primitives in part below

  - Boolean
  - Null
  - Undefined
  - Number
  - BigInt
  - String
  - Symbol

- and Object

### Primitive

In JavaScript, a **primitive** (primitive value, primitive data type) is data that is not an object and has no methods. 



Most of the time, a primitive value is represented directly at the lowest level of the language implementation. 



All primitive are immutable, i.e., they cannot be altered. It is important not to confuse a primitive itself with a variable assigned a primitive value. The variable may be reassigned a new value, but the existing value can not be changed in the ways that objects, arrays, and functions can be altered.

## Primitive values

### Boolean type

Boolean represents a logical entity and can have two values: `true` and `false`.

Boolean can be a *data* or a *object*, when it represent a data, a **Boolean** is a logical data type that can have only the value `true` or `false`; when it represent a object, the **`Boolean`** object is an object wrapper for a boolean value.

#### Description of builit-in *Boolean* object

The value passed as the first parameter is converted to a boolean value, if necessary. If the value is omitted or is `0`, `-0`, `null`, `false`, `NaN`, `undefined,` or the empty string (`""`), the object has an initial value of `false`. All other values, including any object, an empty array(`[]`),  or the string `"false"`, create an object with an initial value of `true`.



**Any** object of which the value is not `undefined` or `null`, including a `Boolean` object whose value is `false`, evaluates to `true`when passed to a conditional statement. For example, the condition in the following `if`statement evaluates to `true`:

```javascript
var x = new Boolean(false);
if (x) {
  // this code is executed
}
```





 See [Boolean](https://developer.mozilla.org/en-US/docs/Glossary/Boolean) and [`Boolean`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean) for more details.

### Null type

The Null type has exactly one value: null. See [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null) and [Null](https://developer.mozilla.org/en-US/docs/Glossary/Null) for more details.

### Undefined type

A variable that has not been assigned a value has the value `undefined`. 

`undefined` is a property of the *global object*. That is, it is a variable in global scope. The initial value of `undefined` is the primitive value `undefined`, a primitive value automatically assigned to variables that have just been declared, or to formal arguments for which there are no actual arguments.

See [`undefined`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) and [Undefined](https://developer.mozilla.org/en-US/docs/Glossary/Undefined) for more details.

#### Difference between Null and Undefined, between equality(==) and identity (===)

When checking for `null` or `undefined`, be aware of the difference equality(==) and identity (===) operators, as the former performs type-conversion.

```javascript
typeof null          // "object" (not "null" for legacy reasons)
typeof undefined     // "undefined"
null === undefined   // false
null  == undefined   // true
null === null        // true
null == null         // true
!null                // true
isNaN(1 + null)      // false
isNaN(1 + undefined) // true
```

JavaScript has both strict and type-converting comparisons. A strict comparison (e.g. `===`) is only true if the operands are of the same type and the contents match. The more commonly used abstract comparison (e.g. `==`) converts the operands to the same type before making the comparison. For relational abstract comparison (e.g., `<=`), the operands are first converted to primitives, then to same type, before comparison.





### Number type

ECMAScript has two built-in numeric types: **Number** and **BigInt** (see below).

The Number type is a [double-precision 64-bit binary format IEEE 754 value](http://en.wikipedia.org/wiki/Double_precision_floating-point_format) (number between -(2^53 - 1) and 2^53 - 1). In addition to representing floating-point numbers, the number type has three symbolic values: `+Infinity`, `-Infinity`, and `NaN`("**N**ot a **N**umber").

To check for the largest available value or smallest available value with `+Infinity`, `-Infinity`, we can use the constants `Number.MAX_VALUE`, `Number.MIN_VALUE`.  

The number type has only one integer with two representations: `0` is represented as both `-0` and `+0`. (`0` is an alias for `+0`.) 

A `BigInt` is created by appending `n` to the end of an integer or by calling the constructor. 

You can obtain the safest value that can be incremented with `Number`s by using the constant [`Number.MAX_SAFE_INTEGER`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER). With the introduction of `BigInt`s, you can operate with numbers beyond the [`Number.MAX_SAFE_INTEGER`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER).

This example demonstrates, where incrementing the [`Number.MAX_SAFE_INTEGER`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER) returns the expected result:

```javascript
> const x = 2n ** 53n;
9007199254740992n
> const y = x + 1n; 
9007199254740993n
```



### BigInt type

The `BigInt` type is a numeric primitive in JavaScript that can represent integers with arbitrary precision. With `BigInt`, you can safely store and operate on large integers even beyond the safe integer limit for `Number`s. 

You can use the operators `+`, `*`, `-`, `**`, and `%` with `BigInt`s—just like with `Number`s. A `BigInt` is not strictly equal to a `Number`, but it is loosely so.

A `BigInt` behaves like a `Number` in cases where it is converted to `Boolean`: `if`, `||`, `&&`, `Boolean`, `!`.

`BigInt`s cannot be operated on interchangeably with `Number`s. Instead a [`TypeError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError) will be thrown.

### String type

In JavaScript, `String` is a set of "element" of 16-bit unsigned integer values, each element in the String occupies a position.  JavaScript strings are immutable. 

#### Beware of "string-typing" your code!

Use strings for textual data. When representing complex data, parse strings and use the appropriate abstraction.

### Symbol type

Symbols are new to JavaScript in ECMAScript 2015. A symbol is a **unique** and **immutable** primitive value and may be used as the key of an Object property. 

#### Symbol type value

In [JavaScript](https://developer.mozilla.org/en-US/docs/Glossary/JavaScript), Symbol is a [primitive value](https://developer.mozilla.org/en-US/docs/Glossary/Primitive).

A value having the data type **Symbol** can be referred to as a "Symbol value". In a JavaScript runtime environment, a symbol value is created by invoking the function [`Symbol`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol), which dynamically produces an anonymous, unique value. A symbol may be used as an object property.

Symbol can have an optional description, but for debugging purposes only.

A **Symbol** value represents a unique identifier. For example:

```js
// Here are two symbols with the same description:
let Sym1 = Symbol("Sym")
let Sym2 = Symbol("Sym")
  
console.log(Sym1 === Sym2) // returns "false"
// Symbols are guaranteed to be unique.
// Even if we create many symbols with the same description,
// they are different values.
```

Symbol type is a new feature in ECMAScript 2015. There is no ECMAScript 5 equivalent for symbol.

#### Symbol JavaScript built-in class

The data type **symbol** is a [primitive data type](https://developer.mozilla.org/en-US/docs/Glossary/Primitive). The `Symbol()` function returns a value of type **symbol**, has static properties that expose several members of built-in objects, has static methods that expose the global symbol registry, and resembles a built-in object class, but is incomplete as a constructor because it does not support the syntax "`new Symbol()`".  

Every symbol value returned from `Symbol()` is unique.  A symbol value may be used as an identifier for object properties; this is the data type's primary purpose, although other use-cases exist, such as enabling opaque data types, or serving as an implementation-supported unique identifier in general.  Some further explanation about purpose and usage can be found in the [glossary entry for Symbol](https://developer.mozilla.org/en-US/docs/Glossary/Symbol).

#### Description

To create a new primitive symbol, you write `Symbol()` with an optional string as its description:

```js
let sym1 = Symbol()
let sym2 = Symbol('foo')
let sym3 = Symbol('foo')
```

### Objects

In computer science, an object is **a value in memory** which is possibly referenced by an `identifier`. 

#### Properties

in JavaScript, objects can be seen as a collection of properties. 

Property values can be values of any type, including other objects, which enables building complex data structures. Properties are identified using *key* values. A *key* value is either a String or a Symbol value. 

There are two types of object properties which have certain attributes: The *data* property and the *accessors* property. 

##### Data property

Associates of a key with a value, and has the following attributes: 

**Attributes of a data property**

| Attribute        | Type                | Description                                                  | Default value |
| :--------------- | :------------------ | :----------------------------------------------------------- | :------------ |
| [[Value]]        | Any JavaScript type | The value retrieved by a get access of the property.         | `undefined`   |
| [[Writable]]     | Boolean             | If `false`, the property's [[Value]] cannot be changed.      | `false`       |
| [[Enumerable]]   | Boolean             | If `true`, the property will be enumerated in [for...in](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...in) loops. See also [Enumerability and ownership of properties](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Enumerability_and_ownership_of_properties). | `false`       |
| [[Configurable]] | Boolean             | If `false`, the property cannot be deleted, cannot be changed to an accessor property, and attributes other than [[Value]] and [[Writable]] cannot be changed. | `false`       |

##### Accessor property

Associates a key with one of tow accessor functions (`get` and `set` ) to retrieve or store a value, and has the following attributes: 

**Attributes of an accessor property**

| Attribute        | Type                           | Description                                                  | Default value |
| :--------------- | :----------------------------- | :----------------------------------------------------------- | :------------ |
| [[Get]]          | Function object or `undefined` | The function is called with an empty argument list and retrieves the property value whenever a get access to the value is performed. See also [`get`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/get). | `undefined`   |
| [[Set]]          | Function object or `undefined` | The function is called with an argument that contains the assigned value and is executed whenever a specified property is attempted to be changed. See also [`set`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/set). | `undefined`   |
| [[Enumerable]]   | Boolean                        | If `true`, the property will be enumerated in [for...in](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...in) loops. | `false`       |
| [[Configurable]] | Boolean                        | If `false`, the property can't be deleted and can't be changed to a data property. | `false`       |

**Note:** Attribute is usually used by JavaScript engine, so you can't directly access it (see more about [`Object.defineProperty()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty)). That's why the attribute is put in double square brackets instead of single.



#### "Normal" objects, and functions

A JavaScript object is a mapping between *keys* and *values*. Keys are strings (or ` Symbol` ), and *values* can be anything This makes objects a natural fit for hashmpas.

Functions are regular objects with the additional capability of being *callable*.

#### Dates

When representing dates, the best choice is to use the built-in [`Date` utility](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date) in JavaScript.

#### Indexed collections: Arrays and typed Arrays

[Arrays](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Array) are regular objects for which there is a particular relationship between integer-keyed properties and the ` length` property. 

Additionally, arrays inherit from ` Array.prototype`, which provides to them a handful of convenient methods to manipulate arrays. For example, indexOf (searching a value in the array) or push (adding an element to the array), and so on. This makes Arrays a perfect candidate to represent lists or sets. 

#### Keyed collections: Maps, Sets, WeakMaps, WeakSets

These dqtq structures, introduced in ECMAScript Edition 6, take object references as keys. [`Set`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) and [`WeakSet`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakSet) represent a set of objects, while [`Map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) and [`WeakMap`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakMap) associate a value to an object.

The difference between  ` Maps` and `WeakMaps` is that in the former, object keys can be enumerated over. This allows garbage collection optimizations in the latter case. 

One could implement `Map`s and `Set`s in pure ECMAScript 5. However, since objects cannot be compared (in the sense of `<` "less than", for instance), look-up performance would necessarily be linear. Native implementations of them (including `WeakMap`s) can have look-up performance that is approximately logarithmic to constant time.

Usually, to bind data to a DOM node, one could set properties directly on the object, or use `data-*` attributes. This has the downside that the data is available to any script running in the same context. `Map`s and `WeakMap`s make it easy to *privately* bind data to an object.

#### Structured data: JSON

JSON (**J**ava**S**cript **O**bject **N**otation) is a lightweight data-interchange format, derived from JavaScript, but used by many programming languages. JSON builds universal data structures.

See [JSON](https://developer.mozilla.org/en-US/docs/Glossary/JSON) and [`JSON`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON) for more details.

*References*

- [MDN web docs: JavaScript data types and data structures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures)
- [MDN Web docs: Primitive](https://developer.mozilla.org/en-US/docs/Glossary/Primitive)
- [MDN Web docs: Standard built in objects - Boolean](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean)
- [MDN Web docs: Standard built in objects - Null](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null)
- [MDN Web docs: Comparison operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Comparison_Operators)
- [MDN Web docs: Symbol](https://developer.mozilla.org/en-US/docs/Glossary/Symbol)
- [MDN Web docs: JavaScript built in objects: Symbol](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol)