# @cjsx React.DOM

React               = require('react')
DemoComponent       = require '../components/demo'
StoreListenerMixin  = require '../mixins/store-listener'
DemoStore           = require '../stores/demo-store'

DemoRoute = React.createClass
  mixins: [StoreListenerMixin]

  getInitialState: ->
    @getStoreState()

  getListeningStores: ->
    [DemoStore]

  getStoreState: ->
    message: DemoStore.getMessage()


  render: ->
    <div>
      <h1>Flux Demo</h1>
      <DemoComponent message={@state.message} />
    </div>

module.exports = DemoRoute
