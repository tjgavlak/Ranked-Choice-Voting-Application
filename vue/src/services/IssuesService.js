import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:9000"
});

export default {
    listActive() {
        return http.get('/issues/active')
    },
    listCompleted() {
        return http.get('/issues/completed')
    },
    details(id) {
        return http.get(`/issues/${id}`)
    },
    submitIssue(payload) {
        return http.post(`/issues`, payload)
    },
    submitChoices(payload) {
        return http.post(`/issues/choices`, payload)
    },
    choiceDetails(id) {
        return http.get(`/issues/${id}/choices`)
    },
    rankedChoices(id){
        return http.get(`/issues/${id}/choices/ranked`)
    }
    
}