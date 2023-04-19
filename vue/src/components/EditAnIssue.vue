<template>
  <div class="edit-form">
    <h1>Edit Issue:</h1>
    <!-- <br /> -->
    <form class="first-form" v-on:submit.prevent="saveForm()">
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
      <input type="date" v-model="proposal.dateExpiration" /> &nbsp;
      <input type="time" v-model="proposal.timeExpiration" /><br /><br />

      <label for="genre">Genre</label><br />
      <select name="genre" id="genre" v-model="proposal.genreTag">
        <option value="genre1">Genre 1</option>
        <option value="genre2">Genre 2</option>
        <option value="genre3">Ham</option></select
      ><br /><br />
      <span id="required">*Indicates required field</span><br />
      <button type="reset" value="clear">Clear</button>&nbsp;
      <button type="submit" value="save">Update</button>
    </form>
  </div>
</template>

<script>
import issuesService from "@/services/IssuesService";

export default {
  name: "issue",
  data() {
    return {
      proposals: [],
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
    created() {
    issuesService.details(this.$route.params.issueId).then((response) => {
      this.proposal = response.data;
    });
  },
  methods: {
    saveForm() {
      issuesService.updateIssue(this.$route.params.issueId, this.proposal);
      this.$router.push("/issues/active");
    },
  },
// computed: {
//     value: {
//       get() {
//         return this.proposal
//       },
//       set(value) {
//         this.$emit('update:modelValue', value)
//       }
//     }
// }
};
</script>

<style scoped>
</style>