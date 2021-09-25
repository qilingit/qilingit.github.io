```
layout: 		post
title: 			Steps to create a Node.js app with Express
date: 			2020-08-10 22:18:39 +0100
categories:     [tech]
tags:			[]
comments:       true
excerpt:        >
    TODO
image:          /assets/node.js/Node.js_logo.png
image:          /assets/node.js/node_hello_world.png
ads:            none
```
Reference: [JS FOR ALL Node.js 2019 guide](https://jsforall.com/nodejs/steps-to-create-first-nodejs-express-app/)

<img src="/assets/node.js/Node.js_logo.png" alt="Node.js logo" width="100%">

## Node.js: An introduction, what is Node.js

**Node.js is an open-source, cross-platform, runtime environment that enables developers to write sever-side applications in JavaScript**

Node.js allows building **scalable sever-side applications using JavaScript**. We can develop various types of applications like Command line applications, Web applications, **REST API** and **Web server**, etc.



## Steps to create a Node.js app with Express

### **1. Insall Node.js**

### **2. Create a working directory to hold the application.**

### **3. Init the nodejs applications: run the ```npm init```  command.**

This command will create a  `package.json` file for the application in the working directory. This command prompts you for a number of things, including the name and version of application and the name of the initial entry point file (by default is **index.js**). 

### **4. Go into the application working directory, install Express.js**

```npm install express --save```

The **--save** option tells npm to add the packages as dependencies in the package.json. 

Add ```"start": "node index.js" ``` code to scripts, if it is not there. To this step, the package.json file should be like this:

```json
{
  "name": "my application name",
  "version": "1.0.0",
  "description": "TD：templates-data-state",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "express": "^4.17.1"
  }
}
```

### **5. Write Node.js code**

Create the index.js file in the root directory of working directory, add below code to index.js.

```js
// Load the framwork Express
const express = require('express');

// Create the web application Express
const app = express();

// Define a route for url '/'
app.get('/', (req, res) => {
    res
        .status(200)
        .send('Hello world!')
        .end();
});

// Start the server
const PORT = process.env.PORT || 8080
app.listen(PORT, () => {
    console.log('App listening on port ${PORT}');
    console.log('Press Ctrl+C to quit.');
});
```

### **6. Run the Node.js application**

We can simply start our Node.js application with the following command in the terminal of Linux or PowerShell/CMD of Windows: 

`npm start`

If you have not added `"start": "node index.js"` code to **scripts**. Still we can start the application by the following command: 

`node index.js // entry point js file` 

### **7. Type address with the *PORT***

Open a browser and type the url `http://localhost:8080/`, the congratulations we have built our first Node.js application, and can see the *Hello world!*



<img src="/assets/node.js/node_hello_world.png" width=80%/>