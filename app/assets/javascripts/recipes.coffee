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
