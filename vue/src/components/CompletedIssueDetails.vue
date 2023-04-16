<template>
  <div class="issue-details">
    <h2 class="closed">Closed Issue: {{ issue.issueName }}</h2>
    <h4>Description: {{ issue.description }}</h4>
    <h5>
      Poll Closed: {{ formatJustDate(issue.dateExpiration) }} @
      {{ issue.timeExpiration }}&nbsp;&nbsp;|&nbsp;&nbsp;{{ issue.genreTag }}
    </h5>
    <br />
    <div>
      <p class="winner" v-for="choice in choices" :key="choice.choiceId">
        {{ choice.choiceId }}&nbsp;|
        {{ choice.choice }}&nbsp;|
        {{ choice.issueId }}
      </p>
    </div>
  </div>
</template>

<script>
import issuesService from "@/services/IssuesService";

export default {
  name: "completed-issue-details",
  data() {
    return {
      issue: "",
      choices: [],
      choice: {
        choiceId: "",
        choice: "",
        issueId: "",
        points: "",
      },
    };
  },
  created() {
    issuesService.details(this.$route.params.issueId).then((response) => {
      this.issue = response.data;
    });
    issuesService.rankedChoices(this.$route.params.issueId).then((response) => {
      this.choices = response.data;
    });
  },
  methods: {
    formatDate(date) {
      let d = new Date(date),
        month = "" + (d.getMonth() + 1),
        day = "" + d.getDate(),
        year = d.getFullYear();

      if (month.length < 2) month = "0" + month;
      if (day.length < 2) day = "0" + day;

      const formatted =
        month +
        "/" +
        day +
        "/" +
        year +
        " @ " +
        d.toLocaleString("en-US", {
          hour: "numeric",
          minute: "numeric",
          hour12: true,
        });
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
  },
};
</script>

<style scoped>



</style>