<template>
  <div class="proposal-form">
    <h1>Post a New Issue:</h1>
    <h2>
      This form allows you to create a new issue to be voted on. Name and
      description are required. You may set a poll closing time or leave it
      blank and add it at a later date. Your choices can be added on the next
      page.
    </h2>
    <br /><br /><br />
    <form v-on:submit="saveForm">
      <label for="issue-name">Issue Name*</label><br />
      <input
        name="issue-name"
        type="text"
        maxlength="70"
        required
        v-model="proposal.issue_name"
      /><br /><br />
      <label for="issue-description">Description*</label><br />
      <textarea
        name="issue-description"
        rows="4"
        cols="50"
        placeholder="Limit 500 characters"
        maxlength="500"
        required
        v-model="proposal.description"
      /><br /><br />
      <label for="deadline">Poll Closing Time</label><br />
      <input type="date" />&nbsp; <input type="time" /><br /><br />

      <label for="genre">Genre</label><br />
      <select name="genre" id="genre" v-model="proposal.genre_tag">
        <option value="genre1">Genre 1</option>
        <option value="genre2">Genre 2</option>
        <option value="genre3">Ham</option></select
      ><br /><br />
      <span id="required">*Indicates required field</span><br />
      <button type="reset" value="clear">Clear</button>&nbsp;
      <button type="submit" value="save">Next</button>
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
        issue_name: "",
        description: "",
        expiration_date: "",
        expiration_time: "",
        genre_tag: "",
      },
    };
  },
  methods: {
    saveForm() {
      issuesService.submitForm(this.proposal);
      //this might need to be async fuckin idk
    },
  },
};
</script>

<style scoped>
body {
  background-color: deeppink;
}

#required {
  color: #6f5643;
  font-size: 0.7em;
  font-style: italic;
}

h2 {
  color: #ece6c2;
  font-size: 0.9em;
  font-weight: normal;
}

label {
  color: #6f5643;
}

h1 {
  color: #ece6c2;
}
</style>