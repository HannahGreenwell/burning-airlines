import React, {Component} from 'react';

class FlightShow extends Component {

  constructor() {
    super();

    this.state = {
      rows: 4,
      columns: 2,
    };
  }

  renderSeatMap() {
    // console.log('Rows: ', this.state.rows);
    // console.log('Columns: ', this.state.columns);

    let seatMap = [];

    for (let i = 0; i < this.state.rows; i++) {
      let seats = [];
      for (let j = 0; j < this.state.columns; j++) {
        seats.push(<div className="seat" row={i} column={j}>avail</div>);
      }
      seatMap.push(<div className="row">{seats}</div>);
    }

    return seatMap;
  }

  render() {
    return (
      <div className="flight_show">
        <h2>FlightShow Component</h2>

        <p>3/18/13 Flight 09 JFK > SFO</p>

        <div className="seatmap-container">
          <div className="seatmap">
            {this.renderSeatMap()}
          </div>
        </div>
      </div>
    );
  }
}

export default FlightShow;
