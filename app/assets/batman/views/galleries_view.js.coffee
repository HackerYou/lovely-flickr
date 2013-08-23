class Flickr.GalleriesShowView extends Batman.View
  viewDidAppear: ->
    setTimeout =>
      $('.photo').draggable(revert: true)

      $('.photo-drop').droppable
        accept: '.photo'
        hoverClass: 'hover'
        drop: (event, data) =>
          thisPhoto = Flickr.Photo.find data.draggable.attr('photoid'), =>
            @controller.get('gallery.photos').add(thisPhoto)
