import React, {Component} from 'react';

import Seat from './Seat';

class SeatMap extends Component {

  constructor(props) {
    super(props);
  }

  renderRowNumbers() {
    let rowNums = [];

    for (let i = 1; i <= this.props.numOfRows; i++) {
      rowNums.push(<div key={i}>{i}</div>);
    }

    return rowNums;
  }

  renderColumnNumbers() {
    const letters = '*abcdefghijklmnopqrstuvwxyz';
    let colNums = [];

    for (let i = 1; i <= this.props.numOfColumns; i++) {
      colNums.push(<div key={i}>{`${letters[i]}`}</div>);
    }

    return colNums;
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
      seatMap.push(<div className="row" key={i}>{seats}</div>);
    }

    return seatMap;
  }

  render() {
    return (
      <div className="seatmap">
        <div className="row-numbers">{this.renderRowNumbers()}</div>
        <div className="container">
          <div className="column-numbers">{this.renderColumnNumbers()}</div>
          {this.renderSeatMap()}
        </div>
      </div>
    );
  }
}

export default SeatMap;
