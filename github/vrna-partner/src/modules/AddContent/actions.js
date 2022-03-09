export const CONTENT_ADD_REQUESTING = 'CONTENT_ADD_REQUESTING';
export const CONTENT_ADD_SUCCESS = 'CONTENT_ADD_SUCCESS';
export const CONTENT_ADD_ERROR = 'CONTENT_ADD_ERROR';
export const CONTENT_ADD_PAGE_INIT = 'CONTENT_ADD_PAGE_INIT';
export const CONTENT_ADD_POSTER = 'CONTENT_ADD_POSTER';
export const CONTENT_ADD_POSTER_SUCCESS = 'CONTENT_ADD_POSTER_SUCCESS';
export const CONTENT_ADD_POSTER_ERROR = 'CONTENT_ADD_POSTER_ERROR';
export const CONTENT_ADD_BANNER = 'CONTENT_ADD_BANNER';
export const CONTENT_ADD_BANNER_SUCCESS = 'CONTENT_ADD_BANNER_SUCCESS';
export const CONTENT_ADD_BANNER_ERROR = 'CONTENT_ADD_BANNER_ERROR';
export const ON_CHANGE = 'ON_CHANGE';

export function contentPageAddInit() {
    return {
        type: CONTENT_ADD_PAGE_INIT,
    };
}

export function onChange(payload) {
    return {
        type:ON_CHANGE,
        payload
    }
}

export function addContentRequest(payload) {
    return {
        type: CONTENT_ADD_REQUESTING,
        payload
    };
}

export function addContentPosterRequest(payload){
    return{
        type:CONTENT_ADD_POSTER,
        payload
    }
}

export function addContentPosterSuccess(payload){
    return{
        type:CONTENT_ADD_POSTER_SUCCESS,
        payload
    }
}

export function addContentPosterError(payload){
    return{
        type:CONTENT_ADD_POSTER_ERROR,
        payload
    }
}

export function addContentBannerRequest(payload){
    return{
        type:CONTENT_ADD_BANNER,
        payload
    }
}
export function addContentBannerSuccess(payload){
    return{
        type:CONTENT_ADD_BANNER_SUCCESS,
        payload
    }
}

export function addContentBannerError(payload){
    return{
        type:CONTENT_ADD_BANNER_ERROR,
        payload
    }
}

export function contentAddError(error) {
    return {
        type: CONTENT_ADD_ERROR,
        error,
    };
}

export function contentAddSuccess() {
    return {
        type: CONTENT_ADD_SUCCESS,
    };
}