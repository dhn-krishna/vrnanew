import http from "./http-common";

class ContentService {
  // Get ALl Contents Uploaded by Partner
  getAllContent(id) {
    return http.get(`content-service/movie/partner/${id}`);
  }

  // Get ALl Contents Details by Content ID
  get(id) {
    return http.get(`content-service/${id}`);
  }

  create(data) {
    return http.post("content-service/movie", data);
  }

  update(id, data) {
    return http.put(`content-service/${id}`, data);
  }

  delete(id) {
    return http.delete(`content-service/${id}`);
  }
}
export default new ContentService();