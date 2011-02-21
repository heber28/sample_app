// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function CountLeft(field_id, count_id, max) {
  var myField = document.getElementById(field_id)
  var myCount = document.getElementById(count_id)
  if (myField.value.length > max)
	myField.value = myField.value.substring(0, max);
  else
	myCount.value = max - myField.value.length;
}
