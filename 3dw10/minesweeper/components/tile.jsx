import React from "react";

export default class Tile extends React.Component {
  constructor(props) {
    super(props)
    this.tile = this.props.tile;

  }

  render () {
    let currentTile = null;

    if (this.tile.flagged) {
      currentTile = <p className="flagged tile">🚽</p>;

    } else if (!this.tile.explored) {
      currentTile = <p className="unrevealed tile"></p>;

    } else if (this.tile.bombed) {
      currentTile = <p className="bombed tile revealed">💩</p>;

    } else if (this.tile.adjacentBombCount() > 0) {
      switch (this.tile.adjacentBombCount()) {
        case 1:
          currentTile = <p className="revealed tile">☝</p>;
          break;
        case 2:
          currentTile = <p className="revealed tile">✌</p>;
          break;
        case 3:
          currentTile = <p className="revealed tile">👌</p>;
          break;
        default: 
          currentTile = <p className="revealed tile">🙏</p>;
          break;
      }
    } else {
      currentTile = <p className="revealed tile"></p>
    }

    return (
      <div className="inTile">
        <span onClick={(e) => this.props.updateGame(this.tile, e.altKey)}>{currentTile}</span>
      </div>
    )
  }
}

// unrevealed tile on CSS
// empty tile on CSS
// flag -> place flag '🤞🚽 '
// bomb -> reveal other bombs '💩'
// explosions -> you lose '💥'
// one '🤏☝ '
// two '✌'
// three '👌'
// four+ '🙏'


// Revealed          UnRevealed



// BOMB        Empty       BombAdjacent
