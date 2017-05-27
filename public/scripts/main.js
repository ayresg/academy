'use strict';

/* Toggle the dropdown menu when someone clicks it */
function toggleMenu() {
  document.getElementById("mobile-menu__target").classList.toggle("mobile-menu--expanded");
}

/* Toggle arbitrary items as specified */
function toggleVisible(id) {
  var elt = document.getElementById(id);
  elt.classList.toggle("show");
}