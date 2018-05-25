import "bootstrap";
import { favRequest } from 'components/favourite_button';
import { favAccept } from 'components/pending_favourite';
import { autoClick } from 'packs/auto_click_on_ramen';

// const navbarLinks = document.querySelectorAll('.navbar-fixed-top a')
// const navbar = document.querySelector('.navbar-fixed-top')

// function changeNavBar() {
//   if (navbar.offsetTop < 52) {
//     navbarLinks.forEach(function(link) {
//       link.style.color = "#000";
//     });
//   } else {
//     navbarLinks.forEach(function(link) {
//       link.style.color = "#D56764";
//     });
//   }
// }

// window.addEventListener('scroll', changeNavBar);


const runFunctions = () => {
  if ( favRequest() === false ) {
    favAccept()
  } else {
    favRequest()
  }
};

runFunctions();
autoClick();


