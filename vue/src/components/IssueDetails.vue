<template>
  <div class="issue-details">
    <h2>Issue: {{ issue.issueName }}</h2>
    <h4>Description: {{ issue.description }}</h4>
    <h5>[Formatting required] {{ issue.datePosted }}</h5>
    <h5>{{ issue.dateExpiration }}</h5>
    <h5>{{ issue.genreTag }}</h5>
    <input type="checkbox" id="choice-1" />
    <label for="choice-1">Choice 1 </label><br />
    <input type="checkbox" id="choice-2" />
    <label for="choice-2">Choice 2 </label><br />
    <input type="checkbox" id="choice-3" />
    <label for="choice-3">Choice 3 </label>
  </div>
</template>

<script>
import issuesService from "@/services/IssuesService";

export default {
  name: "issue-details",
  data() {
    return {
      issue: "",
    };
  },
  created() {
    issuesService.details().then((response) => {
      this.issue = response.data;
    });
  },
};
</script>

<style>
</style>