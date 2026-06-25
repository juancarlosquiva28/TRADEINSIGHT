 
    function mostrarTendencias() {
      document.getElementById("tendenciasDetalle").style.display = "block";
      document.getElementById("tendenciasDetalle").scrollIntoView({ behavior: "smooth" });
    }

    function cerrarTendencias() {
      document.getElementById("tendenciasDetalle").style.display = "none";
      window.scrollTo({ top: 0, behavior: "smooth" });
    }
