// Karma configuration


// base path, that will be used to resolve files and exclude
basePath = '..';


// list of files / patterns to load in the browser
files = [
  JASMINE,
  JASMINE_ADAPTER,
  'test/libs/sinon-1.6.0.js',
  'client/js/libs/jquery-1.8.3.js',
  'client/js/libs/angular.js',
  'client/js/libs/angular-resource.js',
  'client/js/libs/angular-ui.js',
  'test/libs/angular-mocks.js',
  'bin/client/js/app.js',
  'bin/client/js/controllers/*.js',
  'bin/client/js/directives/*.js',
  'bin/client/js/services/*.js',
  'bin/client/js/views.js',
  'test/client/**/*.coffee'
];

// list of files to exclude
exclude = [

];

preprocessors = {
  '**/*.coffee': 'coffee',
  '**/bin/client/js/**/*.js': 'coverage'
};


// test results reporter to use
// possible values: dots || progress
reporters = 'dots';


// web server port
port = 8083;


// cli runner port
runnerPort = 9100;


// enable / disable colors in the output (reporters and logs)
colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;


// enable / disable watching file and executing tests whenever any file changes
autoWatch = false;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari
// - PhantomJS
browsers = ['Chrome'];


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;
