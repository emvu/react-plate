# @cjsx React.DOM 

React    = require 'react'
actions  = require '../actions/app-actions'
B        = require 'react-bootstrap'
R        = require('react-router')

AppRoute = React.createClass
  render: ->
    <div>
      <B.Navbar>
        <B.Nav>
          <li><R.Link to="home">Home</R.Link></li>
          <li><R.Link to="demo">Demo</R.Link></li>
        </B.Nav>
      </B.Navbar>

      <this.props.activeRouteHandler />
    </div>

module.exports = AppRoute
