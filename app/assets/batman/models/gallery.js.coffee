class Flickr.Gallery extends Batman.Model
  @resourceName: 'galleries'
  @storageKey: 'galleries'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  @encode 'name'
  @encodeTimestamps()

  @validate 'name', presence: true

  @hasMany 'photos'
