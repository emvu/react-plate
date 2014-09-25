# @cjsx React.DOM

React   = require('react')
actions = require '../actions/app-actions'
B       = require('react-bootstrap');

Demo = React.createClass

  handleClick: ->
    actions.loadDemoMessage()

  render: ->
    message = if @props.message then <B.Alert bsStyle="warning">{@props.message}</B.Alert> else null

    <div>
      <B.Button onClick={@handleClick} bsStyle="primary">Load Demo Message</B.Button>

      {message}
    </div>

module.exports = Demo