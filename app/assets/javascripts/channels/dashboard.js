function openTicket(ticketName) {
  var i;
  var x = document.getElementsByClassName('ticket');
  for (i = 0; i < x.length; i++){
    x[i].style.display = 'none';
  }
  document.getElementById(ticketName).style.display = "block";
}
