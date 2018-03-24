PHP官方新的資料都很齊全，

但舊的其實很難翻(因為沒有表格)

所以舊自己整理個regex簡寫對照表

```
//空白
//white space (not quite the same as \s)
[[:space:]]===

[\f\n\r\t\v]===\s

//非空白
[^\f\n\r\t\v]===\S

//
//any horizontal whitespace character (since PHP 5.2.4)
\h

//
//any character that is not a horizontal whitespace character (since PHP 5.2.4)
\H

//
//any vertical whitespace character (since PHP 5.2.4)
\v

//
//any character that is not a vertical whitespace character (since PHP 5.2.4)
\V

//
//space or tab only
[[:blank:]]===

//
//control characters
[[:cntrl:]]===

//數字
//decimal digits
[[:digit:]]===[0-9]===\d

//非數字
[^0-9]===\D

//十六進位數字
//hexadecimal digits
[[:xdigit:]]===[\dABCDEF]

//大寫字母
//upper case letters
[[:upper:]]===[A-Z]

//小寫字母
//lower case letters
[[:lower:]]===[a-z]

//大小寫字母+數字+底線
//"word" characters (same as \w)
[[:word:]]===[A-Za-z0-9_]===\w

//非大小寫字母或數字或底線
[^A-Za-z0-9_]===\W

//
//letters and digits
[[:alnum:]]===

//
//letters
[[:alpha:]]===

//
//character codes 0 - 127
[[:ascii:]]===

//
//printing characters, excluding space
[[:graph:]]===

//
//printing characters, including space
[[:print:]]===

//
//printing characters, excluding letters and digits
[[:punct:]]===
```

跳脫字元
```
//
//alarm, that is, the BEL character (hex 07)
\a

//
//"control-x", where x is any character
\cx

//
//escape (hex 1B)
\e===\x1b

//換頁
//formfeed (hex 0C)
\f===\x0c===\cL

//換行
//newline (hex 0A)
\n===\x0a===\cJ

//
//a character with the xx property, see unicode properties for more info
\p{xx}

//
//a character without the xx property, see unicode properties for more info
\P{xx}

//ENTER
//carriage return (hex 0D)
\r===\x0d===\cM

//
//tab (hex 09)
\t===\x09===\cI

//
//character with hex code hh
\xhh

//
//character with octal code ddd, or backreference
\ddd
```

[character-classes]:http://php.net/manual/en/regexp.reference.character-classes.php
[escape]:http://php.net/manual/en/regexp.reference.escape.php
[white-space]:http://en.wikipedia.org/wiki/Whitespace_character
