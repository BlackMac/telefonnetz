
Meteor.publish 'calls', ->
  Calls.find()

Meteor.publish 'contacts', ->
  Contacts.find()