gint-client
-------------

[![Build Status](https://api.travis-ci.com/Gintellect/gint-client.png?token=Ep7JsJpF3GkfPp6Gsk1a)](http://magnum.travis-ci.com/Gintellect/gint-client)

Angular JS sample project / seed

(Very) Basic Instructions:

- Prerequisites
  - Chrome
  - Growl
  - Live Reload Chrome plugin
  - Node 0.8+
  - Grunt 0.4 (`npm install -g grunt-cli`)

- Procedure
  - `git clone git@github.com:Gintellect/gint-client.git`
  - `cd gint-client`
  - `npm install`
  - `grunt run`
  - browse to: `http://localhost:9001`


- Continuous Unit Testing
  - Run Karma server
  In a separate terminal type `grunt karma:unit`, then back in the 
  primary terminal window, do grunt run as normal
  
  - Use `grunt run` You should then see that the tests run after every file change (along with live-reload)


- Coverage Tests
  Make sure you're not running dev (may well cause the file watchers to blow up). Then simply do `grunt coverage`. A ./coverage folder should be created in the root of the project, browse within that to index.html and you should have a coverage report

- Live Reload
  You need to have the live reload plugin installed in Chrome
  Changes to js or html files should cause grunt to automatically re

- Growl Test Notifications
  Make sure Growl is installed for these to work

- Preparing for production
  `grunt prod` will concatanate all of the coffeescripts, having worked out the dependencies between them and create scripts.min.js

  You should be left in bin with an index.html, js/scripts.min.js, img/*.*, css/styles.css - and that's hopefuly all you'd need to deploy from a static webserver (such as the one that runs in dev mode - a simple connect() server)

