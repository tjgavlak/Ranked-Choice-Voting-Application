<template>
  <div class="full-list">
    <h1>Vote</h1>
    <h3 class="list">Options</h3>
    <draggable class="list-group" :list="allChoices" group="people" >
      <div
        class="list-group-item"
        v-for="(choice) in allChoices"
        :key="choice.choiceId"
      >
        {{ choice.choice }}
      </div>
    </draggable>
    <h3 class="list">Preferences</h3>
    <draggable class="list-group" :list="topChoices" group="people" >
      <div
        class="list-group-item"
        v-for="(choice) in topChoices"
        :key="choice.choiceId"
      >
       {{ choice.choice }}
      </div>
    </draggable>
    <button class="vote" @click="submitChoices()">VOTE!</button>
    <button v-on:click="sendToList()">Back To List</button>
  </div>
</template>

<script>
import draggable from "vuedraggable";
import issuesService from "@/services/IssuesService";

export default {
  name: "draggable-vote",
  components: {
    draggable,
  },
  data() {
    return {
      issue: "",
      allChoices: [
        {
          choice: "",
          choiceId: "",
          issueId: "",
          points: "",
        },
      ],
      topChoices: [
        {
          choice: "",
          choiceId: "",
          issueId: "",
          points: "",
        },
      ],
    };
  },
  // mounted() {
  //   if (this.topChoices.length > 3) {
  //     this.topChoices.splice(3);
  //   }
  // },
  created() {
    issuesService.details(this.$route.params.issueId).then((response) => {
      this.issue = response.data;
    });
    issuesService.choiceDetails(this.$route.params.issueId).then((response) => {
      this.allChoices = response.data;
    });
  },
  methods: {
    submitChoices() {
      console.log('here')
        const issueId = this.$route.params.issueId;
        let ballot = {
          choice1: this.topChoices[1].choiceId,
          choice2: this.topChoices[2].choiceId,
          choice3: this.topChoices[3].choiceId
        };
        console.log(ballot);
      issuesService.submitBallot(issueId, ballot).then((response) => {
        if (response.data) {
          alert("YOU DONE GONE VOTED!")
        } else alert("There has been an error. Please try again later.")
      });
    },
    sendToList() {
      this.$router.push("/issues/active");
    },
  }
};
</script>

<style scoped>
.full-list {
    display: flex;
    justify-content: space-evenly;
}

.list-group {
  display: inline-block;
  border: 1px solid rgb(3, 3, 3);
  margin: 5px 10px;
  padding: 5px 10px;
  min-width: 150px;
}
</style>
