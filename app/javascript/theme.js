// Theme & display toggle

document.addEventListener("DOMContentLoaded", () => {
  // Theme toggle
  const themeBtn = document.getElementById("theme-toggle");
  if (themeBtn) {
    themeBtn.addEventListener("click", () => {
      const currentTheme = document.body.className;
      const newTheme = currentTheme === "dark" ? "light" : "dark";
      document.body.className = newTheme;
      localStorage.setItem("theme", newTheme);
    });
  }

  // Display toggle (grid/list)
  const displayBtn = document.getElementById("display-toggle");
  if (displayBtn) {
    const iconGrid = document.getElementById("icon-grid");
    const iconList = document.getElementById("icon-list");

    const updateDisplayIcons = (display) => {
      if (iconGrid && iconList) {
        if (display === "grid") {
          iconGrid.style.display = "none";
          iconList.style.display = "block";
        } else {
          iconGrid.style.display = "block";
          iconList.style.display = "none";
        }
      }
    };

    // Sync icons with current state
    updateDisplayIcons(document.body.id || "list");

    displayBtn.addEventListener("click", () => {
      const currentDisplay = document.body.id;
      const newDisplay = currentDisplay === "list" ? "grid" : "list";
      document.body.id = newDisplay;
      localStorage.setItem("display", newDisplay);
      updateDisplayIcons(newDisplay);
    });
  }

  // Scroll to top
  const scrollBtn = document.getElementById("scroll-top");
  if (scrollBtn) {
    scrollBtn.addEventListener("click", () => {
      window.scrollTo({ top: 0, behavior: "smooth" });
    });
  }
});
