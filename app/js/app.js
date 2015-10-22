$(document).ready(function(){
  var keypresses = {
    104: 'h',
    106: 'j',
    107: 'k',
    108: 'l',
    72: 'h',
    74: 'j',
    75: 'k',
    76: 'l'
  }

  $(document).on('keypress', function(event){
    if (keypresses[event.which]) {
      $('.frame--left').addClass('slide-to-right');
      $('.frame--home').hide();
    }
  });


});
