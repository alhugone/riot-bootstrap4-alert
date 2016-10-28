module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['jasmine','riot'],
    plugins: [
      'karma-mocha',
      'karma-mocha-reporter',
      'karma-phantomjs-launcher',
      'karma-jasmine',
      'karma-riot'
    ],
    files: [
      'node_modules/jasmine/jasmine',
      'src/tag/*.tag',
      'src/tag.tests/*.js'
    ],
    preprocessors: {
      '**/*.tag': ['riot']
    },
    browsers: ['PhantomJS'],
    reporters: ['mocha'],
    failOnEmptyTestSuite: false,
    autoWatch: true  
  })
}
