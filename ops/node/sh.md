```js
#!/usr/bin/env node

const spawn = require('child_process').spawn
spawn('docker', ['exec', '-it', 'nutsbp-editor-server-mysql', 'mysql', '--default-character-set=utf8', 'nutspie_dev'], { stdio: 'inherit' })

```
