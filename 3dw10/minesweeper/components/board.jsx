import React from "react";
import Tile from "./tile";

export default class Board extends React.Component {
  constructor(props) {
    super(props)
    // props = {board: new Minefield, updateGame: updateGame()}
  }


  render () {
    const mappedBoard = this.props.board.grid.map((row, rowIdx) => {
      return( 
        <div className="tileRow">{
        row.map((col, colIdx) => {
        return <Tile tile={col} updateGame={this.props.updateGame} key={colIdx}/> 
        }) 
         }</div>
      )
    })

    console.log(mappedBoard)

    return (
      <div className="inBoard">
        {console.log("in Board")}
        {mappedBoard}
      </div>
    )
  }
}