const navbar = document.getElementById("navbar");
const timeline = document.getElementById("timeline");

window.generationConfig.generations.forEach((generationObj) => {
  let [startYear, endYear] = generationObj.period.split("-");
  startYear = parseInt(startYear, 10);
  endYear = parseInt(endYear, 10) || new Date().getFullYear();

  // nvabar
  const navLink = document.createElement("a");
  navLink.href = `#generateion-${generationObj.period}`;
  navLink.textContent = `第 ${generationObj.generation} 世代`;
  navbar.appendChild(navLink);

  const decadeTitle = document.createElement("h2");
  decadeTitle.id = `generateion-${generationObj.period}`;
  decadeTitle.className = "text-2xl generation-title";
  decadeTitle.textContent =
    "🗓️ " + `第 ${generationObj.generation} 世代 (${generationObj.period})`;
  decadeTitle.onclick = function () {
    if (generationObj.wiki) window.open(generationObj.wiki, "_blank");
  };
  timeline.appendChild(decadeTitle);

  for (year = startYear; year <= endYear; year++) {
    const consoles = generationObj.consoles.filter((console) => {
      const consolePublishYear = parseInt(console.release_date.slice(0, 4), 10);
      return year === consolePublishYear;
    });

    if (consoles.length === 0) continue;

    const section = document.createElement("section");
    section.id = `y${year}`;
    section.className = "scroll-mt-20";

    const yearTitle = document.createElement("h3");
    yearTitle.className = "text-xl mb-4 year-title";
    yearTitle.textContent = `📅 ${year}`;
    section.appendChild(yearTitle);

    const grid = document.createElement("div");
    grid.className = "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6";

    consoles.forEach((console) => {
      const card = document.createElement("div");
      card.className = "card p-4 rounded-xl";

      const img = document.createElement("img");
      img.src = console.cover;
      img.alt = console.name;
      img.className = "rounded mb-2 w-full h-auto max-h-48 object-contain";

      const h4 = document.createElement("h4");
      h4.className = "text-sm";
      h4.textContent = "🎮 " + console.name;

      const p = document.createElement("p");
      p.className = "text-xs";
      p.textContent = console.name;

      card.appendChild(img);
      card.appendChild(h4);
      card.appendChild(p);
      grid.appendChild(card);

      card.onclick = function () {
        if (console.wiki) {
          window.open(console.wiki, "_blank");
        }
      };
    });

    section.appendChild(grid);
    timeline.appendChild(section);
  }
});

const navLinks = document.querySelectorAll("#navbar a");

document.addEventListener("scroll", () => {
  const sections = document.querySelectorAll("main section");
  let current = "";
  sections.forEach((section) => {
    const sectionTop = section.offsetTop - 120;
    if (pageYOffset >= sectionTop) {
      current = section.getAttribute("id");
    }
  });
  if (current === "") {
    navLinks.forEach((link) => link.classList.remove("active"));
    return;
  }
  navLinks.forEach((link) => {
    link.classList.remove("active");
    if (link.getAttribute("href") === "#" + current) {
      link.classList.add("active");
    }
  });
});

navLinks.forEach((link) => {
  link.addEventListener("mouseenter", () => {
    link.classList.add("hovering");
  });
  link.addEventListener("mouseleave", () => {
    link.classList.remove("hovering");
  });
});
