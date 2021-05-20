import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer'
import { receiveTodos } from '../actions/todo_actions';


const configureStore = (preloadedState = {}) => {
    const store = createStore(rootReducer, preloadedState);
    return store;
}



export default configureStore