<template>
  <div class="choices-form">

      <h1>Add Options:</h1>
      <h2>Here you'll add your choices!</h2>
      <form v-on:submit="saveForm">
          <label for="choice">Choice:</label><br/>
          <input
        name="choice"
        type="text"
        maxlength="100"
        required
      />&nbsp;
      <button type="submit">Submit</button>
      </form>
  </div>
</template>

<script>
import issuesService from "@/services/IssuesService";

export default {
    name: "choices-form",
    props: {
        proposal: Object
    },
    data() {
        return {
            choice: {
                choiceId: "",
                issueId: "",
                choice: "",
                votes: 0
            }
        }
    },
    methods: {
        saveForm() {
            issuesService.submitChoice(this.choice);
        }
    }
}
</script>

<style>

</style>