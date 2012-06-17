function focus_on_first_field() {
  var field = $('input[type=text], input[type=email]').first();
  if (field) {
    field.focus();
  }
}
$(function () { focus_on_first_field(); });
