module.exports = {
  "packagerConfig": {
    "osxSign": {
      "identity": "codesign.electronjs.org",
      "gatekeeper-assess": false
    }
  },
  "makers": [
    {
      "name": "@electron-forge/maker-deb"
    },
    {
      "name": "@electron-forge/maker-dmg"
    },
    {
      "name": "@electron-forge/maker-flatpak"
    },
    {
      "name": "@electron-forge/maker-pkg",
      "config": {
        "identity": "codesign.electronjs.org"
      }
    },
    {
      "name": "@electron-forge/maker-rpm"
    },
    {
      "name": "@electron-forge/maker-snap",
      "config": {
        "features": {
          "audio": true,
          "webgl": true
        },
        "summary": "My app"
      }
    },
    {
      "name": "@electron-forge/maker-squirrel",
      "config": arch => {
        const installerConfig = {}
        const pfx = path.join(__dirname, 'ci', 'codesign.pfx')
        if (fs.pathExistsSync(pfx)) {
          installerConfig.signWithParams = `/a /f ${pfx}`
        }

        return installerConfig
      }
    },
    {
      "name": "@electron-forge/maker-zip",
      "platforms": [
        "darwin",
        "linux",
        "mas",
        "win32"
      ]
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
