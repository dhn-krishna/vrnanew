import {
    // LOGIN_PAGE_INIT,
    CONTENT_LIST_ERROR,
    CONTENT_LIST_REQUESTING,
    CONTENT_LIST_SUCCESS,
    CONTENT_PAGE_INIT,
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
    data:null,
    errors: {},
  };

export default function(state = initialState,actions){
    switch(actions.type){
        case ON_CHANGE:
            return{...state,[actions.payload.name]:actions.payload.value};
        case CONTENT_PAGE_INIT:
        return {...state, errors:{}};
        case CONTENT_LIST_REQUESTING:
            return {...state, requesting: true};
        case CONTENT_LIST_SUCCESS:
            return {...state, successful: true, data:{...actions.payload}};
        case CONTENT_LIST_ERROR:
            return {...state, successful: false, errors:{...actions.error}};
        default:        
            return state;
    }
}