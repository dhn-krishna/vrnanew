import { put, all, call, takeLatest } from "redux-saga/effects";
import { request } from '../../helpers/requests';
import { browserRedirect } from '../../helpers/helpers';
import { urls } from '../../helpers/urls';
import {
  LOGIN_REQUESTING,
  loginSuccess,
  loginError,
} from "./actions";

//Login API call
function loginCall(payload) {
  return request('post', urls.LOGIN_URL, payload);
}

// LOGIN Worker
function* loginWorker({ payload }) {
  try {
    let response = yield call(loginCall, payload);
    console.log('test');
    console.log(response);
    response = response.data;
    // localStorage.removeItem('user');
    localStorage.setItem('token', response.data.token);
    localStorage.setItem('userId', response.data.userId);
    localStorage.setItem('userEmail', response.data.email);
    localStorage.setItem(
      'user',
      JSON.stringify({
        userId: response.data.userId,
        email: response.data.email,
        adminStatus: response.data.admin
      }),
    );
   yield put(loginSuccess());
   yield call(browserRedirect, '/');
  } catch (err) {
    yield put(loginError(err.response.data));
  }
}

// function* onChangeData({payload}){
//   yield  put(onchange(payload));
// }
// Login Watcher
export default function* loginSaga() {
  yield all([
    takeLatest(LOGIN_REQUESTING, loginWorker),
  ]);
}