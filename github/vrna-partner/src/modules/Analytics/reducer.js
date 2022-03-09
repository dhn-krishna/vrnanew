import {
    // LOGIN_PAGE_INIT,
    ANALYTICS_ERROR,
    ANALYTICS_REQUESTING,
    ANALYTICS_SUCCESS,
    ANALYTICS_PAGE_INIT,
    ON_CHANGE,
} from './actions';

// The initial state of the Login Reducer
export const initialState = {
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
        case ANALYTICS_PAGE_INIT:
        return {...state, errors:{}};
        case ANALYTICS_REQUESTING:
            return {...state, requesting: true};
        case ANALYTICS_SUCCESS:
            return {...state, successful: true, data:{...actions.payload}};
        case ANALYTICS_ERROR:
            return {...state, successful: false, errors:{...actions.error}};
        default:        
            return state;
    }
}