//Criar uma variavel do tipo constante para armazenar um seletor css
const elementoDuvida = document.querySelectorAll(".duvidas");

elementoDuvida.forEach(function (duvidas) {
  duvidas.addEventListener("click", function () {
    duvidas.classList.toggle("ativa");
  });
});
