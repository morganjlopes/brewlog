# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  $('#recipe_events_table tr select').change( ->
    if($(this).val() == "Start Boil")
      child = $(this).closest("tr").children("td.recipe_event_subject_column");
      child.children(".recipe_recipe_events_subject").hide()
    else if ($(this).val() == "Terminate Boil")
      child = $(this).closest("tr").children("td.recipe_event_subject_column");
      child.children(".recipe_recipe_events_subject").hide()
    else
      child = $(this).closest("tr").children("td.recipe_event_subject_column");
      child.children(".recipe_recipe_events_subject").show()

  ).change()

  $('.abv_data_set').keyup( ->
    og = $('#recipe_projected_original_gravity').val()
    fg = $('#recipe_projected_final_gravity').val()

    abv = (og-fg) * 131.25
    $("#recipe_projected_alcohol_by_volume").val(abv.toFixed(2))
  ).keyup()
