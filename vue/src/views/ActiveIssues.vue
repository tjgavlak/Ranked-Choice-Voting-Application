<template>
<IssuesList />
</template>

<script>
import IssuesList from '../components/IssuesList.vue'

export default {
    name: 'active-issues',
    
        IssuesListdata(){
        return {
            name: '',
            status: '',
            issues: []
        }
    },

    methods: {
    }
}
</script>