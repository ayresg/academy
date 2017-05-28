

/* Toggle the dropdown menu when someone clicks it */
function toggleMenu() {
  'use strict';
  
  document.getElementById("mobile-menu__target").classList.toggle("mobile-menu--expanded");
  
  document.getElementsByClassName("mobile-menu__navicon")[0].classList.toggle("mobile-menu__navicon--expanded");
  
  document.getElementsByClassName("mobile-menu__label")[0].classList.toggle("mobile-menu__label--expanded");
}

/* Toggle arbitrary items as specified */
function toggleVisible(id) {
  'use strict';
  
  var elt = document.getElementById(id);
  elt.classList.toggle("show");
}