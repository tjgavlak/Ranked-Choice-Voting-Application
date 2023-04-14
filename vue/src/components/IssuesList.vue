<template>
  <div class="active-issues">
    <header><img src="@/assets/image.png" /></header>
    <table>
      <thead>
        <tr>
          <th>Issues</th>
          <th>Poll Closes</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="issue in issues" :key="issue.issueId">
          <td class="issue-name">{{ issue.issueName }}</td>
          <td class="expiration-date">{{ formatDate(issue.dateExpiration) }}</td>
          <td>
            <button v-on:click="viewIssue(issue.issueId)">Vote!</button>
          </td>
        </tr>

        <!-- <tr v-for="issue in issues" :key="issue.issueId">
          <td class="name">{{ issue.name }}</td> -->
        <!-- <router-link
            v-bind:to="{
              name: 'Description',
              params: { issueId: issue.issueId },
            }"
            >{{ issue.description }}</router-link
          >
          <td class="description">{{ issue.description }}</td>
          <td>
            <button>Edit</button>&nbsp;
            <button>Delete</button>
          </td> -->
        <!-- </tr> -->
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
      },
    };
  },
  created() {
    issuesService.listActive().then((response) => {
      this.issues = response.data;
    });
  },
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
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    const formatted = month + '/' + day + '/' + year + ' @ ' + d.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });
    return formatted;
    }
    // formatDate(jsonDate) {
    //   jsonDate = this.issue.dateExpiration;
    //   const date = new Date(jsonDate);
    //   const formattedDate = `${date.getFullYear()}-${
    //     date.getMonth() + 1
    //   }-${date.getDate()} ${date.getHours()}:${date.getMinutes()}`;
    //   return formattedDate;
    // },
  },
};
</script>