## Basics

# app.js file

- app.js or server.js is root file that makes our node js application
- In this we will create server
- run using node app.js
- There are core modules in nodejs (by default)
  - fs (file system)
  - path (helps in constructing path, paths to files or file system that work on any OS)
  - os (operating system)
  - http: (helpful when we create server & working with http requests & http responses); http helps with launching a server or sending requests (node app can send request to another server also, we can have multiple server communicate with each other)
  - https: helps in launching SSL encoded server
- require() is a way to import files in nodejs; it either takes file path or core module
- http: createServer method, it takes request listener as an argument; request listener is simply a function that will execute for every incoming request
- we will store http.createServer into const as server & listens it. listen() takes couple of argument 1st port, 2nd hostname etc
- process.exit() will de-register the createServer; It hard exit our event loop & therefore program shuts down

# Request & Response Headers

- On both requests and responses, Http headers are added to transport metadata from A to B.
- The following article provides a great overview of available headers and their role: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers

# Routing requets

- GET request is automatically sent when we click link or enter url
- POST request has to be set up by us by creating form
- https://expressjs.com/en/guide/routing.html

# Parsing requet bodies

- Incoming data is sent as stream of data that JS knows but JS doesn't
- ![Stream & buffers](images/image.png)
- Buffer is a constrcut that allows us to hold multiple chunks & work with them before they are released once we are done

# Blocking & non blocking code

- fs.writeFileSync block code execution until file is created; even no incoming requests will be handled until file is completely created; It acceps the path & data as arguments
- fs.writeFile does not block the code execution; it takes 3rd argument also i.e a callback that should be executed when file creation is done

# Useful resources

- Official Node.js Docs: https://nodejs.org/en/docs/guides/
- Full Node.js Reference (for all core modules): https://nodejs.org/dist/latest/docs/api/
- More about the Node.js Event Loop: https://nodejs.org/en/docs/guides/event-loop-timers-and-nexttick/
- Blocking and Non-Blocking Code: https://nodejs.org/en/docs/guides/dont-block-the-event-loop/

# NPM scripts

- We can define some scripts in nodejs using npm
- npm init
- Set app.js as entry point file
- Add this to scipts in package.json : "start": "node app.js" (start is special reserved keyword) - npm stast is same as npm run start because start is reserved keyword for this
- If we add another "start-server": "node app.js" - for this we have: npm run start-server not npm start-server

# Installing 3 party packages (nodemon)

- ![npm & packages](images/image-1.png)
- After making changes to our code we save it, exit the terminal & restart the server to see changes
- To get instant changes without quitting the server we install 3rd party 'nodemon'
- npm i nodemon --save-dev
- We wil change the start script from node app.js to nodemon app.js

# Global, core & 3rd party modeules

- Global Features vs Core Modules vs Third-Party Modules
  - Global features: Keywords like const or function but also some global objects like process
  - Core Node.js Modules: Examples would be the file-system module ("fs"), the path module ("path") or the Http module ("http")
  - Third-party Modules: Installed via npm install - we can add any kind of feature to our app via this way
    - Global features are always available, we don't need to import them into the files where we want to use them.
    - Core Node.js Modules don't need to be installed (NO npm install is required) but we need to import them when we want to use features exposed by them. Example:
      - const fs = require('fs');
      - We can now use the fs object exported by the "fs" module.
    - Third-party Modules need to be installed (via npm install in the project folder) AND imported. Example:
      - npm install --save express-session
      - In code file (e.g. app.js)
      - const sessions = require('express-session');

# Type of Errors

- Syntax Errors: If we have typo in our code or we forget any closing curly bracket or anything
- Runtime Errors: When we try to execute some code which will just break when it runs
- Logical Errors: App just doesn't work the way it should, techincally a logical issue

# Debugging: https://code.visualstudio.com/docs/nodejs/nodejs-debugging

# Useful resources:

- More on debugging Node.js: https://nodejs.org/en/docs/guides/debugging-getting-started/
- Debugging Node in Visual Studio Code: https://code.visualstudio.com/docs/nodejs/nodejs-debugging

## Express.js

