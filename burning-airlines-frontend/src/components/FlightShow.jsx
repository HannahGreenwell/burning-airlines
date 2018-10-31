import React, {Component} from 'react';

class FlightShow extends Component {
  renderSeatMap(row, column) {

  }

  render() {
    return (
      <div class="flight_show">
        <h2>FlightShow Component</h2>

        <p>3/18/13 Flight 09 JFK > SFO</p>

        <div className="seatmap-container">
          <div className="seatmap">

          </div>
        </div>
      </div>
    );
  }
}

export default FlightShow;
