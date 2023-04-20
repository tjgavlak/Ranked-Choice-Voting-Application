<template>
  <div class="issue-details">
    <p class="instructions">
      Ranked Choice Voting allows you to rank your choices from most desired to
      least. Drag the choices into the second column in order of preference.
    </p>
    <table class="issue-details-table">
      <thead>
        <tr>
          <th id="issues">Issue:</th>
          <td>{{ issue.issueName }}</td>
          <th id="description">Description:</th>
          <td>{{ issue.description }}</td>
        </tr>
        <tr>
          <th id="date-posted">Date Posted:</th>
          <td>{{ formatDate(issue.datePosted) }}</td>
          <th id="poll-close">Poll Closes:</th>
          <td>
            {{ formatJustDate(issue.dateExpiration) }} @
            {{ issue.timeExpiration }}
          </td>
        </tr>
        <tr>
          <th id="none">Tag:</th>
          <td>{{ issue.genreTag }}</td>
          <button v-on:click="toEditPage(issue.issueId)">Edit Issue 📝</button>
        </tr>
      </thead>
    </table>

    <draggable-vote />
  </div>
</template>

<script>
import issuesService from "@/services/IssuesService";
import DraggableVote from "./DraggableVote.vue";

export default {
  name: "issue-details",
  components: {
    DraggableVote,
  },
  data() {
    return {
      issue: "",
      choices: [],
      choice: {
        choice: "",
        choiceId: "",
        issueId: "",
        points: "",
      },
    };
  },
  created() {
    issuesService.details(this.$route.params.issueId).then((response) => {
      this.issue = response.data;
    });
    issuesService.choiceDetails(this.$route.params.issueId).then((response) => {
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
        day = "" + (d.getDate() + 1),
        year = d.getFullYear();

      if (month.length < 2) month = "0" + month;
      if (day.length < 2) day = "0" + day;

      const formatted = month + "/" + day + "/" + year;
      return formatted;
    },
    toEditPage(id) {
      this.$router.push(`/issues/edit/${id}`);
    },
  },
};
</script>

<style scoped>
p {
  text-align: center;
  margin-top: 25px;
  font-size: 1.2em;
}
</style>