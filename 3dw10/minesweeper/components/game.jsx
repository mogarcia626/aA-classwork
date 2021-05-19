import React from 'react';
import {Board as Minefield} from '../minesweeper';
import Board from './board';
import Tile from './tile';

export default class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            board: new Minefield(9, 5)
        }
        this.updateGame = this.updateGame.bind(this)
    };

    updateGame() {
      //code here
    };

    render() {
        return (
          <div className="inGame">
            {console.log("in game")}
            <Board board={this.state.board} updateGame={this.updateGame}/>
          </div>
        )
    }
}