if ( window.addEventListener ) {
  var state = 0, konami = [38,38,40,40,37,39,37,39,66,65,13];
  window.addEventListener("keydown", function(e) {
    if ( e.keyCode == konami[state] ) {
    	state++;
    } else {
    	state = 0;
    }
    if ( state == 11 )
      document.querySelector('body').className += 'konami';

    }, true);
}