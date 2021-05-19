import React from "react";

export default class Tile extends React.Component {
  constructor(props) {
    super(props)
    this.tile = this.props.tile;
    this.state = {
      bombed: this.tile.bombed,
      revealed: this.tile.explored,
      bombCount: this.tile.adjacentBombCount(),
      flagged: this.tile.flagged
    };
  }

  render () {
    let currentTile = null;
    if (!this.state.revealed) {
      currentTile = <p className="unrevealed-tile"></p>;
    } else if (this.state.bombed) {
      currentTile = <p className="emoji bombed">'💩'</p>;
    } else if (this.state.bombCount > 0) {
      switch (this.state.combCount) {
        case 1:
          currentTile = <p className="emoji revealed">'🤏'</p>;
          break;
        case 2:
          currentTile = <p className="emoji revealed">'✌'</p>;
          break;
        case 3:
          currentTile = <p className="emoji revealed">'👌'</p>;
          break;
        default: 
          currentTile = <p className="emoji revealed">'🙏'</p>;
          break;
      }
    } else if (this.state.flagged) {
      currentTile = <p className="emoji flagged">'🚽'</p>;
    }

    return (
      <div className="inTile">
        {console.log("in Tile")}
        {currentTile}
      </div>
    )
  }
}

// unrevealed tile on CSS
// empty tile on CSS
// flag -> place flag '🤞🚽'
// bomb -> reveal other bombs '💩'
// explosions -> you lose '💥'
// one '🤏'
// two '✌'
// three '👌'
// four+ '🙏'


// Revealed          UnRevealed



// BOMB        Empty       BombAdjacent
