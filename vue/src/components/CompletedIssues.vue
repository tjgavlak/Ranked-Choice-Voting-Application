<template>
  <div class="active-issues">
    <header><img src="@/assets/FTR_Black.png" /></header>
    <br /><br />
    <table>
      <thead>
        <tr>
          <th id="issues">Issues</th>
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
          <td class="issue-id">
            {{ issue.issueId }}
          </td>
          <td>
            &nbsp;&nbsp;
            <button v-on:click="viewIssue(issue.issueId)">Show Results</button>
          </td>
        </tr>
      </tbody>
    </table>
    <router-view /> <!-- need to read up on router-view -->
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
      //TODO todo doesn't work in vscode
    },
    formatDate(date) {
      let d = new Date(date),
        month = "" + (d.getMonth() + 1),
        day = "" + d.getDate(),
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
th {
  color: #6f5643;
}

td {
  color: #6f5643;
}
</style>

