# @cjsx React.DOM

React               = require('react')
DemoComponent       = require '../components/demo'
StoreListenerMixin  = require '../mixins/store-listener'
DemoStore           = require '../stores/demo-store'
B                   = require 'react-bootstrap'

DemoRoute = React.createClass
  mixins: [StoreListenerMixin]

  getInitialState: ->
    @getStoreState()

  getListeningStores: ->
    [DemoStore]

  getStoreState: ->
    message: DemoStore.getMessage()


  render: ->
    <B.Grid>
      <B.Row>
        <B.Jumbotron>
          <h1>Flux Demo</h1>
          <DemoComponent message={@state.message} />
        </B.Jumbotron>
      </B.Row>
    </B.Grid>

module.exports = DemoRoute
