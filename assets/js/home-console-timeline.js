if (window.$docsify) {
  window.location.reload();
}

const config = window._gameConsoleConfig;

function openURL(url) {
  window.open(url, "_blank");
}

function generateTR(list = []) {
  if (list.length === 0) return;

  let tr = "";
  for (let i = 0; i < list.length; i++) {
    const obj = list[i];
    const companyObj =
      config.companies.find((row) => row.company === obj.company) || {};
    let displayCompnay = companyObj.logo
      ? `<a href="${companyObj.wiki}" target="_blank"><div><img height=20 width=100 src="${companyObj.logo}"></img>&nbsp;&nbsp;&nbsp;&nbsp;</div></a>`
      : `<a href="${companyObj.wiki}" target="_blank"><div>[${companyObj.company}]&nbsp;&nbsp;&nbsp;&nbsp;</div></a>`;
    let displayName = `<a href="${obj.wiki}"><div>${obj.name}</div></a>`;
    let displayPlay = obj.play
      ? `<button class="button" onclick="openURL('${obj.play}')"><span>PLAY</span></button>`
      : "";

    const td = `
                <td class="company">${displayCompnay}</td>
                <td class="console">
                  ${displayName}
                  <div class="tooltip">
                    ${displayCompnay}
                    <img src="${obj.cover}">
                  </div>
                </td>
                <td class="emulator">${displayPlay}</td>`;
    if (i === 0) {
      const date = obj.release_date
        .match(/(\d{4})(\d{2})(\d{2})/)
        .slice(1)
        .join("/");
      tr = `<tr> 
              <th class="actived" rowspan="${list.length}">${date}</th>
              ${td}
            </tr>`;
      continue;
    }
    tr += `<tr>${td}</tr>`;
  }

  return tr;
}

var table = document.createElement("table");
var caption = document.createElement("caption");
var tbody = document.createElement("tbody");

caption.innerText = `家用遊戲機發行時間軸`;
table.classList.add("release-timeline");
table.classList.add("wikitable");
table.appendChild(caption);
table.appendChild(tbody);
document.body.appendChild(table);

for (let index = 1; index <= 9; index++) {
  let generationObj = config.generations.find(
    (obj) => obj.generation === index
  );
  let list = config.consoles.filter((obj) => obj.generation === index);

  tbody.innerHTML += `
              <tr> 
                <td class="generation">
                  <div>第 ${index} 世代 (${generationObj.period})</div>
                  <div class="tooltip"></div>
                </td>
            </tr>`;

  list.sort((a, b) => parseInt(a.release_date) - parseInt(b.release_date));
  list
    .reduce((acc, curr) => {
      let find = acc.find((obj) => obj.release_date === curr.release_date);
      if (!find) {
        find = {
          release_date: curr.release_date,
          list: [],
        };
        acc.push(find);
      }
      find.list.push(curr);
      return acc;
    }, [])
    .forEach((obj) => {
      tbody.innerHTML += generateTR(obj.list);
    });
}
