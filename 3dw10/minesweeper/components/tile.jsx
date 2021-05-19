import React from "react";

export default class Tile extends React.Component {
  constructor(props) {
    super(props)

  }

  render () {
    return (
      <div className="inTile">
        {console.log("in Tile")}
        <p>T</p>
      </div>
    )
  }
}