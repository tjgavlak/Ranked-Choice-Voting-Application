<template>
  <div class="edit-form">
    <h1>Edit Issue:</h1>
    <h2>
      This form allows you to edit an active issue. Name and
      description are required. You may set a poll closing time or leave it
      blank and add it at a later date.
    </h2>
    <form class="first-form" v-on:submit.prevent="saveForm()">
      <div class="post-name">
        <label for="issue-name">Issue Name*</label><br />
        <input
          name="issue-name"
          type="text"
          maxlength="70"
          required
          v-model="proposal.issueName"
        />
      </div>
      <div class="post-desc">
        <label for="issue-description">Description*</label><br />
        <textarea
          name="issue-description"
          rows="4"
          cols="50"
          placeholder="Limit 500 characters"
          maxlength="500"
          required
          v-model="proposal.description"
        /><br />
        <span id="required">*Indicates required field</span>
      </div>
      <div class="post-close">
        <label for="deadline">Polls Close</label>
        <input type="date" v-model="proposal.dateExpiration" />
        <input type="time" v-model="proposal.timeExpiration" />
      </div>
      <div class="post-genre">
        <label for="genre">Tag </label>
        <select name="genre" id="genre" v-model="proposal.genreTag">
          <option value="genre0">----------</option>
          <option value="Parks and Rec">Parks and Rec</option>
          <option value="Education">Education</option>
          <option value="Events">Events</option>
        </select>
      </div>
      <div class="post-buttons">
        <button type="reset" value="clear">Clear</button>&nbsp;
        <button type="submit" value="save">Update</button
        >&nbsp;&nbsp;<button type="delete" @click="deleteIssue()">Delete</button>
      </div>
      <br />
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