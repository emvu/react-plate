AppDispatcher = require("../dispatchers/app-dispatcher")
merge         = require("react/lib/merge")
EventEmitter  = require("events").EventEmitter
CHANGE_EVENT  = "change"

message = null

DemoStore = merge(EventEmitter::,
  emitChange: ->
    @emit CHANGE_EVENT

  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback) ->
    @removeListener CHANGE_EVENT, callback

  getMessage: ->
    message

  dispatcherIndex: AppDispatcher.register (payload) ->
    action = payload.action
    
    switch action.actionType

      when 'DEMO_MESSAGE_LOADED'
        message = action.message


    DemoStore.emitChange()  
)

module.exports = DemoStore