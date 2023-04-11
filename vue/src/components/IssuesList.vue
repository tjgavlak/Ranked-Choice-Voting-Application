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
          <td class="name">{{ issue.name }}</td>
          <td class="status">{{ issue.status }}</td>
          <td>
            <button>Edit</button>&nbsp;
            <button>Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import IssuesService from '@/services/IssuesService'


export default {
    name: 'issues-list',
    methods: {
        loadIssues() {
          IssuesService.list().then( (response) => {
             this.issues = response.data;
           }); 
        }
    },
    created(){
      this.loadIssues();  
    }
}
</script>

<style>

</style>