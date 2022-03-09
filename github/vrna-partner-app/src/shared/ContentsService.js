import axios from "axios";

class CustomerService {
  getCustomersLarge() {
    return axios.get("assets/data/customers-large.json").then((res) => console.log('test'));
  }
}
export default CustomerService;