- Nodejs framework
- npm i --save express
- Expressjs is all about middleware i.e an incoming request is automatically funneled through bunch of functions by expressjs
- ![Middleware](images/image-2.png)
- use function of express() allows us to add new middleware function. It accepts array of request handlers
- We can pass function inside use(), it take 3 arguments: req, res, next; next is a function that will be passed to this function by express

# Handling routes

- We can add route path at the beginning of use()

# Parsing incoming requests

- by default request doesn't try to parse the incoming request body, therefore we need to register parser
- Express by default used to have body-aprser pckg inside it, then they removed & then again re-added, but we will install it
- npm i --save body-parser
- bodyParser.urlencoded({ extended: false }) registers a middleware; { extended: false } to set confg , to enable bodyparser
- app.get() will get fored for only incoming requests
- GET : app.get(); POST: app.post(); also we have put, patch, delete

# Express router

- express.Router(), store it in a const router
- router.use for all requests; router.get for GET, .post for POST etc
- .get macthes the exact route but .use does not

# Filtering methods

- It allows us to put a common starting segment for our path which all routes in a given file use to outsource that into app.js so that we don't have to repeat it for all routes in other files

# Crearting HTML pages

- We manage our VIEWS, that we want to serve to the user in one place of application in views folder
- path.join() yields us path in the end, by concatenating different segments; '\_\_dirname' is a global variable which simply holds the absolute path on our OS to the project folder
- We can create helper function in util as global path in path file.
- We can serve files statically also from public folder
- ![ExpressJs summary](images/image-3.png)

## Working with dynamic content & adding template engines

# Templating Engines (TE)

- To put dynamic content into our HTML pages
- Useful resources:

  - Pug Docs: https://pugjs.org/api/getting-started.html
  - Handlebars Docs: https://handlebarsjs.com/
  - EJS Docs: http://ejs.co/#docs

- ![Templating engines](images/image-4.png)
- Different Tamplating engines: EJS, Pug(Jade), Handlebars
- ![EJS Pug Handlebars](images/image-5.png)
- npm i --save ejs pug express-handlebars

# Pug

- app.set() allows us to set any values gloablly on our express application & get it later
- 'view engine' is default engine extension to use which allows to tell express that any dynamic template that we ar trying to render, use that only
- 'views' allows to tell express where to find dynamic views
- .render() will use default templating engine
- https://pugjs.org/api/getting-started.html
- block & extends for common pug file & to use it anywhere, we can name anything with block like block style & use it as block style where we extend another pug file

# Handlebars

- pug is auto installed by express therefore no need to import pug, but we need to import handlebars
- app.engine() resgister new TE
- For common layout we mention its path in app.engine()

# EJS

- It is supported by express, therefore no need to import
- It does not support layouts

# Layouts with partials

- For this we make separated shared files

## MVC (Model View Controller)

- It is for separation of concerns
- ![MVC](images/image-6.png)
- ![alt text](images/image-7.png)
- https://developer.mozilla.org/en-US/docs/Glossary/MVC

# Dynamic Routing

- ![dynamic routing](images/image-8.png)

## DB

- ![SQL vs NoSQL](images/image-9.png)

# SQL

- SQL DB thinks in tables & in each table we have fields or columns; fileds is fill in by data or records or rows
- SQL DB allow us to relate different tables; Eg: order can be desribed as connection betweem user & product (relation)
- So we have relations in SQL DB
- ![tables relation](images/image-10.png)
- Core characteristics of SQL
  - Strong data schema: for each table we clearly define how data in there should look like, which fields, which data type & all data in table has to fit the schema
  - Data relations: one-to-one, one-to-many, many-to-many; tables are connected
- SQL is structured query language; Queries are simply commands we use to interact with DB;Eg: SELECT \* FROM users WHERE age > 25

# NoSQL

