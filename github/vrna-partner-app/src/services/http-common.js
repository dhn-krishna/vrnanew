import axios from "axios";

export default axios.create({
  baseURL: "http://ec2-3-21-100-59.us-east-2.compute.amazonaws.com:8081/",
  headers: {
    "Content-type": "application/json",
  },
});
