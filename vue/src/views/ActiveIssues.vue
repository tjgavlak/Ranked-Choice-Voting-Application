<template>
  <div class="active-issues">
    <table>
      <thead>
        <tr>
          <th>&nbsp;</th>
          <th>Issue Name</th>
          <th>Status</th>
        </tr>
      </thead>

      <tbody>
        <tr v-for="issue in issues" :key="issue.issueId">
          <td class="logo">
            <img src="@/assets/Screen Shot 2023-04-10 at 4.48.14 PM.png" />
          </td>
          <td class="name">{{ doc.name }}</td>
          <td>
            <img :src="doc.avatar" class="avatar" />
            <span class="ownedby">{{ doc.author }}</span>
          </td>
          <td>{{ doc.lastOpened }}</td>
          <td>
            <button v-on:click="viewDocument(doc.id)">Edit</button>&nbsp;
            <button v-on:click="deleteDocument(doc.id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import IssuesService from '@/services/IssuesService'
export default {
  name: "active-issues",
};
async mounted() {
    this.getIssues();
};
methods: {
    async getIssues() {
        let response = await list();
        if(response == null) {
            console.log("There was an error loading the issues.");
        } else {
            this.issues = response;
        }
    }
}
</script>