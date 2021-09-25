---
layout: post
title: SAP UI5 Learning notes
date: 2020-08-04 17:03:39 +0100
tag : 
- SAPUI5
---

# SAP UI5 Learning notes

## Model View Controller (MVC)

Model, view, and controller are assigned the following roles:

- The view is responsible for defining and rendering the UI.

- The model manages the application data.

- The controller reacts to view events and user interaction by modifying the view and model.

  <img src="/assets/sapui5/mvc.png" alt="drawing" width="100%"/>

###  Models

A model in the Model View Controller concept holds the data and provides methods to retrieve the data from the database and to set and update data.

<img src="/assets/sapui5/model.png" alt="drawing" width="100%"/>

### Views

The view in the Model View Controller concept is responsible for defining and rendering the UI. SAPUI5 supports predefined view types.

The following predefined view types are available:

- XML view (file or string in XML format); the XMLView type supports a mix of XML and plain HTML.
- JSON view (file or string in JSON format)
- JS view, constructed in a traditional manner
- HTML view (file or string in HTML format)

**Note**

We recommend to use XML views, because XML views force a clear separation of the UI definition from the application logic (which has to be implemented in the controller). This makes the code is better readable and easier to support.

Therefore, we concentrate on XML views and only provide examples for XML views throughout this documentation.

 

### Controller

A controller contains methods that define how models and views interact.

You define a simple controller as follows:

```javascript
sap.ui.controller("sap.hcm.Address", {
   // controller logic goes here
});
```

The string in quotes specifies the controller name. The controller file's name should be named as the string in the quotes, Address.controller.js.

**Note**

The suffix .controller.js is mandatory for controllers.



## Data Binding

You use data binding to bind UI elements to data sources to keep the data in sync and allow data editing on the UI

<img src="/assets/sapui5/data_binding.png" alt="drawing" width="100%"/>



### Binding Modes: One-time Binding, One-way Binding, and Two-way Binding

- One-way binding means a binding from the model to the view; value changes in the model update all corresponding bindings and the view
- Two-way binding means a binding from the model to the view and from the view to the model, changes in the model and in the view fire events that automatically trigger updates all corresponding bindings and the view and model
- One-time binding means from model to view once.



The following table shows which binding modes the respective binding models support:

