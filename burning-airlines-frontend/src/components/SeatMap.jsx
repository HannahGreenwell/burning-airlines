import React, {Component} from 'react';

import Seat from './Seat';

class SeatMap extends Component {

  constructor(props) {
    super(props);
  }

  renderSeatMap() {
    let seatMap = [];

    for (let i = 1; i <= this.props.numOfRows; i++) {
      let seats = [];

      for (let j = 1; j <= this.props.numOfColumns; j++) {
        seats.push(
          <Seat
            row={i}
            column={j}
            reservedSeats={this.props.reservedSeats}
            selectedSeat={this.props.selectedSeat}
            numOfColumns={this.props.numOfColumns}
            onClick={() => this.props.onClick(i, j)}
            key={`${i}-${j}`}
          />
        );
      }
      seatMap.push(<div className="row">{seats}</div>);
    }

    return seatMap;
  }

  render() {
    return (
      <div className="seatmap">
        {this.renderSeatMap()}
      </div>
    );
  }
}

export default SeatMap;
