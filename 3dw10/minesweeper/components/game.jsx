import React from 'react';
import Minesweeper from '../minesweeper';
import Board from './Board';

export default class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            board: new Minesweeper.Board
        }
        this.updateGame = this.updateGame.bind(this)
    };

    updateGame() {
//code here
    };

    render() {
        return (
            <Board board={this.state.board} updateGame={this.updateGame}/>
        )
    }
}