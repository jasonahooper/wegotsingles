// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $("#profile_imperial_height").change(function(e){
    if($("#profile_imperial_height").val() !== ""){
      $("#profile_imperial").val("true");
    }else{
      $("#profile_imperial").val("");
    }
  });

  $("#profile_imperial_weight").change(function(e){
    if($("#profile_imperial_weight").val() !== ""){
      $("#profile_imperial").val("true");
    }else{
      $("#profile_imperial").val("");
    }
  });
});