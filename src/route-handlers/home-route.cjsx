# @cjsx React.DOM

React = require('react')
B     = require('react-bootstrap')

HomeRoute = React.createClass
  
  render: ->
    <B.Grid>
      <B.Row>
        <B.Jumbotron>
          <h1>Application Home</h1>
        </B.Jumbotron>
      </B.Row>
    </B.Grid>

module.exports = HomeRoute
