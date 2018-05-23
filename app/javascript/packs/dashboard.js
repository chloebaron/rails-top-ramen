let actions = document.getElementById("user-tabs");

const userRamen = document.getElementById("user-ramen");

const userReviews = document.getElementById("user-reviews");

// const userFav = document.getElementById("user-favs");

const userReq = document.getElementById("user-requests");

const reviewContent = element => {
   if (element.checked === true) {
    userReviews.style.display = "block";
  } else {
    userReviews.style.display = "none";
  }
}

// const favContent = element => {
//   if (element.checked === true) {
//     userFav.style.display = "block";
//   } else {
//     userFav.style.display = "none";
//   }
// }

const ramenContent = element => {
  if (element.checked === true) {
    userRamen.style.display = "block";
   } else {
    userRamen.style.display = "none";
  }
}

const requestContent = element => {
  if (element.checked === true) {
    userReq.style.display = "block";
   } else {
    userReq.style.display = "none";
  }
}

const show = () => {

  let ramenInput= document.getElementById("ramens");

  // let favInput = document.getElementById("favs");

  let reviewInput = document.getElementById("reviews");

  let requestInput = document.getElementById("requests");

  ramenContent(ramenInput);

  favContent(favInput);

  reviewContent(reviewInput);

  requestContent(requestInput);
}

actions.addEventListener("click", show);
