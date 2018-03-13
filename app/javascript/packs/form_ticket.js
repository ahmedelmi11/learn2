$(document).ready(function(){
  $(".technology-choice").click(function(evt){
    $(this).toggleClass("active");
  });

  $(".explanation").slideUp();

  $("#how-it-works").click(function(evt){
    $(".explanation").removeClass('hidden');
    $(".explanation").slideToggle();
  });
});

