const fs = require('fs')
const path = require('path')

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
    // FIXME: Needs an "installer signing identity", not a codesign identity
    // {
    //   "name": "@electron-forge/maker-pkg",
    //   "config": {
    //     "identity": "codesign.electronjs.org"
    //     return {}
    //   }
    // },
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
        if (process.env.WINDOWS_CERT_FILENAME) {
          const pfx = path.resolve(__dirname, process.env.WINDOWS_CERT_FILENAME)
          if (fs.existsSync(pfx)) {
            installerConfig.signWithParams = `/a /f ${pfx}`
          }
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
  "plugins": [
    [
      "@electron-forge/plugin-webpack",
      {
        "mainConfig": "./webpack.main.config.js",
        "renderer": {
          "config": "./webpack.renderer.config.js",
          "entryPoints": [
            {
              "html": "./src/index.html",
              "js": "./src/renderer.js",
              "name": "main_window",
              "preload": {
                "js": "./src/preload.js"
              }
            }
          ]
        }
      }
    ]
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
