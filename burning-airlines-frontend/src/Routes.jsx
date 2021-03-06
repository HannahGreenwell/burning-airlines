import React from 'react';
import {HashRouter as Router, Route} from 'react-router-dom';

import Header from './components/Header';
import SearchForm from './components/SearchForm';
import SearchResults from './components/SearchResults';
import FlightShow from './components/FlightShow';
import BookingConfirmation from './components/BookingConfirmation';
import UserReservations from './components/UserReservations';

const Routes = (
  <Router>
    <div>
      <Route component={Header} />
      <Route path="/search" component={SearchForm} />
      <Route exact path="/search/:orig/:dest" component={SearchResults} />
      <Route exact path="/flight/:id" component={FlightShow} />
      <Route exact path="/reservation/:id" component={BookingConfirmation} />
      <Route exact path="/reservations" component={UserReservations} />
    </div>
  </Router>
);

export default Routes;
