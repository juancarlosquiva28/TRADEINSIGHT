console.log("JS cargado");

document.addEventListener("DOMContentLoaded", () => {

    const modal = document.getElementById("logoutModal");

    const openButton = document.querySelector(".btn-logout");
    const closeButton = document.querySelector(".close-btn");
    const cancelButton = document.getElementById("cancelLogout");
    const confirmButton = document.getElementById("confirmLogout");

    openButton.addEventListener("click", (e) => {
        e.preventDefault();
        modal.style.display = "flex";
    });

    closeButton.addEventListener("click", () => {
        modal.style.display = "none";
    });

    cancelButton.addEventListener("click", () => {
        modal.style.display = "none";
    });

    confirmButton.addEventListener("click", () => {
        window.location.href = "index.html";
    });

    window.addEventListener("click", (e) => {
        if (e.target === modal) {
            modal.style.display = "none";
        }
    });

});