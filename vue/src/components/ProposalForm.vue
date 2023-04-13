<template>
  <div class="proposal-form">
    <h1>Propose a New Issue:</h1>
    <form v-on:submit="saveForm">
    <label for="issue-name">Issue Name: </label>
      <input
        name="issue-name"
        type="text"
        placeholder="Issue Name"
        maxlength="69"
        required
        v-model="proposal.name"
      /><br>
      <label for="issue-description">Description: </label><br>
      <textarea
        name="issue-description"
        rows=4
        cols="50"
        placeholder="Description"
        maxlength="420"
        required
        v-model="proposal.description"
      /><br>
      <label for="choice1">Options: </label><br>
      <input
        name="choice1"
        type="text"
        placeholder="Option 1*"
        maxlength="25"
        required
        v-model="proposal.choice_1"
      /><br>
      <input
        name="choice2"
        type="text"
        placeholder="Option 2*"
        maxlength="25"
        required
        v-model="proposal.choice_2"
      /><br>
      <input
        name="choice3"
        type="text"
        placeholder="Option 3*"
        maxlength="25"
        required
        v-model="proposal.choice_3"
      /><br>
      <input name="choice4" type="text" placeholder="Option 4" maxlength="25" v-model="proposal.choice_4"/><br>
      <input name="choice5" type="text" placeholder="Option 5" maxlength="25" v-model="proposal.choice_5"/><br>
      <input name="choice6" type="text" placeholder="Option 6" maxlength="25" v-model="proposal.choice_6"/><br>
      <input name="choice7" type="text" placeholder="Option 7" maxlength="25" v-model="proposal.choice_7"/><br>
      <input name="choice8" type="text" placeholder="Option 8" maxlength="25" v-model="proposal.choice_8"/><br>
      <input name="choice9" type="text" placeholder="Option 9" maxlength="25" v-model="proposal.choice_9"/><br>
      <input
        name="choice10"
        type="text"
        placeholder="Option 10"
        maxlength="25"
        v-model="proposal.choice_10"
      /><br>
       <label for="deadline">Poll Closing Time: </label> <br>
       <select v-model="proposal.expiration" name="deadline" id="deadline">
        <option value="dead1">One Day</option>
        <option value="dead2">Two Days</option>
        <option value="dead3">IT MAY NEVER POLL</option>
        <option value="dead3">To Be Determined</option>
      </select><br>
      <label for="genre">Genre: </label>
      <select name="genre" id="genre" v-model="proposal.genre">
        <option value="genre1">Genre 1</option>
        <option value="genre2">Genre 2</option>
        <option value="genre3">Ham</option>
      </select><br><br>
      <span>*required</span><br>
      <button type="submit" value="save">Submit</button>
      <button type="reset" value="clear">Clear</button>
      
    </form>
  </div>
</template>

<script>
import issuesService from "@/services/IssuesService";

export default {
    name: "proposal-form",
    data() {
        return {
          proposal: {
            name: "",
            description: "",
            option_1: "",
            option_2: "",
            option_3: "",
            option_4: "",
            option_5: "",
            option_6: "",
            option_7: "",
            option_8: "",
            option_9: "",
            option_10: "",
            expiration: "",
            genre: ""
          }

        }
    },
    methods: {
      saveForm() {
        issuesService.submitForm(this.proposal)
        //this might need to be async fuckin idk
      }
    }
};
</script>

<style>

</style>