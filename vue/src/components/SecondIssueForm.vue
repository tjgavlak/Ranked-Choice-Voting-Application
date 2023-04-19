<template>
  <div class="choices-form">
    <h1>Add Options:</h1>
    <h2>Here you'll add your choices!</h2>
    <form ref="choiceForm" v-on:submit.prevent="saveForm()">
      <label for="option">Choice: </label>
      <input name="option" type="text" v-model="option.choice" />
      <button type="submit" value="save">Add</button>
    </form>
    <ul>
      <li v-for="item in items" :key="item.choice">{{ item }}</li>
    </ul>
    <button v-on:click="sendToList()">Submit</button>
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
    });
    issuesService.choiceDetails(this.$route.params.issueId).then((response) => {
      this.choices = response.data;
    });
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
  // computed: {
  //   choiceList() {
  //     return this.items.map(item => item.choice)
  //   }
  // },
  methods: {
    get() {
      let recentId = issuesService.mostRecentIssueId();
      return recentId;
    },
    saveForm() {
      issuesService.submitChoices(this.option);
      this.items.push(this.option.choice);
      console.log("TEST");
      console.log(this.items);
      issuesService
        .choiceDetails(this.$route.params.issueId)
        .then((response) => {
          this.choices = response.data;
        });
      setTimeout(() => {
        this.$refs.choiceForm.reset();
      }, 0);
    },
    //  addChoice() {
    //   if (this.option.choice !== '') {
    //     this.choices.push(this.option.choice)
    //   }
    //  },
    sendToList() {
      this.$router.push("/issues/active");
    },
  },
};
</script>

<style>
</style>