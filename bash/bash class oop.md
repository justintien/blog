

##example
```sh
#!/bin/bash
classA(){
	echo init $FUNCNAME;
	funcA(){
		echo classA.funcA;
	}
	funcB(){
		echo classA.funcB;
	}
}
classB(){
	echo init $FUNCNAME;
	funcA(){
		echo classB.funcA;
	}
	funcB(){
		echo classB.funcB;
	}
}
#not init should get error
funcA;
funcB;
echo '=========';
classA;
funcA;
funcB;
echo '=========';
#overwrite
classB;
funcA;
funcB;
echo '=========';
#overwrite back
classA;
funcA;
funcB;
```

##output
```
./test.sh: line 21: funcA: command not found
./test.sh: line 22: funcB: command not found
=========
init classA
classA.funcA
classA.funcB
=========
init classB
classB.funcA
classB.funcB
=========
init classA
classA.funcA
classA.funcB
```
