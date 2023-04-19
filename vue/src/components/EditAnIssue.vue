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
        <option value="genre0">----------</option>
        <option value="genre1">Parks and Rec</option>
        <option value="genre2">Education</option>
        <option value="genre3">Events</option></select
      ><br /><br />
      <span id="required">*Indicates required field</span><br />
      <button type="reset" value="clear">Clear</button>&nbsp;
      <button type="submit" value="save">Update</button>
      <button type="delete" @click="deleteIssue()">Delete</button>
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
    deleteIssue() {
      if (confirm("Are you sure you want to delete this issue?")) {
        issuesService
          .deleteIssue(this.$route.params.issueId)
          .then((response) => {
            if (response.status === 200) {
              alert("Issue Deleted!");
            } else alert("An error has occurred.");
            this.$router.go("/issues/active");
          });
      }
    },
  },
};
</script>

<style scoped>
</style>