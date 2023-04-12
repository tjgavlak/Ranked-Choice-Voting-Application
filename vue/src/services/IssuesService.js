import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:9000"
});

export default {
    list() {
        return http.get('/issues')
    },
    details(id) {
        return http.get(`/issues/${id}`)
    }
}