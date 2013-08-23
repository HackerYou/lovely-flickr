class Flickr.Photo extends Batman.Model
  @resourceName: 'photos'
  @storageKey: 'photos'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  @encode 'title', 'upload'
  @encodeTimestamps()

  @belongsTo 'gallery'
