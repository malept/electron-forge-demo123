const fs = require('fs');
const path = require('path');

const packageJSON = JSON.parse(fs.readFileSync(path.resolve(__dirname, '..', 'package.json')));
console.log(`Package metadata (preload): Name="${packageJSON.name}", Version="${packageJSON.version}"`);
