# @cjsx React.DOM

DemoDAO = 
  getData: (callbacks) ->
    # Here should come ajax request
    callbacks.success?(message: 'Demo Test Message!')

module.exports = DemoDAO