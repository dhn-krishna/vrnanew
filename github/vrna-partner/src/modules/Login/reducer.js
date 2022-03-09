import {
    LOGIN_PAGE_INIT,
    LOGIN_ERROR,
    LOGIN_REQUESTING,
    LOGIN_SUCCESS,
    ON_CHANGE,
} from './actions';

// The initial state of the Login Reducer
export const initialState = {
    id: '',
    email: '',
    password: '',
    requesting: false,
    successful: false,
    messages: [],
    errors: {},
  };

export default function(state = initialState,actions){
    switch(actions.type){
        case ON_CHANGE:
            return{...state,[actions.payload.name]:actions.payload.value};
        case LOGIN_PAGE_INIT:
        return {...state, errors:{}};
        case LOGIN_REQUESTING:
            return {...state, requesting: true};
        case LOGIN_SUCCESS:
            return {...state, successful: true, user:{...actions.payload}};
        case LOGIN_ERROR:
            return {...state, successful: false, errors:{...actions.error}};
        default:        
            return state;
    }
}