# @cjsx React.DOM

React   = require('react')
actions = require '../actions/app-actions'

Demo = React.createClass

  handleClick: ->
    actions.loadDemoMessage()

  render: ->
    message = if @props.message then <div className="alert alert-success">{@props.message}</div> else null

    <div>
      <button onClick={@handleClick} className="btn btn-primary">Load Demo Message</button>

      {message}
    </div>

module.exports = Demo