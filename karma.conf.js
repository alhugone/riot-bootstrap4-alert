process.env.COVERALLS_REPO_TOKEN='Qa7twc113k1sHhkSH1mGNfp3SBMwmdONN'
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
      'karma-coveralls',
      
    ],
    files: [
      'node_modules/jasmine/jasmine',
      'src/tag/*.tag',
      'src/tag.tests/*.js'
    ],
    preprocessors: {
      '**/*.tag': ['riot','coverage'],
      'src/**/*.js': ['coverage']
    },
    browsers: ['PhantomJS'],
    reporters: ['mocha','coverage', 'coveralls'],
    coverageReporter: {
type: 'lcov', // lcov or lcovonly are required for generating lcov.info files
dir: 'coverage/'
},
    failOnEmptyTestSuite: false,
    autoWatch: true,
    singleRun:true
  })
}
