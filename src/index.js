const fs = require('fs');
const path = require('path');

function getType (jsonPath) {
  const json = JSON.parse(fs.readFileSync(jsonPath));
  return json.type;
}

const subdirType = getType(path.join(__dirname, 'subdir', 'metadata.json'));
console.log(`subdir: ${subdirType}`);

const siblingDirType = getType(path.join(__dirname, '..', 'sibling', 'metadata.json'));
console.log(`sibling: ${siblingDirType}`);

const sameDirType = getType(path.join(__dirname, 'metadata.json'));
console.log(`same dir: ${sameDirType}`);
