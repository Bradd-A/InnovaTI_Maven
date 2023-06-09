
<script>
    var dropdown = document.getElementsByClassName("dropdown-btn");
    var i;

    for (i = 0; i < dropdown.length; i++) {
        dropdown[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var dropdownContent = this.nextElementSibling;
            if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";

            } else {
                dropdownContent.style.display = "block";
            }
        });
    }
   
function printHTML() {
  if (window.print) {
      document.getElementById("a").style.display = "none";
      document.getElementById("b").style.display = "none";
      document.getElementById("c").style.display = "none";
    window.print();
  }
}

           
</script>



