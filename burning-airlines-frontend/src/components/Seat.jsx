import React, {Component} from 'react';

class Seat extends Component {

  constructor(props) {
    super(props);


  }

  renderSeat(row, column) {
    // const seatWidthPercentage = `${(100 / this.state.columns) - 1}%`;
    const seatWidthPercentage = `24%`;
    let text = 'avail';
    let className = 'seat avail';

    if (this.state.reservedSeats.includes([parseInt(row), parseInt(column)])) {
      text = '';
      className = 'seat reserved';
    }

    return (
      <div
        className={className}
        row={row}
        column={column}
        style={{width: seatWidthPercentage}}
      >
      {text}
      </div>
    );
  }
}

export default Seat;
