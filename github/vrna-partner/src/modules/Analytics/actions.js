export const ANALYTICS_REQUESTING = 'ANALYTICS_REQUESTING';
export const ANALYTICS_SUCCESS = 'ANALYTICS_SUCCESS';
export const ANALYTICS_ERROR = 'ANALYTICS_ERROR';
export const ANALYTICS_PAGE_INIT = 'ANALYTICS_PAGE_INIT';
export const ON_CHANGE = 'ON_CHANGE';

export function AnalyticsPageInit() {
    return {
        type: ANALYTICS_PAGE_INIT,
    };
}

export function onChange(payload) {
    return {
        type:ON_CHANGE,
        payload
    }
}

export function analyticsRequest() {
    return {
        type: ANALYTICS_REQUESTING
        //payload
    };
}

export function analyticsError(error) {
    return {
        type: ANALYTICS_ERROR,
        error,
    };
}

export function analyticsSuccess(payload) {
    return {
        type: ANALYTICS_SUCCESS,
        payload
    };
}