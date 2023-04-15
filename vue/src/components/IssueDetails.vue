<template>
  <div class="issue-details">
    <h2>Issue: {{ issue.issueName }}</h2>
    <h4>Description: {{ issue.description }}</h4>
    <h5>Date Posted: {{ formatDate(issue.datePosted) }}</h5>
    <h5>Poll Closes: {{ formatJustDate(issue.dateExpiration) }} @ {{ issue.timeExpiration }}</h5>
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
      choice: ""
    };
  },
  created() {
    issuesService.details(this.$route.params.issueId).then((response) => {
      this.issue = response.data;
    });
    issuesService.choiceDetails(this.$route.params.issueId).then((response) => {
      this.choice = response.data;
    })
  },
  methods: {
        formatDate(date) {
      let d = new Date(date),
        month = "" + (d.getMonth() + 1),
        day = "" + d.getDate(),
        year = d.getFullYear();

      if (month.length < 2) month = "0" + month;
      if (day.length < 2) day = "0" + day;

      const formatted = month + "/" + day + "/" + year + ' @ ' + d.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });
      return formatted;
    },
        formatJustDate(date) {
      let d = new Date(date),
        month = "" + (d.getMonth() + 1),
        day = "" + d.getDate(),
        year = d.getFullYear();

      if (month.length < 2) month = "0" + month;
      if (day.length < 2) day = "0" + day;

      const formatted = month + "/" + day + "/" + year;
      return formatted;
    },
    // 
  }
};
</script>

<style>
</style>