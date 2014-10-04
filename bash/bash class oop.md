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
