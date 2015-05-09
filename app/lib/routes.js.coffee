
Router.route 'calls',
  name: 'calls'
  controller: 'CallsController'
  action: 'action'
  where: 'client'

Router.route 'contacts',
  name: 'contacts'
  controller: 'ContactsController'
  action: 'action'
  where: 'client'