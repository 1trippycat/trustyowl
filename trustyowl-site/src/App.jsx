import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Home from './pages/Home';
import ThankYou from './pages/ThankYou';
import Header from './components/Header';
import Footer from './components/Footer';

const App = () => {
  return (
    <Router>
      <Header />
      <Switch>
        <Route path="/" exact component={Home} />
        <Route path="/thank-you" component={ThankYou} />
      </Switch>
      <Footer />
    </Router>
  );
};

export default App;