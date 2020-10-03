---
layout:         post
title:          Apex Triggers
date:           2020-10-03 15:15:42 +0200
categories:     [tech]
tags:           []
comments:       true
excerpt:        >
    TODO
image:          /assets/bg-coffee-84624_1280.jpg
ads:            none
---

# Apex Triggers

Apex triggers enable us to perfrom custom actions before or after events to records in Salesforce, such as insertions, updates, or deletions. 

We can use triggers to do anything you can do in Apex, including executing SOQL and DML or calling custom Apex methods.

Use triggers to perform tasks that can't be done by using the point-and-click tools in the Salesforce user interface. For example, if validating a field value or updating a field on a record, use validation rules and workflow rules instead.

Triggers can be defined for top-level standard objects, such as Account or Contact, custom objects, and some standard child objects. Triggers are active by default when created. Salesforce automatically fires active triggers when the specified database events occur.

## Trigger Syntax

A trigger definition starts with the `trigger` keyword. It is then followed by the name of the trigger, the Salesforce object that the trigger is associated with, and the codtions under which it fires. A trigger has the following syntax: 

```java
trigger TriggerName on ObjectName (trigger_event) {
	code_block
}
```

To execute a trigger before or after insert, update, and undelete operations, specify multiple trigger events in a comma-separated list. The events we can specify are: 

- `before insert`
- `before update`
- `before delete`
- `after insert`
- `after update`
- `after delete`
- `after undelete`

**Example**

This simple trigger fires before we insert an account and writes a message to the debug log.

```java
trigger HelloWorldTrigger on Account (before insert) {
	System.debug('Hello World');
}
```

## Type of Triggers

- ***Before triggers*** are used to update or validate record valudes before they're saved to the database.
- ***After triggers*** are used to access field values that are set by the system (such as a record's *Id* Or *LastModifiedDate* field), and to affect changes in other records. The records that fire the *after trigger* are read-only.

### Using Context Variables

To access the records that caused the trigger to fire, use context variables. For example, `Trigger.New` contains all the records that were inserted in insert or update triggers. `Trigger.Old` provides the old version of sObjects before they were updated in update triggers, or a list of deleted sObjects in delete triggers. Triggers can fire when one record is inserted, or when many records are inserted in bulk via the API or Apex. Therefore, context variables, such as `Trigger.New`, can contain only one record or multiple records. You can iterate over `Trigger.New` to get each individual sObject.

For example the following trigger, it iterates over each account in a for loop and updates the Description field for each.

```java
trigger HelloWorldTrigger on Account (before insert) {
	for(Account a : Trriger.New) {
		a.Description = 'New description';
	}
}
```

Some other context variables return a Boolean value to indicate whether the trigger was fired due to an update or some other event. These variables are useful when a trigger combines multiple events. For example:

```java
trigger ContextExampleTrigger on Account (before insert, after insert, after delete) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            // Process before insert
        } else if (Trigger.isAfter) {
            // Process after insert
        }        
    }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}
```

## Bulk Apex Triggers

Apex triggers are optimized to operate in bulk. We recommend using bulk design patterns for processing records in triggers.

### Performing Bulk DML

When performing DML calls in a trigger or in a class, perform DML calls on a collection of sObjects when possible. Performing DML on each sObject individually uses resources inefficiently. The Apex runtime allows up to 150 DML calls in one transaction