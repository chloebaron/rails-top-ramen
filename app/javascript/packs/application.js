import "bootstrap";
import { favRequest } from 'components/favourite_button';
import { favAccept } from 'components/pending_favourite';


const runFunctions = () => {
  if ( favRequest() === false ) {
    favAccept()
  } else {
    favRequest()
  }
};

runFunctions();


