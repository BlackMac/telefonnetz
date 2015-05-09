@Contacts = new Mongo.Collection('contacts')


if Meteor.isServer
  Contacts.allow
    insert: (userId, doc) ->
      false
    update: (userId, doc, fieldNames, modifier) ->
      false
    remove: (userId, doc) ->
      false

  Contacts.deny
    insert: (userId, doc) ->
      true
    update: (userId, doc, fieldNames, modifier) ->
      true
    remove: (userId, doc) ->
      true
