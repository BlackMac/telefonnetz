Router.configure
  layoutTemplate: 'MasterLayout',
  loadingTemplate: 'Loading',
  notFoundTemplate: 'NotFound'

Router.onBeforeAction ->
  AccountsEntry.signInRequired this
  @next?()
, except: ['entryForgotPassword', 'webhooks_mail', 'entryResetPassword', 'entrySignIn', 'entrySignUp']

Router.route('/',
  name: 'home',
  controller: 'HomeController',
  action: 'action',
  where: 'client'
)
