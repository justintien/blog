
##example
```
#!/bin/bash

declare -A __g;

class(){
	global_var_name="__g";
	func(){
		(($global_var_name[times]++));
	}
}
class;
func;
echo ${__g[times]};
```

##output
```
1
```
