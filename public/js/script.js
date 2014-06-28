$(document).ready(function(){
  $('.register.login').on('click', function(){
    console.log('a');
    var pass1 = $('.register[name=regpass]').val();
    console.log(pass1);
  })
})
