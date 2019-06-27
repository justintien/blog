Last-Modified: {docsify-updated}

# lodash

> https://github.com/lodash/lodash

- _.merge _.assign _.extend _.assignIn 差別




```js
// 1) 把源對象(sources)的屬性分配到目標對象(object)，源對象會從左往右地調用，後面對象的屬性會覆蓋前面的。
// 2) assign 函數不會把原型鏈上的屬性合併到目標對象，而 extend 或 assignIn 函數則會！
// 3) merge 也和 assign 類似，不同的地方在於 merge 遇到相同屬性的時候，如果屬性值為純對象(plain object)或者集合(collection)時，不是用後面的屬性值去覆蓋前面的屬性值，而是會把前後兩個屬性值合併。
// 4) 如果源對象的屬性值為 undefined ，則會忽略該屬性。
let data = {
    a: 1,
    b: {
        c: 2
    },
    d: 3
}

_.merge({}, data, {
    b: {
        a: 1
    }
})
/**
 後面的會覆蓋前面的, merge 是採取合併的方式
 {
    a: 2,
    b: {
        a: 1
        c: 2
    }
    d: 3
  }
 **/

_.assign({}, data, {
    b: {
        a: 1
    }
})
/**
 後面的會覆蓋前面的, assign 是採取完全覆蓋的方式，可以看出差異
 {
    a: 2,
    b: {
        a: 1
    }
    d: 3
  }
 **/

```

- _.defaults _.defaultsDeep

```js
// 將源對象的自己和繼承的可枚舉字符串鍵控屬性分配給解析為未定義的所有目標屬性的目標對象。源對像從左到右應用。一旦設置了屬性，相同屬性的其他值將被忽略。
_.defaults({a:1}, {
    a: 2
})
/**
{
    a: 1
}
 **/
 
_.defaults({a:1}, {
    b: 2
})
/**
{
    a: 1,
    b: 2
}
 **/
_.defaults({a:{b:1}}, {
    a: {
        b: 2,
        c: 3
    }
})
/**
{
    a: {
      b: 1
    }
}
 **/

// 若要遞迴 assign 則使用 defaultsDeep
_.defaultsDeep({a:{b:1}}, {
    a: {
        b: 2,
        c: 3
    }
})
/**
 可以看到已存在的 key 不會被蓋掉，不存在的key 遞迴 assign
{
    a: {
      b: 1,
      c: 3
    }
}
 **/

```