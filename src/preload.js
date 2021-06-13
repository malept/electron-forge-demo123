const fs = require('fs');
const path = require('path');

window.addEventListener('DOMContentLoaded', () => {
  const packageJSON = JSON.parse(fs.readFileSync(path.resolve(__dirname, '..', 'package.json')));
  document.body.innerText = `Package metadata (preload): Name="${packageJSON.name}", Version="${packageJSON.version}"`;
});
