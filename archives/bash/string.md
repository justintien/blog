


######trim
```sh
str="123,456,789";

sub_tail=${str%,*};
echo $sub_tail;
#123,456

sub_tail_greedy=${str%%,*};
echo $sub_tail_greedy;
#123

sub_head=${str#*,};
echo $sub_head;
#456,789

sub_head_greedy=${str##*,};
echo $sub_head_greedy;
#789
```



##references

[string]


[string]:http://tldp.org/LDP/abs/html/string-manipulation.html
