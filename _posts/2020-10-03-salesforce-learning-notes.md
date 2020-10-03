---
layout:         post
title:          Salesforce learning notes
date:           2020-10-03 15:06:02 +0200
categories:     [tech]
tags:           [Salesforce]
comments:       true
excerpt:        >
    TODO
image:          /assets/bg-coffee-84624_1280.jpg
ads:            none
---

# Salesforce learning notes

- Every time you create a custom object, you automatically get something called Chatter feed tracking. Chatter feed tracking provides a way for multiple people to comment and collaborate on a particular record. The discussions and decisions are stored on the record so everyone can stay up to date on important decisions.

**High impact, low effort. As you start building with the platform, keep your eye out for processes with**:

- Heavy email collaboration
- Reliance on spreadsheets
- Shared local documents
- Time-intensive, repetitive manual steps
- Impact on only a few departments (you want to minimize the number of stakeholders while you’re still learning)

Processes with these traits are great candidates for early projects on the Salesforce platform.

**Use cases for Salesforce:**

- HR
- IT
- 

| Department   | Use cases                                                    |
| ------------ | ------------------------------------------------------------ |
| Finance      | Budget managementContract managementPricing                  |
| Product      | Warranty management, Preproduction testing, Product ideas and innovation |
| Supply Chain | Procurement, Vendor management, Logistics                    |
| Ops          | Asset and facilities management, Merger and acquisition enablement, Business agility |

## Salesforce terminology

### objects, fields and records

A data in salesforce is an abstraction of the database that’s driven by the platform’s metadata-aware architecture. In this abstraction, objects are our database tables. The fields on those objects are columns, and records are rows in the database.

## Three core programmatic technologies to learn about as a Salesforce developer 

- Lightning Component Framework: : A UI development framework similar to AngularJS or React.
- Apex: Salesforce’s proprietary programming language with Java-like syntax.
- Visualforce:  A markup language that lets you create custom Salesforce pages with code that looks a lot like HTML, and optionally can use a powerful combination of Apex and JavaScript.

#### Lightning components use client-side JavaScript controllers and server-side Apex controllers

#### Differences between Lightning Component and VisualForce pages

- The primary difference is right in the name. With Lightning components, you’re developing components that can be pieced together to create pages. With Visualforce, you’re developing entire pages at once.
- Lightning components are newer and better for things like mobile development, there are several situations where it can make more sense to use Visualforce.

Lightning components use JavaScript on the client-side and Apex on the server-side. Visualforce pages can also use server-side Apex controllers, and most complex pages use quite a bit.

Declarative development in Salesforce using tools like **Lightning App Builder** and **Process Builder**.

#### Heroku

- Heroku Connect unifies your Salesforce data with your Heroku Postgres data so you don’t have to manage moving information across platforms

## Data modeling

**Data model**. A data model is a way to model what database tables look like in a way that makes sense to humans.

When we talk about the data model, we’re talking about the collection of objects and fields in an app.

#### Object Relationships

Object relationships are a special field type that connects two objects together



#### The Wide World of Object Relationships

- **Lookup Relationships**

  A lookup relationship essentially links two objects together so that you can "look up" one object from the related items on another object. Lookup relationship can be one-to-one or one-to-many.

- **Master-Detail Relationships**

  While lookup relationships are fairly casual, **master-detail relationships** are a bit tighter. In this type of relationship, one object is the master and another is the detail. The master object controls certain behaviors of the detail object, like who can view the detail's data.

- **Hierarchical Relationships **

  Hierarchical relationships are a special type of lookup relationship. The main difference between the two is that hierarchical relationships are only available on the User object.

#### Work with Schema Builder

Schema Builder is a tool that let us visualize and edit our data model, it's useful for designing and understanding complex data models.

## Data Security

#### Levels of Data Access

Organization, Objects, Fields, Records.

