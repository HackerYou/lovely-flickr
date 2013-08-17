# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  bg = $('.lightbox-bg')
  box = $('.lightbox-box')

  bg.on 'click', ->
    box.fadeOut()
    bg.fadeOut()

  $('.photo').on 'click', ->
    bg.fadeIn()
    box.fadeIn()

    img = $(this).find('img').clone()
    box.html('')
    box.append(img)

    windowWidth = $(window).width()
    windowHeight = $(window).height()

    if img.width() > windowWidth
      newWidth = windowWidth - 50
    else
      newWidth = img.width()

    if img.height() > windowHeight
      newHeight = windowHeight - 50
    else
      newHeight = img.height()

    img.width(newWidth)
    img.height(newHeight)

    box.offset
      left: (windowWidth - newWidth) / 2
      top: (windowHeight - newHeight) / 2
