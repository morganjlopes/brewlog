# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(".dropdown-toggle").dropdown()
  
  $('textarea.autosize').autosize();

  $('body').scrollspy({ target: '.spy-nav' })

  $('input.floatlabel').floatlabel();
  $(".toggleable").click ->
    item = $(this).data("toggle-wrapper")
    $(item).slideToggle()

  $('#batch_projected_volume_in_gallons').keyup( ->
    volume_value_in_gallons = $(this).val()

    # Conversions
    volume_as_fluid_ounces = (volume_value_in_gallons * 128.00);
    volume_as_pints        = (volume_value_in_gallons * 8);
    volume_as_liters       = (volume_value_in_gallons * 3.79);

    # Growler 
    full_growler_count       = (volume_as_fluid_ounces / 64.00);
    full_growler_whole       = Math.floor(full_growler_count);
    full_growler_extra       = (full_growler_count - full_growler_whole);
    full_growler_extra_in_oz = full_growler_extra * 64.00;

    #Half Growler
    half_growler_count       = (volume_as_fluid_ounces / 32.00);
    half_growler_whole       = Math.floor(half_growler_count);
    half_growler_extra       = (half_growler_count - half_growler_whole);
    half_growler_extra_in_oz = half_growler_extra * 32.00;

    #22oz Bottle Count
    bottle_22_oz_count       = (volume_as_fluid_ounces / 22.00);
    bottle_22_oz_whole       = Math.floor(bottle_22_oz_count);
    bottle_22_oz_extra       = (bottle_22_oz_count - bottle_22_oz_whole);
    bottle_22_oz_extra_in_oz = bottle_22_oz_extra * 22.00;
    
    #12oz Bottle Count
    bottle_12_oz_count       = (volume_as_fluid_ounces / 12.00);
    bottle_12_oz_whole       = Math.floor(bottle_12_oz_count);
    bottle_12_oz_extra       = (bottle_12_oz_count - bottle_12_oz_whole);
    bottle_12_oz_extra_in_oz = bottle_12_oz_extra * 12.00;

    #Place HTML
    $('#calculated_full_growler_count').html(full_growler_whole);
    $('#calculated_full_growler_extra_in_oz').html(full_growler_extra_in_oz.toFixed(0));
    $('#calculated_half_growler_count').html(half_growler_whole);
    $('#calculated_half_growler_extra_in_oz').html(half_growler_extra_in_oz.toFixed(0));
    $('#calculated_bottle_22_oz_count').html(bottle_22_oz_whole);
    $('#calculated_bottle_22_oz_extra_in_oz').html(bottle_22_oz_extra_in_oz.toFixed(0));
    $('#calculated_bottle_12_oz_count').html(bottle_12_oz_whole);
    $('#calculated_bottle_12_oz_extra_in_oz').html(bottle_12_oz_extra_in_oz.toFixed(0));

  ).keyup()

  $("a[href^=\"#\"]").bind "click.smoothscroll", (e) ->
    e.preventDefault()
    target = @hash
    $target = $(target)
    $("html, body").stop().animate
      scrollTop: $target.offset().top - 0
    , 900, "swing", ->
      window.location.hash = target
      