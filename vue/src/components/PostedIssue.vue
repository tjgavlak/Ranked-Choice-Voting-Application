<template>
  <div class="posted-issue">
    <h1>TEST</h1>
    <br />
    <table>
      <thead>
        <tr>
          <th id="issue">Issue</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="issue-name">{{ issue.issueName }}</td>
        </tr>
        <tr>
          <th id="desc">Description</th>
        </tr>
        <tr>
          <td class="issue-desc">{{ issue.description }}</td>
        </tr>
        <tr>
          <th id="date-exp">Poll Closes On</th>
        </tr>
        <tr>
          <td class="date-time-exp">
            {{ issue.dateExpiration }} @ {{ issue.timeExpiration }}
          </td>
          <td>
            <button v-on:click="viewIssue(issue.issueId)">Add Choices</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import issuesService from "@/services/IssuesService";

export default {
  name: "posted-issue",
  data() {
    return {
      issue: {
        issueId: "",
        issueName: "",
        description: "",
        dateExpiration: "",
        timeExpiration: "",
      },
    };
  },
  mounted() {
    issuesService.mostRecentIssue().then((response) => {
      this.issue = response.data;
      console.log(this.issue);
    });
  },
  methods: {
    viewIssue(id) {
      this.$router.push(`/issues/choices/${id}`);
    },
  },
};
</script>

<style>
</style>