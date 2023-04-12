<template>
  <IssuesList />
</template>

<script>
import IssuesList from "@/components/IssuesList";

export default {
  name: "active-issues",
  data() {
    return {
      name: "",
      description: "",
      issues: [],
    };
  },
  components: {
    IssuesList,
  },
};
</script>