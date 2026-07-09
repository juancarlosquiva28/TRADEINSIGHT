const modal = document.getElementById("loginModal");

const openButton = document.querySelector(".btn-login");
const closeButton = document.querySelector(".close-btn");

openButton.addEventListener("click", (e) => {
    e.preventDefault();
    modal.classList.add("show");
});

function closeModal() {
    modal.classList.remove("show");
}

closeButton.addEventListener("click", closeModal);

window.addEventListener("click", (e) => {
    if (e.target === modal) {
        closeModal();
    }
});