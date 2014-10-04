

##example
```sh
#!/bin/bash

classA(){
	echo init $FUNCNAME;
	funcA(){
		echo classA funcA;
	}
	funcB(){
		echo classA funcB;
	}
}
classB(){
	echo init $FUNCNAME;
	funcA(){
		echo classB funcA;
	}
	funcB(){
		echo classB funcB;
	}
}
echo '=========';
echo 'not init should get error';

funcA;
funcB;

echo '=========';

classA;funcA;
funcA;
funcB;

echo '=========';

classB;funcB;
funcA;
funcB;

echo '=========';

classA;funcA;
funcA;
funcB;

echo '=========';

classB;funcA;
funcA;
funcB;

echo '=========';
```

##output
```
=========
not init should get error
./test.sh: line 24: funcA: command not found
./test.sh: line 25: funcB: command not found
=========
init classA
classA funcA
classA funcA
classA funcB
=========
init classB
classB funcB
classB funcA
classB funcB
=========
init classA
classA funcA
classA funcA
classA funcB
=========
init classB
classB funcA
classB funcA
classB funcB
=========
```
