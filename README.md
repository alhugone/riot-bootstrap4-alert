[![Build Status](https://travis-ci.org/alhugone/riot-bootstrap4-alert.svg?branch=master)](https://travis-ci.org/alhugone/riot-bootstrap4-alert) [![Coverage Status](https://coveralls.io/repos/github/HugoWarsawDev/riot-bootstrap-alert/badge.svg?branch=master)](https://coveralls.io/github/HugoWarsawDev/riot-bootstrap-alert?branch=master)
# riot bootstrap v4 alpha alert tag
Riot.js custom tag that shows bootstrap v4 alpha alerts.
## Live example
https://alhugone.github.io/riot-bootstrap4-alert/

## Code example
Place \<alerts\> tag:

`<alerts name="alerts"></alerts>`

Add alert in JavaScript:

    this.tags.alerts.addAlert(
        { type: 'success',
          msg: 'This is message',
          hideAfter: 0,
          fadeOutTime: 1000,
          dismissible: true }
    );

# Features
Each alert can be customized with:
* success/info/warn/error type
* stay for ever or close after specified seconds
* dissmissable/non-dissmisable
* fadeOut custom time or 'slow'(jQuery) default


## Install
`npm install`

## Run tests
 `npm test`

