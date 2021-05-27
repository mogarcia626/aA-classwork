import React from 'react';
// import {Board as MineSweeper.Board} from '../minesweeper';
import Board from './board';
import Tile from './tile';
import * as MineSweeper from  '../minesweeper';

export default class Game extends React.Component {
    constructor(props) {
        super(props);
        const newBoard = new MineSweeper.Board(9,5);
        this.state = {
            board: newBoard
        }
        this.updateGame = this.updateGame.bind(this);
        this.resetGame = this.resetGame.bind(this);
    };

    updateGame(tile, altHeld) {

      if (altHeld) {
        tile.toggleFlag();
      } else {
        tile.explore();
      }


      this.setState({board: this.state.board});
      
    };

    resetGame() {
        let newBoard = new MineSweeper.Board(5, 10);
        this.setState({ board: newBoard });
        console.log(this.state.board)
    }

    render() {
        let modal = null
        if (this.state.board.won() || this.state.board.lost()) {
            modal = 
            <div className="modal is-open">
                <div className="modal-screen"></div>
                <div className="modal-form">
                    <button className="js-modal-close" onClick={this.resetGame}>Reset Game</button>
                </div>
            </div>;
        }
        

            
        return (
          <div className="inGame">
            <h1>Welcome to PoopSweeper!💩</h1>
            <h2>Use Alt-Click to place 🚽</h2>
            <h2>🙏🚽💥🙏🚽</h2>
            {modal}           
            <button onClick={this.resetGame}>Reset Game</button>
            <Board board={this.state.board} updateGame={this.updateGame}/>

          </div>
        )
    }
}


{/* <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
        $(function () {

      $("body").on("click", ".js-modal-close", function (event) {
        event.preventDefault();
        $(".modal").removeClass("is-open");
      });

    });
  </script> */}

// unrevealed tile on CSS
// empty tile on CSS
// flag -> place flag '🤞🚽 '
// bomb -> reveal other bombs '💩'
// explosions -> you lose '💥'
// one '🤏☝ '
// two '✌'
// three '👌'
// four+ '🙏'