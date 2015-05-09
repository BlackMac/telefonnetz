sipgate = new Sipgate()

sipgate.events
  newCall: (call) ->
    Calls.insert call
  hangup: (call) ->
    Calls.update call.id, $set:call
