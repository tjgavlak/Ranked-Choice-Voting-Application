import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:9000"
});

export default {
    listActive() {
        return http.get('/issues/active')
    },
    listPending() {
        return http.get('/issues/pending')
    },
    details(id) {
        return http.get(`/issues/${id}`)
    },
    submitForm(payload) {
        return http.post(`/issues`, payload)
    }
}