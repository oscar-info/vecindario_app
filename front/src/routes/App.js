import React from 'react'
import { Redirect, Route, Switch, BrowserRouter as Router } from 'react-router-dom'
import Home from '../containers/Home'
import Cms from '../containers/Cms'
import '../assets/styles/App.scss'

const App = () => {
  return (
    <>
      <Router>
        <Switch>
          <Route exact path='/' component={ Home } />
          <Route exact path='/cms' component={ Cms } />
          <Redirect to='/' />
        </Switch>
    </Router>
    </>
  );
}

export default App;
