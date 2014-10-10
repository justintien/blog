


######trim
```sh
str="123,456,789";

right_greedy=${str%,*};
echo $right_greedy;
#123,456

right_str=${str%%,*};
echo $right_str;
#123

left_greedy=${str#*,};
echo $left_greedy;
#456,789

left_str=${str##*,};
echo $left_str;
#789
```



##references

[string]


[string]:http://tldp.org/LDP/abs/html/string-manipulation.html
