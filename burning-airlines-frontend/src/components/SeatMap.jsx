import React, {Component} from 'react';

// import Seat from './Seat';

class SeatMap extends Component {

  constructor(props) {
    super(props);
  }

  isSeatReserved(seat) {
    return this.props.reservedSeats.some(rs => rs.join('') === seat.join(''));
  }

  renderSeat(row, column) {
    const seatWidthPercentage = `${(100 / this.props.numOfColumns) - 3}%`;
    let text = 'Available';
    let className = 'seat available';

    if (this.isSeatReserved([parseInt(row), parseInt(column)])) {
      text = 'Reserved';
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

  renderSeatMap() {
    let seatMap = [];

    for (let i = 1; i <= this.props.numOfRows; i++) {
      let seats = [];

      for (let j = 1; j <= this.props.numOfColumns; j++) {
        seats.push(
          this.renderSeat(i, j)
          // <Seat row={i} column={j} />
          // <div>{`${i}-${j}`}</div>
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
