

##install package editor

[package control]

##prefer setting
######Preferences->Settings - User

- draw_white_space
show all space



```
{
	"ignored_packages":
	[
		"Vintage"
	],
    "draw_white_space": "all"
}
```

##set hotkeys
######Preferences->Key bindings - User

- reindent
reindent all text...(like netbean)

- toggle_comment

```
[
  { "keys": ["alt+shift+f"], "command": "reindent", "args": {"single_line": false} },
  { "keys": ["ctrl+shift+c"], "command": "toggle_comment", "args": { "block": true } }
]
```

##install package

```
Preferences->package controll
install package->...
```

####prefer packages
```
SFTP
Dotfiles Syntax Highlighting
```




[package control]:https://sublime.wbond.net/installation
