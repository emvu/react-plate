# @cjsx React.DOM

DP         = require '../dispatchers/app-dispatcher.js'
DemoStore  = require '../stores/demo-store'
DemoDAO    = require '../daos/demo-dao'

AppActions =
  loadDemoMessage: ->
    DemoDAO.getData 
      success: (data) ->
        DP.handleViewAction actionType: 'DEMO_MESSAGE_LOADED', message: data.message


module.exports = AppActions