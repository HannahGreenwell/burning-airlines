import React from 'react';

function Header() {
  return (
    <div className="header">
      <nav className="navbar">
        <ul className="navbar-items">
          <li className="nav-item">
            <a className="nav-link" href="#/search">Search</a>
          </li>
          <li className="nav-item">
            <a className="nav-link" href="#/bookings">My Bookings</a>
          </li>
        </ul>
      </nav>

      <h1>Burning Airlines</h1>
    </div>
  );
}

export default Header;
