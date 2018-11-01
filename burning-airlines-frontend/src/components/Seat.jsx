import React, {Component} from 'react';

class Seat extends Component {

  constructor(props) {
    super(props);
  }

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
    const seatWidthPercentage = `${(100 / this.props.numOfColumns) - 3}%`;
    const status = this.getSeatStatus();

    return (
      <div
        className={`seat ${status}`}
        row={this.props.row}
        column={this.props.column}
        style={{width: seatWidthPercentage}}
        onClick={this.props.onClick}>
        {status}
      </div>
    )
  }
}

export default Seat;
