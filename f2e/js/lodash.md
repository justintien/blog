# lodash

> https://github.com/lodash/lodash

- _.merge _.assign _.extend _.assignIn 差别




```js
// 1) 把源对象(sources)的属性分配到目标对象(object)，源对象会从左往右地调用，后面对象的属性会覆盖前面的。
// 2) assign 函数不会把原型链上的属性合并到目标对象，而 extend 或 assignIn 函数则会！
// 3) merge 也和 assign 类似，不同的地方在于 merge 遇到相同属性的时候，如果属性值为纯对象(plain object)或者集合(collection)时，不是用后面的属性值去覆盖前面的属性值，而是会把前后两个属性值合并。
// 4) 如果源对象的属性值为 undefined ，则会忽略该属性。
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
 后面的会覆盖前面的, merge 是采取合并的方式
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
 后面的会覆盖前面的, assign 是采取完全覆盖的方式，可以看出差异
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

// 若要递回 assign 则使用 defaultsDeep
_.defaultsDeep({a:{b:1}}, {
    a: {
        b: 2,
        c: 3
    }
})
/**
 可以看到已存在的 key 不会被盖掉，不存在的key 递回 assign
{
    a: {
      b: 1,
      c: 3
    }
}
 **/

```