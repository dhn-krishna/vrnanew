export const CONTENT_LIST_REQUESTING = 'CONTENT_LIST_REQUESTING';
export const CONTENT_LIST_SUCCESS = 'CONTENT_LIST_SUCCESS';
export const CONTENT_LIST_ERROR = 'CONTENT_LIST_ERROR';
export const CONTENT_PAGE_INIT = 'CONTENT_PAGE_INIT';
export const ON_CHANGE = 'ON_CHANGE';

export function contentPageInit() {
    return {
        type: CONTENT_PAGE_INIT,
    };
}

export function onChange(payload) {
    return {
        type:ON_CHANGE,
        payload
    }
}

export function contentListRequest() {
    return {
        type: CONTENT_LIST_REQUESTING
        //payload
    };
}

export function contentListError(error) {
    return {
        type: CONTENT_LIST_ERROR,
        error,
    };
}

export function contentListSuccess(payload) {
    return {
        type: CONTENT_LIST_SUCCESS,
        payload
    };
}