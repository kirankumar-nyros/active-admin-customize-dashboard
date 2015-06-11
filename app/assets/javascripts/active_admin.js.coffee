#= require active_admin/base
$(document).ready ->
  $(".my_hide").hide()
  $('b').click ->
    id= "#" + $(this).children("li").html()
    $(id).toggle()
    id= "#" + $(this).attr("name")
    $(id).toggle()
    return
  return