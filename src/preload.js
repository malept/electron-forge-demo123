const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('myAPI', {
  sayHello: () => ipcRenderer.send('myAPI:hello'),
});

ipcRenderer.on('myAPI:hello-response', (event, response) => {
  window.alert(`The main process said: ${response}`);
});
