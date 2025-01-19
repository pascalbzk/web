document.querySelector("#search").addEventListener("input", function () {
  const query = this.value;
  fetch(`php/produits.php?search=${query}`)
    .then((response) => response.json())
    .then((data) => {
      let resultDiv = document.querySelector("#search-results");
      resultDiv.innerHTML = "";
      data.forEach((produit) => {
        resultDiv.innerHTML += `
                    <div>
                        <h2>${produit.nom}</h2>
                        <p>${produit.description}</p>
                        <p>Prix : ${produit.prix} $</p>
                    </div>
                `;
      });
    });
});
