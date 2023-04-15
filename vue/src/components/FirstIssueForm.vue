<template>
  <div class="proposal-form">
    <h1>Post a New Issue:</h1>
    <h2>
      This form allows you to create a new issue to be voted on. Name and
      description are required. You may set a poll closing time or leave it
      blank and add it at a later date. Your choices can be added on the next
      page.
    </h2>
    <br />
    <form class="first-form" v-on:submit="saveForm()">
      <label for="issue-name">Issue Name*</label><br />
      <input
        name="issue-name"
        type="text"
        maxlength="70"
        required
        v-model="proposal.issueName"
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
      <input type="date" v-model="proposal.dateExpiration" /> &nbsp; <input type="time" v-model="proposal.timeExpiration" /><br /><br />

      <label for="genre">Genre</label><br />
      <select name="genre" id="genre" v-model="proposal.genreTag">
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
  name: "issue",
  data() {
    return {
      proposal: {
        issueId: "",
        issueName: "",
        description: "",
        dateExpiration: "",
        timeExpiration: "",
        genreTag: "",
      },
    };
  },
  methods: {
    saveForm() {
      issuesService.submitIssue(this.proposal);
      this.$router.push('/issues/choices');
    },
    viewChoices(id) {
      this.$router.push(`/issues/choices/${id}`);
    }
  },
};
</script>

<style scoped>





</style>