- In this we have tables (Eg: users & orders); Tables are called collections
- In collections we don't have records but have documents (documents are very similiar as objects in JS)
- NoSQL doesn't have strict schema; 2 documents in single collection can have different schema Eg: 1 collection have age but other doesn't
- We can store multiple documents with different structures in same collection.
- ![Schemaless collection in NoSQL](images/image-11.png)
- In this we have no real relations, instead we can have duplicate data. Eg: we can have user in users & user in orders collection also; If the data changes then we have to update it in multiple places, but this is ok because if we ever have to retrieve data we don't have to join multiple tables
- We can get all the data at one place in orders collection of user as well as of order; therefore data retrieval is fast
- ![characteristic of NoSQL](images/image-12.png)
- As application grows we need to store more data & access more data frequently therefore we might need to scale our DB servers.

# Horizaontal vs Vertical Scaling

- HS
  - In this we add more & more servers & we can do this infinitely;
  - We can buy new servers(on cloud provider or own data center) & connect to our DB & split our data across all the servers
- VS
  - We make our exisiting server more stronger by adding more CPU or memory
  - But problem is that we have some limit, we can't fit infinitely much CPU power into single machine
- ![HS vs VS](images/image-13.png)
- ![SQL vs NoSQL](images/image-14.png)
- If we are storing data where relations are really important, want strong schemas, & want split up tables then SQL is perfect; also not every part of data is accessed multiple times per second; If data does not change that often then SQL is good.
- If we have data that changes frequently then we can use NoSQL, there, relations might not be important because we can always put all information that belongs to shopping cart or to an order in one single document

# MySQL

- Install msi
- After installation of workbech, server & shell, connect our app to MySQL
- npm i --save mysql2 (It allows us to write SQL code in node)
- https://github.com/sidorares/node-mysql2
- We should close the connection when we are done with the query but problem is we have to run multiple queries & we need to re-execute the code to connection for every new query again & again -> inefficient
- Therefore we create connection pool which return the promise

# Sequelize

- It is an Object Relational Mapping Library
- ![ORM](images/image-15.png)
- Sequelize offers us models to work with our DB
- We then instantiate these models, then we can run queries on that & we can also associate our models
- ![Sequelize](images/image-16.png)
- npm i --save sequelize (It needs mysql2 pckg which we have already installed)
- sync method in sequelize looks at all the model that we defined & then creates table for them
- If we run our server again it again execute the models but will not overwrite the tables as in there we automatically have if not exists
- create: it creates a new elt based on model & immediately saves it to DB
- build: it also create new elt based on model but only in JS & then we need to save it manually
- findAll: find all the rows of tables
- fundById/findByPk: find specific row with id
- save: update the existing row, if no row then create new one
- destroy: delete the row
- Associations
  - means relation;
  - A single product can belong to many cart; many users can have multiple carts therefore product can belong to many carts : belongs to many
  - Each user can have only one cart : has one
  - User can have multiple orders : has many; user can have multiple products
- ![Associations](images/image-17.png)
- ![SQL, sequelize](image-18.png)
- http://docs.sequelizejs.com/

# MongoDB

- DB engine tool that we can use to run NoSQL DB
- It is build to store & use large data; built for large scale application, to quickly query data, store data & interact with data; mongo from work humongous
- In DB we have multiple collections. Inside each collection we have couple of documents which are schemaless
- MongoDb use JSON(JS object notation) to store data in collections
- To be precise mongodb uses BSON for binary json which it transforms BTS before storing it into files
- ![JSON(BSON) data format](images/image-19.png)
- Relations Options
  - Nested/embedded document
    - ![Nested document](images/image-20.png)
    - If we have lot of data duplications, then we have to update it at all places
  - References
    - We will add reference of data in one table of another
    - We should not relate the documents too much as our queries become slow
    - ![alt text](images/image-21.png)
- npm i --save mongodb
- https://www.mongodb.com/docs/atlas/troubleshoot-connection/#special-characters-in-connection-string-password
- We have to make one connection on our DB, otherwise on every operation we have to connect to MongoDB
- ![MongoDB](images/image-22.png)
- https://docs.mongodb.com/manual/core/security-encryption-at-rest/https://docs.mongodb.com/manual/
- https://academind.com/learn/web-dev/sql-vs-nosql/
- https://academind.com/learn/mongodb

# Mongoose

- It is ODM (Object Document Mapping Library)
- ![ODM](images/image-23.png)
- ![Core concepts](images/image-24.png)
- npm i --save mongoose
- https://mongoosejs.com/docs/

