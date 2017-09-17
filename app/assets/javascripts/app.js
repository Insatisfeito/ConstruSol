$(document).ready(function() {
  $('#example').dataTable();
  $("#panel1link").click(function() {
    $("#construsolution_type").val(0);
  });
  $("#panel2link").click(function() {
    $("#construsolution_type").val(1);
  });
  $(".chosen-select").chosen({no_results_text: "Sem resultados! ",allow_duplicates: true});
  $(".chosen-select-compare").chosen({no_results_text: "Sem resultados! ",allow_duplicates: false ,max_selected_options: 3});
});

