import {
    RECEIVE_CURRENT_USER,
    RECEIVE_ERRORS
} from '../actions/session_actions';

const sessionErrorReducer = (state, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            
            break;
        case RECEIVE_ERRORS:

            break;
        default:
            return state;
    }
}

