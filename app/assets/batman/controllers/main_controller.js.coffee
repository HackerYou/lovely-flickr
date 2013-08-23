class Flickr.MainController extends Flickr.ApplicationController
  routingKey: 'main'

  index: (params) ->
    Flickr.set 'firstName', 'James'
    Flickr.set 'lastName', 'Bond'

  @accessor 'fullName', ->
    Flickr.get('firstName') + " " + Flickr.get('lastName')
