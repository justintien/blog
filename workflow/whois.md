```js
const whois = require('whois-api');

function gerenrateDict (arr = []) {
    let a = 97
    let z = 122
    for (let i = a; i <= z; i++) {
        for (let j = a; j <= z; j++) {
            for (let k = a; k <= z; k++) {
                let str = String.fromCharCode(i) + String.fromCharCode(j) + String.fromCharCode(k)
                arr.push(str)
            }
        }
    }
    return arr
}

let domains = gerenrateDict()
let end = '.tw'

let list = []
let notList = []
let errList = []

domains.map((val, index) => {
    let dns = val + end
    setTimeout(() => {
        whois.lookup(dns, (error, result) => {
            if (error) {
                errList.push(dns)
            } else {
                if (result.registrar) {
                    list.push(dns)
                } else {
                    console.log(dns, 'not found', error, result)
                    notList.push(dns)
                }
            }
        });
    }, index * 1000)
    // let json
    // try {
    //     json = JSON.parse(res)
    // } catch (e) {
    //     json = {}
    // }
    // console.log(json)
    // if (!json.hasOwnProperty('registrar')) {
    //     console.log('notFound', dns)
    //     notList.push(dns)
    // } else {
    //     console.log('registed:', dns)
    // }
})


// let domainListString = domains.join(` `)

// let res = execSync(`whois-api ${domainListString}`).toString()

// let existsList = []
// let notList = [] 
// for (let domain in res) {
//     if (!res[domain].hasOwnProperty('registrar')) {
//         notList.push(domain)
//     } else {
//         existsList.push(domain)
//     }
// }

console.log(notList, 'notList')
console.log(errList, 'errList')
console.log(list, 'registed')
```