import swal from 'sweetalert';

function favAccept () {
  if (document.querySelector('#accept-fav') === null) {
    return false
  } else {
    document.querySelector('#accept-fav').addEventListener('click', () => {
      swal({
        text: "Request Accepted!",
        icon: "success",
      })
    });
    document.querySelector('#reject-fav').addEventListener('click', () => {
      swal("Request denied", {
        buttons: false,
      })
    });
  }
}


export { favAccept };
