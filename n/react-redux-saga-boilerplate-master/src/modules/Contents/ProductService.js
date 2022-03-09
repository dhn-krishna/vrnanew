import axios from 'axios';

export default class ProductService {
  getContents() {
    return axios.get("/demo/products.json").then((res) => res.data.data);
  }
  getMovies() {
    return axios.get("http://ec2-3-21-100-59.us-east-2.compute.amazonaws.com:8081/content-service/movie/1").then((res) => res.data.data);
  }
}
