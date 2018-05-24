import swal from 'sweetalert';

function favRequest () {
  if (document.getElementById('fav-request') === null) {
    return false
  } else {
    document.getElementById('fav-request').addEventListener('click', () => {
      swal({
        text: "Your request has sent to owner",
        icon: "success",
      });
    });
  }
}

export { favRequest };
