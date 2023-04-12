<template>
  <div class="active-issues">
    <table>
      <thead>
        <tr>
          <th>&nbsp;</th>
          <th>Issue Name</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="issue in this.$store.state.issues" :key="issue.issueId">
          <td class="name">{{ issue.name }}</td>
          <router-link
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
      issue: {
        name: "",
        description: "",
        issues: []
      },
    };
  },
  methods: {
    loadIssues() {
      issuesService.list().then((response) => {
        this.issues = response.data;
      });
    },
  },
  created() {
    this.loadIssues();
  },
};
</script>