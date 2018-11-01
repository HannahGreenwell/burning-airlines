import React, {Component} from 'react';

class Seat extends Component {

  getSeatStatus() {
    let status = 'available';
    const seatString = `${this.props.row}${this.props.column}`;

    if (this.props.reservedSeats.some(rs => rs.join('') === seatString)) {
      status = 'reserved';
    }

    if (this.props.selectedSeat.join('') === seatString) {
      status = 'selected';
    }

    return status;
  }

  render() {
    const status = this.getSeatStatus();

    return (
      <div
        className={`seat ${status}`}
        row={this.props.row}
        column={this.props.column}
        onClick={this.props.onClick}>
        {status}
      </div>
    )
  }
}

export default Seat;