| Model             | One-time                                                     | One-way                                                      | Two-way                                                      |
| :---------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| OData V4 model    | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) (default) |
| OData V2 model    | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) (default) | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) |
| ODataMetaModel V4 | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) (default) | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) | ![Not supported](https://sapui5.hana.ondemand.com/docs/topics/loio5befb5af20ed42fd9052a99014d953a3_LowRes.gif) |
| ODataMetaModel    | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) (default) | ![Not supported](https://sapui5.hana.ondemand.com/docs/topics/loio5befb5af20ed42fd9052a99014d953a3_LowRes.gif) | ![Not supported](https://sapui5.hana.ondemand.com/docs/topics/loio5befb5af20ed42fd9052a99014d953a3_LowRes.gif) |
| JSON model        | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) (default) |
| XML model         | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) (default) |
| Resource model    | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) | ![Supported](https://sapui5.hana.ondemand.com/docs/topics/loio3cb17ee88aed44d2bf1d14b97728c709_LowRes.gif) (default) | ![Not supported](https://sapui5.hana.ondemand.com/docs/topics/loio5befb5af20ed42fd9052a99014d953a3_LowRes.gif) |

### Data types and formatters ?

In the view, you bind data by specifying the **binding path** for a control. You can use **data types** and **formatters** to validate and format the data on the UI.

### Binding types

#### Property Binding

To define property binding on a control, you have the following options:

- As part of the control’s declaration in an XML view or JS view, or other type of view

- Using JavaScript, in the settings object in the constructor of a control, or in special cases, using the `bindProperty` method of a control

  

Let's see, we have the following JSON data: 

```json
{
	"company" : {
		"name"  : "Acme Inc.",
		"street": "23 Franklin St.",
		"city"  : "Claremont",
		"state" : "New Hampshire",
		"zip"   : "03301",
		"revenue": "1833990"
	}
}
```

To define property binding in the control declaration in the XML view, just include the binding path within curly brackets: 

```xml
<mvc:View 
	controllerName="sap.ui.sample.App"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc">
	<Input value="{/company/name}"/>
</mvc:View>
```

In **JavaScript**, we can include the binding path within curly brackets as a string literal in the settings object:

```javascript
// "Input" required from module "sap/m/Input"
var oInput = new sap.m.Input({
	value: "{/company/name}"
});
```

You can also use a complex syntax for property bindings. This complex syntax allows you to define additional binding information to be contained in the settings object, such as a formatter function.

If you are working with XML views, make sure that you've turned on complex binding syntax in your bootstrap script, as shown here:

```javascript
<script
	id="sap-ui-bootstrap"
	src="https://openui5.hana.ondemand.com/resources/sap-ui-core.js"
	data-sap-ui-theme="sap_belize"
	data-sap-ui-bindingSyntax="complex"
	data-sap-ui-async="true"
	data-sap-ui-onInit="module:sap/ui/sample/main"
	data-sap-ui-resourceRoots='{"sap.ui.sample": "./"}'>
</script>
```

You can also use data-sap-ui-compatVersion="edge" to enable complex bindings.

You can then set the bindingMode or other additional properties like this:

```xml
<mvc:View
	controllerName="sap.ui.sample.App"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc">
	<Input
		value="{
			path:'/company/name', 
			mode: 'sap.ui.model.BindingMode.OneWay' 
		}"/>
</mvc:View>
```

In JavaScript views or controllers, you use a JS object instead of a string literal. This must contain a path property containing the binding path, and can contain additional properties:

```js
// "Input" required from module "sap/m/Input"
// "BindingMode" required from module "sap/ui/model/BindingMode"

var oInput = new Input ({
	value: {
		path: "/company/name",
		mode: BindingMode.OneWay
	}
});
```

Depending on the use case, it may be useful to define the binding at a later time, using the bindProperty method:

```js
oInput.bindProperty("value", "/company/name");
```

This option also allows you to use the same object literal that you used in the constructor to define the binding:

```js
// "TypeInteger" required from module "sap/ui/model/type/Integer"

oInput.bindProperty("value", {
	path: "/company/name",
	type: new TypeInteger()
});
```

To remove a property binding, you can use the unbindProperty method. The property binding is removed automatically whenever a control is destroyed:

```js
oTextField.unbindProperty("value");
```

##### Formatting Property Values

Values in data are often represented in an internal format and need to be converted to an external format for visual representation, especially numbers, dates, and times with locale-dependent external formats. SAPUI5 provides two different options for converting data. You can use both options for each binding, you don't have to use one option consistently throughout your app:

- Formatter functions for one-way conversion

- Data types in two-way binding

  Data types can be used to parse user input in addition to formatting values

##### Using a Formatter Function

If you define the property binding in the XML view, you need to define a formatter function (

roundToMillion

) in the view controller:

```js
sap.ui.define([
	"sap/ui/core/mvc/Controller",
	"sap/ui/model/json/JSONModel"
], function (Controller, JSONModel) {
	"use strict";
	return Controller.extend("sap.ui.sample.App", {
		……………
		roundToMillion: function(fValue) {
			if (fValue) {
				return "> " + Math.floor(fValue/1000000) + "M";
			}
			return "0";
		}
	});
}); 
```

The this context of a formatter function is generally set to the control (or managed object) that owns the binding. However, in XML views, the reference to the formatter is done in the view controller by putting a dot (.) in front of the name of the formatter function ({ formatter: '.myformatter' }). In this case, the formatter's this context is bound to the controller.

```xml
<mvc:View
	controllerName="sap.ui.sample.App"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc">
	<Input
		value="{ 
			path:'/company/revenue',
			formatter: '.roundToMillion'
		}"/>
</mvc:View>
```

If you use JavaScript, you can pass the formatter function as a third parameter to the bindProperty method, or you can add the binding info with the formatter key. The formatter has a single parameter value, which is the value that is to be formatted, and is executed as a member of the control, meaning it can access additional control properties or model data.

```js
//"Input" required from module sap/m/Input

oTextField.bindProperty("value", "/company/title", function(sValue) {
	return sValue && sValue.toUpperCase();
});

oControl = new Input({
	value: {
		path:"/company/revenue",
		formatter: function(fValue) {
			if (fValue) {
				return "> " + Math.floor(fValue/1000000) + "M";
			}
			return "0";
		}
	}
})
```

Because it can contain any JavaScript, the formatter function can be used for formatting a value and also for performing type conversions or calculating results, for example, to show a special traffic light image depending on a Boolean value:

```js
oImage.bindProperty("src", "/company/trusted", function(bValue) {
	return bValue ? "green.png" : "red.png";
}); 
```

***Caution***

The framework only updates a binding when one of the properties included in the binding changes. If the formatter uses another property value that is not part of the binding definition, the framework won't know that the result depends on that additional property and could miss necessary updates. Therefore, make sure that you declare a composite binding referencing all necessary properties (maybe even from different models).

##### Changing the Binding Mode

By default, all bindings of a model instance have the default binding mode of the model, but you can change this behavior if needed. When creating a PropertyBinding, you can specify a different binding mode, which is then used exclusively for this specific binding. Of course, a binding can only have a binding mode that is supported by the model in question.

```js
// "JSONModel" required from module "sap/ui/model/json/JSONModel"
// "Input" required from module "sap/m/Input"
// "BindingMode" required from module "sap/ui/model/BindingMode"
	var oModel = new JSONModel();
	// default binding mode is two way
	oModel.setData(myData);
	sap.ui.getCore().setModel(oModel);
	var oInputFirstName = new Input ();
	
	// bind value property one way only
	// propertyname, formatter function, binding mode
	oInputFirstName.bindValue("/firstName", null, BindingMode.OneWay);
	oInputFirstName.placeAt("target1");

	oInputLastName = new Input();
	// bind value property two way (default)
	oInputLastName.bindValue("/lastName");
	oInputLastName.placeAt("target2");
```

In the example above, two Input fields are created and their value property is bound to the same property in the model. The first Input binding has a one-way binding mode, whereas the second Input has the default binding mode of the model instance, which is two-way. For this reason, when text is entered in the first Input, the value will not be changed in the model. This only happens if text is entered in the second Input. Then, of course, the value of the first Input will be updated as it has a one-way binding, that is, from model to view.



#### Context Binding (Element Binding)

Context binding (or element binding) allows you to bind elements to a specific object in the model data, which will create a binding context and allow relative binding within the control and all of its children. This is especially helpful in master-detail scenarios.

-----------

Let’s assume we have the following JSON data:

```json
{
	"company" : {
		"name"  : "Acme Inc."
		"street": "23 Franklin St." 
		"city"  : "Claremont"
		"state" : "New Hampshire"
		"zip"	: "03301"
		"revenue": "1833990"
	}
}
```

Here’s how you would use element binding in an XML view:

```xml
<mvc:View
	controllerName="sap.ui.sample.App"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc">
	<Input id="companyInput"
		binding="{/company}"
		value="{name}"
		tooltip="The name of the company is '{name}'"/>	
</mvc:View>
```

By setting binding="{/company}", we can refer to company children without having to qualify the full binding path, when binding Input control’s properties such as the value. Using plain property binding, our XML view would look like this:

```xml
<mvc:View
	controllerName="sap.ui.sample.App"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc">
	<Input id="companyInput"
		value="{/company/name}"
		tooltip="The name of the company is '{/company/name}'}"/>	
</mvc:View>
```

To define an element binding in **JavaScript**, for example in a controller, use the `bindElement` method on a control:

```js
var oInput = this.byId("companyInput")
oInput.bindElement("/company");
oInput.bindProperty("value", "name");
```

Element binding is especially interesting for containers or layouts containing many controls that are all visualizing properties of the same model object. Here’s an XML view with a VerticalLayout using element binding:

```xml
<mvc:View
	controllerName="sap.ui.sample.App"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc">
	<l:VerticalLayout id="vLayout"
		binding="{/company}"
		width="100%">
			<Text text="{name}" />
			<Text text="{city}" />
			<Text text="{county}" />
	</l:VerticalLayout> 
</mvc:View>
```

To realize this in JavaScript, proceed as follows in your controller:

```js
var oVerticalLayout = this.getView().byId('vLayout');
oVerticalLayout.bindElement("/company");
oVerticalLayout.addContent(new Text({text: "{name}"}));
oVerticalLayout.addContent(new Text({text: "{city}"}));
oVerticalLayout.addContent(new Text({text: "{county}"})););
```



#### List Binding (Aggregation Binding)

List binding (or aggregation binding) is used to automatically create child controls according to model data.

----------------

Let's say we would like to display the following JSON model data in a sap.m.List:

```json
{
	companies : [
		{
			name : "Acme Inc.",
			city: "Belmont",
			state: "NH",
			county: "Belknap",
			revenue : "123214125.34"  
		},{
			name : "Beam Hdg.",
			city: "Hancock",
			state: "NH",
			county: "Belknap"
			revenue : "3235235235.23"  
		},{
			name : "Carot Ltd.",
			city: "Cheshire",
			state: "NH",
			county: "Sullivan",
			revenue : "Not Disclosed"  
		}]
}
```

##### Declarative List Binding in XML Views

```xml
<mvc:View
	controllerName="sap.ui.sample.App"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc">
	<List id=”companyList” items="{path: '/companies', templateShareable:false}">
		<items>
			<StandardListItem
				title="{name}"
				description="{city}"
			/>
		</items>
	</List>
</mvc:View>
```

- The attribute items="{path: '/companies', templateShareable:false}" binds the children of our json model's companies array to the list. This by itself is not enough to display the companies, instead it sets the parent path for the binding of all contained list items and their descendants. In addition you need to declare a nested element.
- The nested items element in our case contains a StandardListItem. This serves as a template for creating the individual list rows.

##### List Binding in the JavaScript Code

You can define list binding directly in JavaScript either in the settings object in the constructor or by calling the `bindAggregation` method. List binding requires the definition of a template, which is cloned for each bound entry of the list. For each clone that is created, the binding context is set to the respective list entry, so that all bindings of the template are resolved relative to the entry. The aggregated elements are destroyed and recreated whenever the bound list in the data model is changed.

To bind a list, you create a template or provide a factory function, which is then passed when defining the list binding itself. In the settings object, this looks as follows:

```js
var oItemTemplate = new sap.ui.core.ListItem({text:"{name}"});
oComboBox = new sap.m.ComboBox({
	items: {
		path: "/companies",      //no curly brackets here!
		template: oItemTemplate
		templateShareable: false
	}
});
```

A template is not necessarily a single control as shown in the example above, but can also be a tree of controls. For each list entry, a deep clone of the template is created and added to the bound list.

You can also define the list binding by using the bindAggregation method of a control:

```js
var oItemTemplate = new sap.ui.core.ListItem({text:"{name}"});
oComboBox.bindAggregation("items", {
path: "/companies",
template: oItemTemplate,
templateShareable: false
});
```

In addition, some controls have a typed binding method for lists that are likely to be bound by the application:

```js
var oComboBox.bindItems("/companies", oItemTemplate);
```

To remove a list binding, you can use the unbindAggregation method:

```js
oComboBox.unbindAggregation("items");
```

Controls with typed binding methods also provide a typed unbind:

```js
oComboBox.unbindItems();
```

When a list is unbound, its aggregated controls are removed and destroyed by default. If you would like to keep the items in your ComboBox, for example, you can do so by using:

```js
oComboBox.unbindAggregation("items", true);
```

#### Formatting, Parsing, and Validating Data

Reference: [Formatting, Parsing, and Validating Data in SAP UI5](https://sapui5.hana.ondemand.com/#/topic/07e4b920f5734fd78fdaa236f26236d8)

Data that is presented on the UI often has to be converted so that is human readable and fits to the locale of the user. On the other hand, data entered by the user has to be parsed and validated to be understood by the data source. For this purpose, you use formatters and data types.

![image](/assets/sapui5/DataFormatting.PNG)

Formatters are used to define the formatting of data on the UI while data types work in both directions: they format the data on the UI and parse and validate user input that is entered.

You can either use standard formatters and data types or define your own custom objects. SAPUI5 provides standard formatter classes that can be used to define custom data types and custom formatter

# Walkthrough

## Controllers

**Conventions**

- Controller names are capitalized
- Controllers carry the same name as the related view (if there is a 1:1 relationhsip)
- Event handlers are prefixed with on
- Controller names always end with *.controller.js



## Modules

**Conventions**

- Use sap.ui.define for controllers and all other JavaScript modules to define a global nemaspace, the object can be addressed throughout the application, this is so-called **AMD - asynchronous nodule definition**. Which means all the dependencies that we need in this module should be loaded before the actual module code is executed.
- Use sap.ui.require for asynchronously loading dependencies but without declaring a namespace, for example code that just needs to be executed, but does not need to be called from other code.
- Use the name of the artifact to load for naming the function parameters (without namespace)



# Notes de travail

```xml
<fctable:FCColumn id="packagelistview-table-publishingauthordesc" sortProperty="PublishingAuthorDesc" fcId="PublishingAuthorDesc" width="{columnWidths>/PublishingAuthorDesc}" visible="false" press="onHeaderPress" >
    <fctable:label>
        <fctable:ColumnLabel id="packagelistview-table-publishingauthordesc-label" text="{i18n>LBL_PUBLISHED_BY_DESCRIPTION}" class="fcTableColumnTitle"/>
    </fctable:label>
    <fctable:template>
        <Text text="{PublishingAuthorLongDesc}" wrapping="false" />
    </fctable:template>
</fctable:FCColumn>
```



### SAP UI5 getVventBus method, event publish and subscribe

Ref: [StackOverflow Anwser1](https://stackoverflow.com/questions/25382988/how-to-use-geteventbus-method-in-sapui5)

[StackOverflow Anwser2](https://stackoverflow.com/questions/22828683/how-to-add-columnlistitem-to-a-table-inside-a-page-in-mvc-from-other-page-contro/22842857#22842857)

To put it in a nutshell, you can call `sap.ui.getCore().getEventBus()` to get access to the EventBus instance. As it comes from the core it´s the same across all of your views/controllers. The EventBus provides you with the publish/subscribe functionality. This for example enables you to publish an event in Controller A and notify the subscribed Controller B. A simple example largely from my other answer:

**Subscribing to the EventBus:**

```
var eventBus = sap.ui.getCore().getEventBus();
eventBus.subscribe("channel1", "event1", this.handleEvent1, this);
```

Of course you can name your channel and events as you wish. The third parameter indicates the function, that will be called in case of published events. The last paramter is the scope, 'this' will point to in the given function.

Your `handleEvent1` function could look like this:

```
handleEvent1 : function(channel, event, data) {
    var customData = data.customData
}
```

**Publishing events to the EventBus:**

```
var customData = {}  // anything you eventually want to pass
var eventBus = sap.ui.getCore().getEventBus();

eventBus.publish("channel1", "event1", 
    {
        customData: customData
    }
);
```

