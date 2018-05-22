import swal from 'sweetalert';

function bindSweetAlertButtonAddFavourite () {
  document.getElementById('favourite').addEventListener('click', () => {
    swal("Are you sure you want to do this?", {
      buttons: ["Oh noez!", true],
    });
  });
}
