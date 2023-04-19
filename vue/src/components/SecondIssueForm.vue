<template>
  <div class="choices-form">
    <h1>Add Options:</h1>
    <h2>Here you'll add your choices!</h2>
    <form ref="choiceForm" v-on:submit.prevent="saveForm()">
      <label for="option">Choice:</label><br />
      <input name="option" type="text" v-model="option.choice" />&nbsp;
      <button type="submit" value="save">Submit</button>
    </form>

    <ul>
      <li v-for="choice in choices" :key="choice.choiceId">{{ choice.choice }}</li>
    </ul>
    <button v-on:click="sendToList()">GTFO</button>
  </div>
</template>

<script>
import issuesService from "@/services/IssuesService";

export default {
  name: "choice",
  props: {
    proposal: Object,
  },
  async mounted() {
    issuesService.details(this.$route.params.issueId).then((response) => {
      this.issue = response.data;
    })
    issuesService.choiceDetails(this.$route.params.issueId).then((response) => {
      this.choices = response.data;
  })
  },
  data() {
    return {
      items: [],
      option: {
        choiceId: "",
        issueId: this.$route.params.issueId,
        choice: "",
        points: "",
      },
    };
  },
  methods: {
    get() {
      let recentId = issuesService.mostRecentIssueId();
      return recentId;
    },
    saveForm() {
      issuesService.submitChoices(this.option);
      this.$refs.choiceForm.reset();
      issuesService.choiceDetails(this.$route.params.issueId).then((response) => {
      this.choices = response.data;
      })
    },
     addItem() {
      if (this.newItem !== '') {
        this.items.push(this.newItem)
        this.newItem = ''
      }
     },
      sendToList(){
        this.$router.push('/issues/active');
      }
  },
}
</script>

<style>
</style>