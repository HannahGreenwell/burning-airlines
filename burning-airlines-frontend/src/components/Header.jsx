import React from 'react';

function Header() {
  return (
    <div className="header">
    <h1>Burning Airlines</h1>
      <nav className="navbar">
        <form action="#/search">
            <input className="nav-button margin-right" type="submit" value="Search" />
        </form>
        <form action="#/reservations">
            <input className="nav-button margin-right" type="submit" value="My Bookings" />
        </form>
      </nav>
    </div>
  );
}

export default Header;
