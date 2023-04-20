<template>
  <div class="active-issues">
    <h1>Active Issues</h1>
    <table>
      <thead>
        <tr>
          <th id="issues">Issue Name</th>
          <th id="poll-close">Voting Deadline</th>
          <th>Tag</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="issue in issues" :key="issue.issueId">
          <td class="issue-name">{{ issue.issueName }}&nbsp;&nbsp;&nbsp;</td>
          <td class="expiration-date">
            &nbsp;&nbsp;&nbsp;{{ formatDate(issue.dateExpiration) }}
            {{ issue.timeExpiration }}
          </td>
          <td>
            {{ issue.genreTag }}
          </td>
          <td>
            &nbsp;&nbsp;
            <button v-on:click="viewIssue(issue.issueId)">View Details 🔍</button>
          </td>
          <td>{{compareDates(issue.dateExpiration, issue.issueId)}}</td>
        </tr>
      </tbody>
    </table>
    <router-view />
  </div>
</template>

<script>
import issuesService from "@/services/IssuesService";

export default {
  name: "issues-list",
  data() {
    return {
      issues: [],
      issue: {
        issueId: "",
        issueName: "",
        description: "",
        dateExpiration: "",
        timeExpiration: "",
        genreTag: ""
      },
    };
  },
  created() {
    issuesService.listActive().then((response) => {
      this.issues = response.data;
    });
  },
  // mounted() {
  //   this.compareDates(this.issue.dateExpiration)
  // },
  methods: {
    loadIssues() {
      issuesService.listActive().then((response) => {
        this.issues = response.data;
      });
    },
    viewIssue(id) {
      this.$router.push(`/issues/active/${id}`);
    },
    formatDate(date) {
      let d = new Date(date),
        month = "" + (d.getMonth() + 1),
        day = "" + (d.getDate() + 1),
        year = d.getFullYear();

      if (month.length < 2) month = "0" + month;
      if (day.length < 2) day = "0" + day;

      const formatted = month + "/" + day + "/" + year;
      return formatted;
    },
    currentDate() {
      const currentDate = new Date();
      return currentDate;
    },
    compareDates(date, id) {
      const currentDate = new Date(); // get the current date
      const pollCloseDate = new Date(date); // create another date to compare with

      if (currentDate.getTime() > pollCloseDate.getTime()) {
        issuesService.moveToComplete(id)
        return("");
        //put method that updates status to 'completed'
      } else if (currentDate.getTime() < pollCloseDate.getTime()) {
        return("");
        //do nothing
      } else {
        return("The current date is the same as the other date.");
        //do nothing
      }
    },

    // ' @ ' + d.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });
  },
};
</script>

<style scoped>
</style>

