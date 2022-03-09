import {
    // LOGIN_PAGE_INIT,
    CONTENT_ADD_ERROR,
    CONTENT_ADD_REQUESTING,
    CONTENT_ADD_SUCCESS,
    CONTENT_ADD_PAGE_INIT,
    CONTENT_ADD_BANNER,
    CONTENT_ADD_BANNER_SUCCESS,
    CONTENT_ADD_BANNER_ERROR,
    CONTENT_ADD_POSTER_ERROR,
    CONTENT_ADD_POSTER,
    CONTENT_ADD_POSTER_SUCCESS,
    ON_CHANGE,
} from './actions';

// The initial state of the Login Reducer
export const initialState = {
    activeIndex:0,
    moviename: "",
    country: "",
    year: null,
    certification: "",
    description: "",
    posterurl: "",
    posterUrlData: "",
    trailerurl: "",
    filepath: "",
    moviebannerurl: "",
    language: "",
    producer: [],
    director: [],
    cast: [],
    musicdirector: [],
    genre: [],
    partnerId: 2,   
    requesting: false,
    successful: false,
    messages: [],
    errors: {},
  };

export default function(state = initialState,actions){
    switch(actions.type){
        case ON_CHANGE:
            return{...state,[actions.payload.name]:actions.payload.value};
        case CONTENT_ADD_PAGE_INIT:
        return {...state, errors:{}};
        case CONTENT_ADD_REQUESTING:
            return {...state, requesting: true};
        case CONTENT_ADD_SUCCESS:
            return {...state, successful: true, user:{...actions.payload}};
        case CONTENT_ADD_ERROR:
            return {...state, successful: false, errors:{...actions.error}};
        case CONTENT_ADD_POSTER:
            return {...state, requesting: true};
        case CONTENT_ADD_POSTER_SUCCESS:
            return {...state, successful: true, posterUrlData:actions.payload.data};
        case CONTENT_ADD_POSTER_ERROR:
            return {...state, successful: false, errors:{...actions.error}};
        case CONTENT_ADD_BANNER:
            return {...state, requesting: true};
        case CONTENT_ADD_BANNER_SUCCESS:
            return {...state, successful: true, moviebannerurl:[...actions.payload.data]};
        case CONTENT_ADD_BANNER_ERROR:
            return {...state, successful: false, errors:{...actions.error}};
        default:        
            return state;
    }
}