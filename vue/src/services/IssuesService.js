import axios from 'axios';

export default {

    list() {
        return axios.get('/issues')
    }
}