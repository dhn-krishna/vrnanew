import { put, all, call, takeLatest } from "redux-saga/effects";
import { request } from '../../helpers/requests';
import { browserRedirect } from '../../helpers/helpers';
import { urls } from '../../helpers/urls';
import {
  CONTENT_ADD_REQUESTING,
  CONTENT_ADD_POSTER,
  CONTENT_ADD_BANNER,
  contentAddSuccess,
  addContentBannerSuccess,
  addContentBannerError,
  addContentPosterSuccess,
  addContentPosterError,
  contentAddError,
} from "./actions";
//API call
function addContentCall({payload}) {
  return request('post', urls.CONTENT_ADD_URL, payload);
}

function addContentPosterCall({payload}){
  return request('post', urls.CONTENT_ADD_POSTER, payload,'multipart');
}

function addContentBannerCall({payload}){
  return request('post', urls.CONTENT_ADD_BANNER, payload,'multipart');
}
// LOGIN Worker
function* addContentWorker(payload) {
  try {
    let response = yield call(addContentCall, payload);
    console.log('test');
    console.log(response);
    response = response.data;
    // localStorage.removeItem('user');
    // localStorage.setItem('token', response.data.token);
    // localStorage.setItem('userId', response.data.userId);
    // localStorage.setItem('userEmail', response.data.email);
    // localStorage.setItem(
    //   'user',
    //   JSON.stringify({
    //     userId: response.data.userId,
    //     email: response.data.email,
    //     adminStatus: response.data.admin
    //   }),
    // );
   yield put(contentAddSuccess());
  //  yield call(browserRedirect, '/');
  } catch (err) {
    yield put(contentAddError(err.response.data));
  }
}

function* addContentPosterWorker(payload) {
  try {
    let response = yield call(addContentPosterCall, payload);
    console.log('test');
    console.log(response);
    response = response.data;
    // localStorage.removeItem('user');
    // localStorage.setItem('token', response.data.token);
    // localStorage.setItem('userId', response.data.userId);
    // localStorage.setItem('userEmail', response.data.email);
    // localStorage.setItem(
    //   'user',
    //   JSON.stringify({
    //     userId: response.data.userId,
    //     email: response.data.email,
    //     adminStatus: response.data.admin
    //   }),
    // );
    yield put(addContentPosterSuccess(response));
    //  yield call(browserRedirect, '/');
    } catch (err) {
      yield put(addContentPosterError(err.response.data));
    }
}

function* addContentBannerWorker(payload) {
  try {
    let response = yield call(addContentBannerCall, payload);
    console.log('test');
    console.log(response);
    response = response.data;
    // localStorage.removeItem('user');
    // localStorage.setItem('token', response.data.token);
    // localStorage.setItem('userId', response.data.userId);
    // localStorage.setItem('userEmail', response.data.email);
    // localStorage.setItem(
    //   'user',
    //   JSON.stringify({
    //     userId: response.data.userId,
    //     email: response.data.email,
    //     adminStatus: response.data.admin
    //   }),
    // );
    yield put(addContentBannerSuccess(response));
    //  yield call(browserRedirect, '/');
    } catch (err) {
      yield put(addContentBannerError(err.response.data));
    }
}


// function* onChangeData({payload}){
//   yield  put(onchange(payload));
// }
// Login Watcher
export default function* addContentSaga() {
  yield all([
    takeLatest(CONTENT_ADD_REQUESTING, addContentWorker),
    takeLatest(CONTENT_ADD_POSTER,addContentPosterWorker),
    takeLatest(CONTENT_ADD_BANNER,addContentBannerWorker)
  ]);
}