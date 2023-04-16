<template>
  <div class="choices-form">

      <h1>Add Options:</h1>
      <h2>Here you'll add your choices!</h2>
      <form v-on:submit.prevent="saveForm()">
          <label for="option">Choice:</label><br/>
          <input
        name="option"
        type="text"

        v-model="option.choice"
      />&nbsp;
      <button type="submit" value="save">Submit</button>
      </form>
  </div>
</template>

<script>
import issuesService from "@/services/IssuesService";

export default {
    name: "choice",
    props: {
        proposal: Object,
    },
    created(){
        issuesService.details(this.$route.params.issueId).then((response) => {
      this.issue = response.data;
    });
    },
    data() {
        return {
            option: {
                choiceId: "",
                issueId: this.$route.params.issueId,
                choice: "",
                points: ""
            }
        }
    },
    methods: {
        get() {
          let recentId = issuesService.mostRecentIssueId();  
          return recentId;
        },
        saveForm() {
            // this.$store.commit('ADD_CHOICE', this.choice);
            // this.choice = {
            //     choiceId: "",
            //     issueId: "",
            //     choice: "",
            //     points: 0
            // }
            issuesService.submitChoices(this.option);
            
        }
    }
}
</script>

<style>

</style>