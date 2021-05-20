import configureStore from './store/store';
import {receiveTodos} from './actions/todo_actions.js';
// import React from 'react';
// import ReactDOM from 'react-dom';

document.addEventListener("DOMContentLoaded", function(){
    console.log('in event listener')
    const store = configureStore();
    window.store = store;
    window.store.getState(); 
    const root = document.getElementById('root');
});


// const newTodos = [{ id: 1, ...etc }, { id: 2, ...etc }, ...etc];
// store.getState(); // should return default state object
// store.dispatch(receiveTodo({ id: 3, title: "New Todo" }));
// store.getState(); // should include the newly added todo
// store.dispatch(receiveTodos(newTodos));
// store.getState(); // should return only the new todos

// const newTodos = [{id: 1, title:'homework'}, {id:2, title:'reading'}, {id:3, title:'exercise'}];