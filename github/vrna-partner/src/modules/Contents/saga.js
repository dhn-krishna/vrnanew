import { put, all, call, takeLatest } from "redux-saga/effects";
import { request } from '../../helpers/requests';
import { browserRedirect } from '../../helpers/helpers';
import { urls } from '../../helpers/urls';
import {
  CONTENT_LIST_REQUESTING,
  contentListSuccess,
  contentListError,
} from "./actions";

//Login API call
function contentListCall() {
  var userId = localStorage.getItem('userId');
  return request('get', urls.CONTENT_LIST_URL+'/'+userId,null);
}

// LOGIN Worker
function* contentListWorker() {
  try {
    let response = yield call(contentListCall);
    console.log('test');
    console.log(response);
    // response = response.data;
    // localStorage.removeItem('user');
    localStorage.setItem('token', response.data.token);
    // localStorage.setItem(
    //   'user',
    //   JSON.stringify({
    //     userId: response.data.userId,
    //     email: response.data.email,
    //     adminStatus: response.data.admin
    //   }),
    // );
   yield put(contentListSuccess(response));
   //yield call(browserRedirect, '/');
  } catch (err) {
    yield put(contentListError(err.response.data));
  }
}

// function* onChangeData({payload}){
//   yield  put(onchange(payload));
// }
// Login Watcher
export default function* cotentSaga() {
  yield all([
    takeLatest(CONTENT_LIST_REQUESTING, contentListWorker),
  ]);
}