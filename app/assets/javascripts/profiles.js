// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  console.log("hi");
  $("#profile_imperial_height").change(function(e){
    if($("#profile_imperial_height").val() !== ""){
      $("#profile_imperial").val("true");
    }else{
      $("#profile_imperial").val("");
    }
  });
});