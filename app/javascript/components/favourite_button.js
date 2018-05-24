import swal from 'sweetalert';

function favRequest () {
  document.getElementById('fav-request').addEventListener('click', () => {
    swal({
      text: "Your reques has sent to owner",
      icon: "success",
    });
  });
}

export { favRequest };
