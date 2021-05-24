import { combineReducers } from 'redux';
import todoReducer from './todo_reducer';
import stepReducer from './step_reducer';

const rootReducer = combineReducers({
    todos: todoReducer,
    steps: stepReducer
})

export default rootReducer;