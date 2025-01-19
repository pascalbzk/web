// Charger dynamiquement le contenu du footer
document.addEventListener("DOMContentLoaded", function () {
  const footerContainer = document.getElementById("footer-container");

  if (footerContainer) {
    fetch("footer.html")
      .then((response) => response.text())
      .then((data) => {
        footerContainer.innerHTML = data;
      })
      .catch((error) =>
        console.error("Erreur lors du chargement du footer:", error)
      );
  }
});
