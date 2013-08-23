class Flickr.GalleriesController extends Flickr.ApplicationController
  routingKey: 'galleries'

  index: (params) ->
    @set('galleries', Flickr.Gallery.get('all'))

  show: (params) ->
    @set('photos', Flickr.Photo.get('all'))
    @set 'gallery', Flickr.Gallery.find params.id, ->

  edit: (params) ->

  new: (params) ->
    @set('gallery', new Flickr.Gallery)

  create: (params) ->
    gallery = @get('gallery')
    gallery.save ->
      Batman.redirect(gallery)

  update: (params) ->

  destroy: (params) ->

  @accessor 'noGalleries', ->
    @get('galleries.length') == 0