## Session & cookies

# Cookie

- ![Cookie](images/image-25.png)
- Adding isLoggedIn to req won't work as when we redirect request finished there only & doesn't sent around to app
- We could use global variable to store in extra file & which then change then that variable will survive requests cycle but that variable will be shared across all requests, therefore also be shared across all users, here cookie can help
- With cookies we can store data in the browser of single user & store data in that browser which is customized to that user which does not affect all the other users but can be sent with the request that it is authenticated
- We can easily manipulate the cookies from browser which is not secure therefore it should not be stored in browser as user can edit them & see.
- We can also configure cookies with other key values pairs other than isLoggedIn example Expires, Max-Age (it is number of seconds that how long cookie should stay alive), Domain, Secure (then cookie will work only for https), HttpOnly(more secure as now it will not work in client side browser & protect from XSS & won't be able to edit)
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies

# Session

- Instead of storing the info in frontend, now we will store in backend using session using DB, which further will be stored on frontend as cookie but that info will be in Hash Id only server from DB will be able to decode it
- ![Session](images/image-26.png)
- npm i --save express-session
- Disadv: Session is stored in memory & memory is not infinite resource therefore not good for production as we may havye 1000s
  of users
- Therefore we will use: npm i --save connect-mongodb-session

## Authentication & Authorization

# Basics

- Authentication is needed to diiferentiate b/w anonymous users & logged in users
- ![Authentication](images/image-27.png)
- ![Authentication Imeplementation](images/image-28.png)
- Authorization means we restrict the permissions of logged in users.

# Encrypting passwords

- We should not directly save our password to DB so that no one can read it, so it should be saved in encrypted way
- npm i --save bcryptjs
- https://github.com/dcodeIO/bcrypt.js

# Route Protection

- If user is logged in then only user can see pages even after entering url manually
- we can do this by checking whether user is authenticated or not on every route
- For this we should add middleware of authentication & add it to all routes which we want to protect before getting into the controllers
- Request funnel from left to right

# CSRF Attacks

- Cross Site Script Forgery
- https://www.acunetix.com/websitesecurity/csrf-attacks/
- In this attack, attacker can abuse our session & trick users of our app to execute malicious code
- We can protect our ursers by ensuring that people can only use our session if they are working with views(frontend or ejs) rendered by our app
- ![CSRF](images/image-29.png)
- To ensure this we will use CSRF token
- npm i --save csurf : allows to generate CSRF token, string value that we can embed to our pages that we want to protect, no one can steal it as it gets generated for every page user render
- Add csrf protection after session initialisation
- It will work fine for all get requests but not for non-get(post(because we change data by post request) etc) request eg: logout
- For non-get requests, above pakcage will look for the existence of csrf token in our request body, therefore it should be in our views
- Eg : <input type="hidden" name="_csrf" value="<%= csrfToken %>" /> (with logout) ; name must be \_csrf
- But we have to send csrfToken in all our non-get requests
- We need csrfToken & isAuthenticated key in every page we render
- Therefore we all routes in app.js we will add another middleware, in that we can access special field provided by expressjs (locals)
- res.locals.isAuthenticated=req.session.isLoggedIn
- This package is not now maintained & is DEPRACATED, therefore we can use other packages
- https://www.npmjs.com/search?q=express%20csrf
- https://www.npmjs.com/package/csrf-csrf

# Providing user feedback

- We can send error msg to session but we dont want it to be removed from session once the error msg is displayed so we have package for this
- npm i --save connect-flash
- ![Summary](images/image-30.png)

## Sending Email

- We don't create our own email server but user third party service
- Sendgrid
- npm i --save nodemailer nodemailer-sendgrid-transport
- Nodemailer makes sending emails from inside nodejs
- https://nodemailer.com/about/
- https://sendgrid.com/docs/

## GIT

- git log
- move to that head where you want to edit (if changes are not pushed to git)
- git reset --soft headID_from_git_log

## Validation

- ![Validation](images/image-31.png)
- ![How to validate](images/image-32.png)
- npm i --save express-validator
- Need to validate post routes
- https://express-validator.github.io/docs/
- https://github.com/chriso/validator.js

## Errors

- ![Error types](images/image-33.png)
- Error is a object in JS
- ![Error handling](images/image-34.png)
- When we pass error to next as next(error), then we let express know that error occured & it will skip all other middlewares & get right away to error handling middleware
- We will use special middleware in app.js to handle next(error) : app.use((error, req, res, next) => {});
- If we have more than one error handling middleware, they'll execute from top to bottom, just like other middleware
- If we throw error inside async code it will not reach express error middleware.
- Inside async code we have to use next(new Error(err)), outside async we can use throw new Error('Dummy')
- ![Error & http response code](images/image-35.png)
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
- 1×× Informational: 100 Continue; 101 Switching Protocols; 102 Processing
- 2×× Success: 200 OK; 201 Created; 202 Accepted; 203 Non-authoritative Information; 204 No Content; 205 Reset Content; 206 Partial Content; 207 Multi-Status; 208 Already Reported; 226 IM Used;
- 3×× Redirection: 300 Multiple Choices; 301 Moved Permanently; 302 Found; 303 See Other; 304 Not Modified; 305 Use Proxy; 307 Temporary Redirect; 308 Permanent Redirect
- 4×× Client Error: 400 Bad Request; 401 Unauthorized; 402 Payment Required; 403 Forbidden; 404 Not Found; 405 Method Not Allowed; 406 Not Acceptable; 407 Proxy Authentication Required; 408 Request Timeout; 409 Conflict; 410 Gone; 411 Length Required; 412 Precondition Failed; 413 Payload Too Large; 414 Request-URI Too Long; 415 Unsupported Media Type; 416 Requested Range Not Satisfiable; 417 Expectation Failed; 418 I'm a teapot; 421 Misdirected Request; 422 Unprocessable Entity; 423 Locked; 424 Failed Dependency; 426 Upgrade Required; 428 Precondition Required; 429 Too Many Requests; 431 Request Header Fields Too Large; 444 Connection Closed Without Response; 451 Unavailable For Legal Reasons; 499 Client Closed Request
- 5×× Server Error: 500 Internal Server Error; 501 Not Implemented; 502 Bad Gateway; 503 Service Unavailable; 504 Gateway Timeout; 505 HTTP Version Not Supported; 506 Variant Also Negotiates; 507 Insufficient Storage; 508 Loop Detected; 510 Not Extended; 511 Network Authentication Required; 599 Network Connect Timeout Error
- https://httpstatuses.com/
- https://expressjs.com/en/guide/error-handling.html

## File Upload & Download

# File Upload

- We have middleware of bodyParser in app.js which encode everything to string therefore we can't use req.body.image, as file is binary data. Therefore for file we'll use multer
- npm i --save multer
- It parses incoming request for files
- In view we'll add enctype='miultipart/form-data' to get the file telling server that this request will conatin mixed data: text & binary data
- Add the middleware in app.js for multer
- https://github.com/expressjs/multer

# Download file

- We can download file using fs
- We can set header as application/pdf for Content-Type: it allows to show the pdf in same tab
- Content-Disposition is used to define how content should be served, inline is for sma etab, attachment is for download
- For small file reading file is ok, in this case node will first access that file read the entire content into memory & the return it with response, for bigger files this will be issue as it will take very long before a response is sent & memory on sever might actually overflow for many incoming requests
- Therefore instead of reading we chould stream our data
- https://medium.freecodecamp.org/node-js-streams-everything-you-need-to-know-c9141306be93
- fs.unlink to delete the file & path

# PDFKit for pdf generation

- npm i --save pdfkit
- It is also a readable stream therefore we can pipe it
- http://pdfkit.org/docs/getting_started.html

## Async requests

- ![Async requests](images/image-36.png)
- deleting the product using vanilla js in js file
- https://developers.google.com/web/updates/2015/03/introduction-to-fetch
- https://developer.mozilla.org/en-US/docs/Web/Guide/AJAX/Getting_Started

## Adding Payments

- ![Payment process](images/image-37.png)
- Stripe offers payment services
- ![Stripe flow](images/image-38.png)
- npm i --save stripe
- https://stripe.com/docs
