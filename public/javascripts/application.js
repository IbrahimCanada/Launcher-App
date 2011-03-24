// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function() {
	
	$(document).load(function() {
		document.body.style.backgroundColor = "red";
	});
	
	$("#alert").click(function() {
  	document.body.background = this.getAttribute("data-message");
   	document.body.style.backgroundRepeat = 'no-repeat';
  	document.body.style.backgroundPosition = 'center';
    return false;
  });

});


