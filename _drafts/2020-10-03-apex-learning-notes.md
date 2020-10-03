---
layout:         post
title:          Apex learning notes
date:           2020-10-03 15:13:22 +0200
categories:     [tech]
tags:           []
comments:       true
excerpt:        >
    TODO
image:          /assets/bg-coffee-84624_1280.jpg
ads:            none
---

# Apex learning notes

***Reference:*** [Salesforce Trailhead : Get Started with Apex](https://trailhead.salesforce.com/en/content/learn/modules/apex_database/apex_database_intro?trail_id=force_com_dev_beginner)

## Get Started with Apex

- Java-like syntax.
- A object-oriented programming languages, support object-oriented languages constructs.
- Unlike other object-oriented programming languages, Apex supports: 
  - Cloud development as Apex is stored, compiled, and executed in the cloud.
  - Triggers, which are similar to triggers in database systems.
  - Database statements that allow you to make direct database calls and query languages to query and search data.
  - Transactions and rollbacks.
  - The global access modifier, which is more permissive than the public modifier and allows access across namespaces and applications.
  - Versioning of custom code.
- Apex is a **case-insensitive** language.

## Date Types

Apex supports various data types, including a data type specific to Salesforce—the ***sObject*** data type.

Apex supports the following data types.

- A primitive: Integer, Double, Long, Date, Datetime, String, ID, Boolean
- An sObject: either as a generic sObject or as a specific sObject, such as an Account, Contact, or MyCustomObject__c
- A collection, including:
  - A list (of array) of primitives, sObjects, user defined objects, objects created from Apex classes, or collections.
  - A set of primitives
  - A map from a primitive to a primitive, sObjects, or collection
- A typed list of values, also known as an ***enum***
- User-defined Apex classes.
- System-supplied Apex classes.

### Apex Collections: List

Lists hold an ***ordered collection of objects***. Lists in Apex are synonymous with arrays and the two can be used interchangeably.

### Anonymous Apex 

Anonymous Apex allows you to run lines of code on the fly and is a handy way to invoke Apex, especially to test out functionality.

**Developer Console -> Debug -> Open Execute Anonymous Windows **

**Note**: Triggers can also invoke Apex.

### sObjects

***Ref***: [Trailhead modul: Use sObjects](https://trailhead.salesforce.com/content/learn/modules/apex_database/apex_database_sobjects?trail_id=force_com_dev_beginner)

Every record in Salesforce is natively represented as an ***sObject*** in Apex.

Each Salesforce record is represented as an sObject before it is inserted into Salesforce. Likewise, when persisted records are retrieved from Salesforce, they’re stored in an sObject variable

Standard and custom object records in Salesforce map to their sObject types in Apex. Here are some common sObject type names in Apex used for standard objects.

- Account
- Contact
- Lead
- Opportunity

If you’ve added custom objects in your organization, use the ***API names*** of the custom objects in Apex. For example, a custom object called Merchandise corresponds to the Merchandise__c sObject in Apex.

#### Creating sObject Variables

To create an sObject, you need to declare a variable and assign it to an sObject instance. The data type of the variable is the sObject type.

The following example creates an sObject variable of type Account and assigns it to a new account with the name Acme.

```java
Account acct = new Account(Name='Acme');
```

#### sObject and Field Names

The names of sObjects correspond to the ***API names of the corresponding standard or custom objects***. Similarly, the names of sObject fields correspond to the ***API names of the corresponding fields***.

#### Rules for API names for custom objects and custom fields

- For custom objects and custom fields, the API name always ends with the ***__c*** suffix.
- For custom relationship fields, the API name ends with the ***__r*** suffix.
- Spaces in labels are replaced with underscores in API names

#### Finding Object and Field Names

To find out the names of standard objects and their fields for use in Apex, refer to the [Object Reference for Salesforce and Lightning Platform](https://developer.salesforce.com/docs/atlas.en-us.224.0.object_reference.meta/object_reference/).

For custom objects, look up the object and field API names in your org. From Setup, enter Objects in the Quick Find box, then select **Objects**, and then click your object’s name.

#### Creating sObjects and Adding Fields

Like with any other object, sObjects are created with the new operator:

```java
Account acct = new Account();
```

#### Working with the Generic sObject Data Type

When we don't know the type of sObject, we can use the generic sObject data type. 

Variables that are declared with the generic sObject data type ***can reference any Salesforce record***, whether it is a standard or custom object record.

```java
sObject sobj1 = new Account(Name='Trailhead');
sObject sobj2 = new Book__c(Name='Workbook 1');
```

#### Casting Generic sObjects to Specific sObject Types

When you’re dealing with generic sObjects, you sometimes need to cast your sObject variable to a specific sObject type. One of the benefits of doing so is to be able to access fields using dot notation, which is not available on the generic sObject

This example shows how to cast a generic sObject to Account.

```java
// Cast a generic sObject to an Account
Account acct = (Account)myGenericSObject;
// Now, you can use the dot notation to access fields on Account
String name = acct.Name;
String phone = acct.Phone;
```

***Note:*** Unlike specific sObjects types, generic sObjects can be created only through the newSObject() method. Also, the fields of a generic sObject can be accessed only through the put() and get() methods.

## DML: Data Manipulation Language

***Reference:*** [Trailhead: Manipulate Records with DML](https://trailhead.salesforce.com/content/learn/modules/apex_database/apex_database_dml?trail_id=force_com_dev_beginner)

### Manipulate Records with DML

DML provides a straightforward way to manage records by providing simple statements to insert, update, merge, delete, and restore records.

Because Apex is a data-focused language and is saved on the Lightning Platform, it has direct access to your data in Salesforce. Unlike other programming languages that require additional setup to connect to data sources, with Apex DML, managing records is made easy! By calling DML statements, you can quickly perform operations on your Salesforce records.

This example adds the Acme account to Salesforce. An account sObject is created first and then passed as an argument to the `insert` statement, which persists the record in Salesforce.

```java
// Create the account sObject
Account acct = new Acount(Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
// Insert the account by using DML
insert acct;
```

### DML statements

The following DML statements are available

- `insert`
- `update`
- `upsert`
- `delete`
- `undelete`
- `merge`

Each DML statement accepts either a single sObject or a list (or array) of sObjects. Operating on a list of sObjects is a more efficient way for processing records.

The `upsert` and `merge` statements are particular to Salesforce.

The `upsert` DML operation creates new records and updates sObject records within a single statement, using a specified field to determine the presence of existing objects, or the ID field if no field is specified.

The `merge` statement merges up to three records of the same sObject type into one of the records, deleting the others, and re-parenting any related records.

We should retrieve a record from the database to obtain its fields, including the ID field, in writing a query by using SOQL, not with DML.

#### Upserting Records

If you have a list containing a mix of new and existing records, you can process insertions and updates to all records in the list by using the upsert statement. Upsert helps avoid the creation of duplicate records and can save you time as you don’t have to determine which records exist first.

## Database Methods

Apex contains the built-in Database class, which provides methods that perform DML operations and mirror the DML statement counterparts.

These Database methods are static and are called on the class name.

- `Database.insert()`
- `Database.update()`
- `Database.upsert()`
- `Database.delete()`
- `Database.undelete()`
- `Database.merge()`

#### Should You Use DML Statements or Database Methods?

- Use DML statements if you want any error that occurs during bulk DML processing to be thrown as an Apex exception that immediately interrupts control flow (by using `try. . .catch` blocks).
- Use Database class methods if you want to allow partial success of a bulk DML operation—if a record fails, the remainder of the DML operation can still succeed.

## SOQL: Salesforce Object Query Language

***Reference:*** [Trailhead: Write Queries](https://trailhead.salesforce.com/content/learn/modules/apex_database/apex_database_soql?trail_id=force_com_dev_beginner)

Salesforce Object Query Language is similar to the standard SQL language but is customized for the Lightning Platform.

Because Apex has direct access to Salesforce records that are stored in the database, we can embed SOQL queries in our Apex code and get results in a straightforward fashion. When SOQL is embedded in Apex, it is referred to as ***inline SOQL***.

To include SOQL queries within your Apex code, wrap the SOQL statement **within square brackets and assign the return value to an array of sObjects. **

For example: 

```java
Account[] accts = [SELECT Name,Phone FROM Account];
```

### Basic SOQL Syntax

This is the syntax of a basic SOQL query:

```sql
SELECT fields FROM ObjectName [WHERE Condition]
```

The `WHERE` clause is optional. For example: 

```sql
SELECT Name,Phone FROM Account
```

**Note: Beyond the Basics**

Unlike other SQL languages, we can't specify `*` for all fields, we must specify every field we want to get explicitly. If we try to access a field we haven't specified in the SELECT clause, we will get an error because the field hasn't been retrieved.

We don’t need to specify the Id field in the query as it is always returned in Apex queries, whether it is specified in the query or not. For example: `SELECT Id,Phone FROM Account` and `SELECT Phone FROM Account` are equivalent statements. The only time we may want to specify the Id field if it is the only field we are retrieving because we have to list at least one field: `SELECT Id FROM Account`.  You may want to specify the Id field also when running a query in the Query Editor as the *ID field won’t be displayed unless specified*.

- **Filtering Query Results with Conditions by using `WHERE`**  Matching can be done with `=` or  fuzzy matches `like`.

- **Ordering Query Results by using `ORDER BY`**. We can sort on most fields, including numeric and text fields, buy we can't sort on fields like *rich text and multi-select picklists*.

- **Limiting the Number of Records Returned**. We can limit the number of records returned to an arbitrary number by adding the `LIMIT n`. When `n` is 1, we got an field, not an array.

  ```sql
  Account oneAccountOnly = [SELECT Name, Phone FROM Account LIMIT 1];
  ```

- **Combining All Pieces Together**. We can combine the optional clauses in one query, in the following order: 

  ```sql
  SELECT Name, Phone FROM Account
  					WHERE (Name = 'SFDC Computing' AND NumberOfEmployees>25)
  					ORDER BY Name
  					LIMIT 10
  ```

- **Accessing Variables in SOQL Queries**. SOQL statements in Apex can reference Apex code variable and expressions if the are preceded by a colon (`:`). The use of a local variable within a SOQL statement is called a ***bind***. 

  ```java
  String targetDDepartment = 'Wingo';
  Contact[] techContacts = [SELECT FirstName, LastName
                           FROM Contact WHERE Department=:targetDepartment];
  ```

## SOSL: Salesforce Objects Search Language

Salesforce Object Search Language (SOSL) is a Salesforce search language that is used to perform text searches in records. Use SOSL to search fields across multiple standard and custom object records in Salesforce. SOSL is similar to Apache Lucene.

We can embed SOSL queries directly in our Apex code. When SOSL is embedded in Apex, it is referred to as ***inline*** SOSL.

This is an example of a SOSL query that searches for accounts and contacts that have any fields with the word 'SFDC'.

```java
List<List<SObject>> searchList = [FIND 'SFDC' IN ALL FIELDS 
                                      RETURNING Account(Name), Contact(FirstName,LastName)];
```

### Differences and Similarities Between SOQL and SOSL

- Like SOQL, SOSL allows you to search your organization’s records for specific information. Unlike SOQL, which can only query one standard or custom object at a time, a single SOSL query can search all objects.

- Another difference is that SOSL matches fields based on a word match while SOQL performs an exact match by default (when not using wildcards). 

SOQL and SOSL are two separate languages with different syntax. Each language has a distinct use case: 

- Use SOQL to retrieve records for a single object.
- Use SOSL to search fields across multiple objects. SOSL queries can search most text fields on an object.

**Note**

The search query in the Query Editor and the API must be enclosed within curly brackets (`{Wingo}`). In contrast, in Apex the search query is enclosed within single quotes (`'Wingo'`).

### Basic SOSL Syntax

SOSL allows you to specify the following search criteria:

- Text expression (single word or a phrase) to search for
- Scope of fields to search
- List of objects and fields to retrieve
- Conditions for selecting rows in the source objects.

This is the syntax of a basic SOSL query:

```sql
FIND 'SearchQuery' [IN SearchGroup] [RETURNING ObjectsAndFields]
```

- ***SearchQuery*** is the text to search for (a single word or a phrase). Search terms can be grouped with logical operators (AND, 

  OR) and parentheses. Also, search terms can include wildcard characters ***(\*, ?)***.

- ***Text searches are case-insensitive.***

- *SearchGroup* is optional. It is the scope of the fields to search. If not specified, the default search scope is all fields. SearchGroup can take one of the following values.

  - `ALL FIELDS`
  - `NAME FIELDS`
  - `EMAIL FIELDS`
  - `PHONE FIELDS`
  - `SIDEBAR FIELDS`

- *ObjectsAndFields*  is optional. It is the information to return in the search result—a list of one or more sObjects and, within each sObject, list of one or more fields, with optional values to filter against. If not specified, the search results contain the IDs of all objects found.

**SOSL Apex Example**

The SOSL search results are returned in a list of lists. Each list contains an array of the returned records. In this case, the list has two elements. At index 0, the list contains the array of accounts. At index 1, the list contains the array of contacts.

```java
List<List<sObject>> searchList = [FIND 'Wingo OR SFDC' IN ALL FIELDS 
                   RETURNING Account(Name),Contact(FirstName,LastName,Department)];
Account[] searchAccounts = (Account[])searchList[0];
Contact[] searchContacts = (Contact[])searchList[1];
System.debug('Found the following accounts.');
for (Account a : searchAccounts) {
    System.debug(a.Name);
}
System.debug('Found the following contacts.');
for (Contact c : searchContacts) {
    System.debug(c.LastName + ', ' + c.FirstName);
}
```

### SOSL filter, reorder, limit returned results

Because SOSL queries can return multiple sObjects, those filters are applied within each sObject inside the RETURNING clause.

You can filter SOSL results by adding conditions in the WHERE clause for an object. For example, this results in only accounts whose industry is Apparel to be returned: `RETURNING Account (Name, Industry  WHERE Industry='Apparel')`

Likewise, ordering results for one sObject is supported by adding ORDER BY for an object. For example this causes the returned accounts to be ordered by the Name field: `RETURNING Account(Name, Industry ORDER BY Name)`.

The number of returned records can be limited to a subset of records. This example limits the returned accounts to 10 only: `RETURNING Account(Name, Industry LIMIT 10)`