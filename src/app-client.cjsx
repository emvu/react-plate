# @cjsx React.DOM

React      = require('react');
AppRoute   = require('./route-handlers/app-route');
DemoRoute  = require('./route-handlers/demo-route');
HomeRoute  = require('./route-handlers/home-route');
R          = require('react-router')

routes =    
  <R.Routes location="hash">
    <R.Route          name="root"  handler={AppRoute}  path="/">
      <R.DefaultRoute name="home"  handler={HomeRoute} />
      <R.Route        name="demo"  handler={DemoRoute} path="demo" />
    </R.Route>
  </R.Routes>

React.render(routes, document.body)