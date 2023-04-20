<template>
  <div class="proposal-form">
    <h1>Post a New Issue</h1>
    <h2>
      This form allows you to create a new issue to be voted on! Name and
      description are required. You may set a poll closing time or leave it
      blank and add it at a later date. Your choices can be added on the next
      page.
    </h2>
    <br />
    <form class="first-form" v-on:submit.prevent="saveForm()">
      <div class="post-name">
        <label for="issue-name">Issue Name*</label>
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
        />
        <br />
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
        <button class="post-reset" type="reset" value="clear">Clear</button
        >&nbsp;&nbsp;<button class="post-next" type="submit" value="save">
          Next
        </button>
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
      this.$store.commit("ADD_ISSUE", this.proposal);
      this.proposal = {
        issueId: "",
        issueName: "",
        description: "",
        dateExpiration: "",
        timeExpiration: "",
        genreTag: "",
      };
      this.$router.push("/issues/choices");
    },
  },
};
</script>