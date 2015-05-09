@Calls = new Mongo.Collection('calls')


if Meteor.isServer
  Calls.allow
    insert: (userId, doc) ->
      false
    update: (userId, doc, fieldNames, modifier) ->
      false
    remove: (userId, doc) ->
      false

  Calls.deny
    insert: (userId, doc) ->
      true
    update: (userId, doc, fieldNames, modifier) ->
      true
    remove: (userId, doc) ->
      true
