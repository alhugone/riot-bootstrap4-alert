module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['jasmine','riot'],
    plugins: [
      'karma-mocha',
      'karma-mocha-reporter',
      'karma-phantomjs-launcher',
      'karma-jasmine',
      'karma-riot',
      'karma-coverage',
      'karma-coveralls'
    ],
    files: [
      'node_modules/jasmine/jasmine',
      'node_modules/jquery/dist/jquery.min.js',
      'src/tag/*.tag',
      'src/tests/*.js'
    ],
    preprocessors: {
      'src/tag/*.tag': ['riot','coverage']
    },
    browsers: ['PhantomJS'],
    reporters: ['mocha','coverage', 'coveralls'],
    coverageReporter: {
      type: 'lcov',
      dir: 'coverage/'
    },
    failOnEmptyTestSuite: false,
    autoWatch: true,
    singleRun:true
  })
}
