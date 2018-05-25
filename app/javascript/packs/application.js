import "bootstrap";
import { favRequest } from 'components/favourite_button';
import { favAccept } from 'components/pending_favourite';
import { pickDate } from 'components/date_picker';


const runFunctions = () => {
  if ( favRequest() === false ) {
    favAccept()
  } else {
    favRequest()
  }
};

runFunctions();
pickDate();

