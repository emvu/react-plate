React       = require('react')
Link        = require('react-router').Link
ActiveState = require('react-router').ActiveState

Tab = React.createClass
  mixins: [ ActiveState ]

  render: ->
    isActive  = @isActive(@props.to, @props.params, @props.query)
    className = if isActive then 'active' else ''
    link      = Link(@props)

    return <li className={className}>{link}</li>


module.exports = Tab