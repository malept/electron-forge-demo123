const path = require('path')

module.exports = {
  "packagerConfig": {
    "icon": path.join(__dirname, "assets", "icon.ico")
  },
  "makers": [
    {
      "name": "@electron-forge/maker-squirrel",
      "config": {
        "setupIcon": path.join(__dirname, "assets", "clear.ico"),
        "iconUrl": "https://raw.githubusercontent.com/malept/electron-forge-demo123/forge6-issue-1635/assets/storm.ico"
      }
    }
  ],
  "publishers": [
    {
      "name": "@electron-forge/publisher-github",
      "config": {
        "repository": {
          "name": "electron-forge-demo123",
          "owner": "malept"
        }
      }
    }
  ]
}
