import React from 'react'

class TodoListItem extends React.Component {
    constructor(props){
        super(props)
        this.toggleTodo = this.toggleTodo.bind(this);
    }

    toggleTodo(e) {
        e.preventDefault();
        const toggledTodo = Object.assign( {}, this.props.todo, { done: !this.props.todo.done });
    
        this.props.receiveTodo(toggledTodo);
    }

    render(){
        const todo = this.props.todo;
        const done = todo.done;
        return (
            <li className='todo-list-item'>
                {todo.title}
                <button className={ done ? "done" : "undone" }
                    onClick={ this.toggleTodo }>
                    { done ? "Undo" : "Done" }
                </button>
            </li>
        )
    }
    
}


export default TodoListItem;