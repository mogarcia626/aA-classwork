import React from 'react';
import TodoListItem from './todo_list_item'
import TodoForm from './todo_form.jsx'

class TodoList extends React.Component {
    render() {
        const todos = this.props.todos;
        const receiveTodo = this.props.receiveTodo
        const todoItems = todos.map(todo => {
            return (
            <TodoListItem key={`todo-item${todo.id}`} todo= {todo} receiveTodo = {receiveTodo}/>
        )})
            
        
        
        return(
            <div>
                <ul className='todo-list'>
                    { todoItems }
                </ul>
                <TodoForm receiveTodo={receiveTodo} />
            </div>
        )

    }
}

// export default TodoList 
export default TodoList;
