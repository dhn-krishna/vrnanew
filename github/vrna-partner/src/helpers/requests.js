import axios from "axios";

const API_ROOT = process.env.REACT_APP_NODE_ENV === 'production'? process.env.REACT_APP_PROD_API_URL: process.env.REACT_APP_DEV_API_URL;

export const request = (method, url, payload=null, headers=1) => {
    console.log('headers',headers);
    let requestData = {
        method: method,
        url: API_ROOT + url
    }
    if(payload){
        requestData.data = payload;
        requestData.data['partner']= true;
    }
    
    if(headers === 1){
        var macAddress = 'dsflkjsal';
        if(localStorage.getItem('userEmail')!== null){
            var userEmail = localStorage.getItem('userEmail');
            var token = localStorage.getItem('token');
            requestData.headers = {
                'macAddress':macAddress,
                'userName':userEmail,
                'Authorization':token
            };
        }else{
            requestData.headers = {
                'macAddress':macAddress,
                'userName':payload.email
            };
        }
        
        
        // if(localStorage.getItem('token')!== null){
        //     requestData.headers['Authorization'] = localStorage.getItem('token');
        // }
        // requestData.headers['userName'] = payload.email;
        // requestData.headers['macAddress'] = macAddress;
    }else if(headers === 'multipart'){
        var macAddress = 'dsflkjsal';
        if(localStorage.getItem('userEmail')!== null){
            var userEmail = localStorage.getItem('userEmail');
            var token = localStorage.getItem('token');
            requestData.headers = {
                "Content-Type": "multipart/form-data",
                'macAddress':macAddress,
                'userName':userEmail,
                'Authorization':token
            };
        }else{
            requestData.headers = {
                "Content-Type": "multipart/form-data",
                'macAddress':macAddress,
                'userName':payload.email
            };
        }
    }
    return axios(requestData);
}