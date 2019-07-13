Last-Modified: {docsify-updated}

```js
#!/usr/bin/env node

const spawn = require('child_process').spawn
spawn('docker', ['exec', '-it', 'test', 'mysql', '--default-character-set=utf8', 'test'], { stdio: 'inherit' })
```
