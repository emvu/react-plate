# @cjsx React.DOM 

React    = require 'react'
actions  = require '../actions/app-actions'
# B        = require 'react-bootstrap'
R        = require('react-router')
Tab      = require '../components/tab'

AppRoute = React.createClass
  render: ->
    <div>
      <nav className="navbar navbar-default" role="navigation">
        
          <ul className="nav navbar-nav">      
            <Tab to="home">Home</Tab>
            <Tab to="demo">Demo</Tab>
          </ul>
        
      </nav>

      <div className="well">
        <this.props.activeRouteHandler />
      </div>
    </div>

module.exports = AppRoute
