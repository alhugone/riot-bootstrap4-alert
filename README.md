[![Build Status](https://travis-ci.org/HugoWarsawDev/riot-bootstrap-alert.svg?branch=master)](https://travis-ci.org/HugoWarsawDev/riot-bootstrap-alert) [![Coverage Status](https://coveralls.io/repos/github/HugoWarsawDev/riot-bootstrap-alert/badge.svg)](https://coveralls.io/github/HugoWarsawDev/riot-bootstrap-alert)
# riot-bootstrap-alert
Riot.js custom tag that shows bootstrap alert.

## Code Example
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

