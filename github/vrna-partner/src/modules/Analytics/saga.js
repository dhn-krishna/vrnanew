import { put, all, call, takeLatest } from "redux-saga/effects";
import { request } from '../../helpers/requests';
import { browserRedirect } from '../../helpers/helpers';
import { urls } from '../../helpers/urls';
import {
  ANALYTICS_REQUESTING,
  analyticsSuccess,
  analyticsError,
} from "./actions";

//Login API call
function analyticsCall() {
  var userId = localStorage.getItem('userId');
  return request('get', urls.ANALYTICS_URL+'/revenue?movieId=0&partnerId='+userId,null);
}

// LOGIN Worker
function* analyticsWorker() {
  try {
    let response = yield call(analyticsCall);
    console.log('test');
    console.log(response);
    // response = response.data;
    // localStorage.removeItem('user');
    //localStorage.setItem('token', response.data.token);
    // localStorage.setItem(
    //   'user',
    //   JSON.stringify({
    //     userId: response.data.userId,
    //     email: response.data.email,
    //     adminStatus: response.data.admin
    //   }),
    // );
   yield put(analyticsSuccess(response));
   //yield call(browserRedirect, '/');
  } catch (err) {
    yield put(analyticsError(err.response.data));
  }
}

// function* onChangeData({payload}){
//   yield  put(onchange(payload));
// }
// Login Watcher
export default function* analyticsSaga() {
  yield all([
    takeLatest(ANALYTICS_REQUESTING, analyticsWorker),
  ]);
}