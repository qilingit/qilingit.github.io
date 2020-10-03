---
layout:         post
title:          Visualforce notes
date:           2020-10-03 15:08:21 +0200
categories:     [tech]
tags:           []
comments:       true
excerpt:        >
    TODO
image:          /assets/bg-coffee-84624_1280.jpg
ads:            none
---

# Visualforce Notes

## Introduce to Visualforce

Visualforce is a web development framework that enables developers to build sophisticated, custom user interfaces for mobile and desktop apps that can be hosted on the Lightning Platform.

## Create Visualforce Pages in the Developer Console

To see the page we have created, we can click **Preview**, the rendered page opens in a new window. Note that this page preview shows our page without Salesforce styling. To see our page in the context of Lightning Experience, return to our main Lightning Experience browser window (***The windows which we can see our apps with Lightning Experience***, neither class experience, nor any windows of browser) to open JavaScript console and enter the following code. Don’t forget to replace `pageName` with your page’s name:

```javascript
$A.get("e.force:navigateToURL").setParams(
    {"url": "/apex/pageName"}).fire();
```

For something a little more convenient to use, add the following bookmarklet to your browser’s menu or toolbar. (We’ve wrapped this code for readability.)

```java
javascript:(function(){ 
    var pageName = prompt('Visualforce page name:'); 
    $A.get("e.force:navigateToURL").setParams(
        {"url": "/apex/" + pageName}).fire();})();
```

This bookmarklet prompts you for a page name, and then fires the event to navigate directly to it. Useful!

## Two other built-in ways to create and edit Visualforce pages in Salesforce.

### The development mode "quick fix" and footer

#### What is development mode "quick fix" and footer ? And how to enable and use it ?

***Reference:*** [Forcetalks Answer](https://www.forcetalks.com/salesforce-topic/in-salesforce-what-is-quick-fix-in-development-mode/)

> Although you can view and edit Visualforce page definitions on the Visualforce Pages page in Setup, enabling Visualforce development mode is the best way to build Visualforce pages. Development mode provides you with:
>
> - A special development footer on every Visualforce page that includes the page’s view state, any associated controller, a link to the component reference documentation, and a page markup editor that offers highlighting, find-replace functionality, and auto-suggest for component tag and attribute names.
> - The ability to define new Visualforce pages just by entering a unique URL.
> - Error messages that include more detailed stack traces than what standard users receive.
>
> To enable Visualforce development mode:
>
> - From your personal settings, enter Advanced User Details in the Quick Find box, then select Advanced User Details. No results? Enter Personal Information in the Quick Find box, then select Personal Information.
> - Click Edit.
> - Select the Development Mode checkbox.
> - Optionally, select the Show View State in Development Mode checkbox to enable the View State tab on the development footer. This tab is useful for monitoring the performance of your Visualforce pages.
> - Click Save.
>
> Hope this helps.

More details about development mode: [Visualforce Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_tools_edit_toolbar.htm)

### The Setup editor

The Setup editor, available in Setup by entering Visualforce Pages in the Quick Find box, then selecting **Visualforce Pages**, is the most basic editor, but it provides access to page settings that aren’t available in the Developer Console or development mode footer.

## Other external tools

Visual Studio Code extensions, Lightning Platform IDE plug-in for Eclipse.

## Use Simple Variables and Formulas

### Introduction to Global Variables and Visualforce Expressions

- Global Variables: Visualforce pages can display data retrieved from the database or web services, data that changes depending on who is logged on and viewing the page, and so on. This dynamic data is accessed in markup through the use of global variables, calculations, and properties made available by the page’s controller.
- Visualforce Expressions: Together these are described generally as Visualforce expressions. A Visualforce expression is any set of literal values, variables, sub-expressions, or operators that can be resolved to a single value. Method calls aren't allowed in expressions.

> **Note**: this is a little like Data Binding of SAP UI5

### Syntax

`{! expression }`

Anything inside the `{! }` delimiters is evaluated and dynamically replaced when the page is rendered or when the value is used. Whitespace is ignored.

The resulting value can be a primitive (integer, string, and so on), a Boolean, an sObject, a controller method such as an action method, and other useful results.

### Global Variables

Use global variables to access and display system values and resources in your Visualforce markup.

For example, Visualforce provides information about the logged-in user in a global variable called `$User`. You can access fields of the `$User` global variable (and any others) using an expression of the following form: `{! $GlobalName.fieldName }`.

**Note: ** Visualforce expressions are case-insensitive, and spaces within the `{! }` are ignored.

### Formula Expressions

Visualforce also supports formulas that let us manipulate values.

[Visualforce global variables reference](https://developer.salesforce.com/docs/atlas.en-us.224.0.pages.meta/pages/pages_variables_global.htm)

[Visualforce functions reference](https://developer.salesforce.com/docs/atlas.en-us.224.0.pages.meta/pages/pages_variables_functions.htm)

## Use Standard Controllers

### MVC in Visualforce

- **Model**: Data
- **View**: the Visualforce page
- **Controller**: Most standard and all custom objects have built-in standard controllers that can be used to interact with the data associated with object, so we don't need to write the code for the controller ourselves. We can extend the standard controller to add new functionality, or create custom controllers from scratch. 

### Find a Record ID and Add It to the Request URL

#### How to find a Record ID ?

When the account details page finishes loading, look at the URL for the page. The URL will look something like this: `https://SalesforceInstance/lightning/r/Account/001D000000JRBes/view`.The record’s identifier, its ID, is the series of letters and numbers. In this example, it’s `001D000000JRBes` (but in your organization it’ll be different). It’s unique across all records of all object types in your organization.

#### Use the record ID and display data from a single record

1. Switch back to the preview page you opened from the Developer Console. Click into the URL field of the browser window, and at the end of the URL enter `&id=` and then paste in the record ID you copied previously. The URL should be something like this: `https://SalesforceInstance/apex/AccountSummary?core.apexpages.request.devconsole=1`**`&id=001D000000JRBes`**

2. At the beginning of your page markup, inside the `<apex:page>` tag, add the following attribute.

   ```java
   standardController="Account"
   ```

## Display Records, Fields, and Tables

In the editor, replace any markup with the following.

```java
<apex:page standardController="Account">
    {! Account.Name }
</apex:page>
```

### Display Record Details

```java
<apex:detail />
```

### Display Related Lists

Use `<apex:relatedList>` to display lists of records related to the current record.

```java
<apex:relatedList list="Contacts"/>
<apex:relatedList list="Opportunities" pageSize="5"/>
```

### Display Individual Fields

Use `<apex:outputField>` to display individual fields from a record.



```java
<apex:pageBlock title="Account Details">
    <apex:pageBlockSection>
        <apex:outputField value="{! Account.Name }"/>
        <apex:outputField value="{! Account.Phone }"/>
        <apex:outputField value="{! Account.Industry }"/>
        <apex:outputField value="{! Account.AnnualRevenue }"/>
    </apex:pageBlockSection>
</apex:pageBlock>
```

### Display A Table

Use `<apex:pageBlockTable>` to add a table of data to a page.



## Create & Use Custom Controllers

Controllers typically retrieve the data to be displayed in a Visualforce page, and contain code that executes in response to page actions, such as a button being clicked.

The `getContacts()` method is called a getter method, and it’s a general pattern, where **`{! someExpression }` **in your Visualforce markup automatically connects to a method named **`getSomeExpression``()`** in your controller. This is the simplest way for your page to get access to the data it needs to display.