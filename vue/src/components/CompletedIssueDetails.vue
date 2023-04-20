<template>
  <div class="issue-details">
    <table class="completed-issue-details-table">
      <thead>
        <tr>
          <th>Closed Issue:</th>
          <td>{{ issue.issueName }}</td>
          <th>Description</th>
          <td>{{ issue.description }}</td>
        </tr>
        <tr>
          <th>Poll Closed:</th>
          <td>
            {{ formatJustDate(issue.dateExpiration) }} @
            {{ issue.timeExpiration }}
          </td>
          <th>Tag:</th>
          <td>{{ issue.genreTag }}</td>
        </tr>
      </thead>
    </table>
    <br />
    <div class="rank-card">
      <p class="winner" v-for="choice in choices" :key="choice.choiceId">
        {{ choice.choice }}
        <!-- {{ choice.points }}% -->

        <!-- {{ pointSum }} -->
        <!-- this would display % of total votes -->
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
        day = "" + (d.getDate() + 1),
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
  },
  // computed: {
  //   pointSum() {
  //     let sum = this.choices.reduce((total, choice) => {
  //       return total + choice.points, 0;
  //     });
  //     let percentArray = [];
  //     for (let choice of this.choices) {
  //       let percent = choice.points - sum + 1;
  //       percentArray.push({...choice, percent});
  //     }
  //     return percentArray;
  //   },
  // },
};
</script>

<style scoped>
p {
  font-size: 1.1em;
}
.closed {
  margin-top: 30px;
}

.rank-card {
  color: #333;
  background-color: #f8f5f1;
  padding: 20px;
  box-shadow: #333 0px 0px 10px;
  margin: 10px;
  border-radius: 5px;
  margin-bottom: 25px;
  max-width: 700px;
  margin-left: auto;
  margin-right: auto;
}

.rank-card:hover {
  box-shadow: #333 0px 0px 30px;
}
</style>