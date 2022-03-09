import { all } from "redux-saga/effects";
import loginSaga from "../Login/saga";
import registerSaga from "../Register/saga";
import bookSaga from "../Book/saga";
import cotentSaga from "../Contents/saga";
import addContentSaga from "../AddContent/saga";
import analyticsSaga from "../Analytics/saga";

export function* mainSaga() {
  yield all([
    loginSaga(),
    cotentSaga(),
    addContentSaga(),
    analyticsSaga(),
    registerSaga(),
    bookSaga()
  ]);
}