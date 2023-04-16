// import IssuesService from "../services/IssuesService";

// const currentIssue = localStorage.getItem('issue');
// const currentChoice = localStorage.getItem('option');

// export default {
//     state: {
//         latest: null,
//         issue: currentIssue || {
//             issueId: "",
//             issueName: "",
//             description: "",
//             dateExpiration: "",
//             timeExpiration: "",
//             genreTag: "",
//         },
//         option: currentChoice || {}
//     },
//     mutations: {
//         ADD_CHOICE(state, option) {
//             state.option = option;
//             localStorage.setItem('option', option);
//         },
//         GET_LATEST_ID(state, id) {
//             state.latest = id;
//         }
//     },
//     actions: {
//         getTheId({ commit }) {
//             IssuesService.mostRecentIssueId().then(id => {
//                 commit("GET_LATEST_ID", id)
//             })
//         }
//     },
// };
