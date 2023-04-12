<template>
  <div class="active-issues">
    <header><img src="@/assets/image.png"></header>
    <table>
      <thead>
        <tr>
          <th>Issues</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="issue in issues" :key="issue.issueId">
          <td class="issue-name">{{ issue.issueName }}</td>
          <td class="issue-description">{{ issue.description }}</td>
          <td>
            <button>Vote!</button> //Add v-bind
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
    };
  },
  created() {
    issuesService.list().then((response) => {
      this.issues = response.data;
    });
  },
  methods: {
    loadIssues() {
      issuesService.list().then((response) => {
        this.issues = response.data;
      });
    },
  },
};
</script>