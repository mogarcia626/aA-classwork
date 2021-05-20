export const RECEIVE_TODO = 'RECEIVE_TODO';
export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const REMOVE_TODO = 'REMOVE_TODO';
// export const TODO_ERROR = 'TODO_ERROR';


export const receiveTodo = (todo) => {
    return {
        type: RECEIVE_TODO,
        todo,
    };
};

export const receiveTodos = todos => ( {
    type: RECEIVE_TODOS,
    todos    
});

export const removeTodo = todo => ({
    type: REMOVE_TODO,
    todo
})


window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.removeTodo = removeTodo;


