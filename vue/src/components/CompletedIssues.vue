<template>
  <div class="active-issues">
    <h1>Closed Polls</h1>
    <table>
      <thead>
        <tr>
          <th id="issues">Issues</th>&nbsp;
          <th id="poll-close">Poll Closes</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="issue in issues" :key="issue.issueId">
          <td class="issue-name">{{ issue.issueName }}&nbsp;&nbsp;&nbsp;</td>
          <td class="expiration-date">
            &nbsp;&nbsp;&nbsp;{{ formatDate(issue.dateExpiration) }}
          </td>
          <td class="expiration-time">
            {{ issue.timeExpiration }}
          </td>
          <td>
            &nbsp;&nbsp;
            <button v-on:click="viewIssue(issue.issueId)">Show Results 🏅</button>
          </td>
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
      },
    };
  },
  created() {
    issuesService.listCompleted().then((response) => {
      this.issues = response.data;
    });
  },
  methods: {
    loadIssues() {
      issuesService.listCompleted().then((response) => {
        this.issues = response.data;
      });
    },
    viewIssue(id) {
      this.$router.push(`/issues/completed/${id}`);
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

    // ' @ ' + d.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });
  },
};
</script>

<style scoped>

</style>