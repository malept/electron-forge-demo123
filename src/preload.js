const path = require('path')
console.log('preload')
require(path.join(__dirname, 'foo', 'bar'))
