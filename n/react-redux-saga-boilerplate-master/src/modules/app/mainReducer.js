import { combineReducers } from "redux";
import loginReducer from "../Login/reducer";
import registerReducer from "../Register/reducer";
import bookReducer from "../Book/reducer";
import contentsReducer from "../Contents/reducer";
import addContentReducer from "../AddContent/reducer";
import analyticsReducer from "../Analytics/reducer";

export const mainReducer = combineReducers({
  login: loginReducer,
  content: contentsReducer,
  addContent: addContentReducer,
  register: registerReducer,
  analytics: analyticsReducer,
  books: bookReducer
});
