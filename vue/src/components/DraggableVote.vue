<template>
  <div class="full-list">
    <h1 class="list">List 1</h1>
    <draggable class="list-group" :list="allChoices" group="people" @change="log">
      <div
        class="list-group-item"
        v-for="choice in allChoices"
        :key="choice.choiceId"
      >
        {{ choice.choice }}
      </div>
    </draggable>
    <h1 class="list">List 2</h1>
    <draggable class="list-group" :list="topChoices" group="people" @change="log">
      <div
        class="list-group-item"
        v-for="choice in topChoices"
        :key="choice.choiceId"
      >
       {{ choice.choice }}
      </div>
    </draggable>
    <button @click=""></button>
  </div>
</template>

<script>
import draggable from "vuedraggable";
import issuesService from "@/services/IssuesService";

export default {
  name: "draggable-vote",
  components: {
    draggable,
  },
  data() {
    return {
      issue: "",
      allChoices: [
        {
          choice: "",
          choiceId: "",
          issueId: "",
          points: "",
        },
      ],
      topChoices: [
        {
          choice: "",
          choiceId: "",
          issueId: "",
          points: "",
        },
      ],
    };
  },
  created() {
    issuesService.details(this.$route.params.issueId).then((response) => {
      this.issue = response.data;
    });
    issuesService.choiceDetails(this.$route.params.issueId).then((response) => {
      this.allChoices = response.data;
    });
  },
  methods: {
    submitVotes() {
      const data = {item:this.topChoices};
      
    }
  }
};
</script>

<style scoped>
.full-list {
    display: flex;
    justify-content: space-evenly;
}

.list-group {
  display: inline-block;
  border: 1px solid red;
  margin: 5px 10px;
  padding: 5px 10px;
}
</style>
