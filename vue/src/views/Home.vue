<template>
  <div class="homepage">
    <div class="home">
      <h1>Welcome</h1>
      <p>A ranked-choice voting app that enables community members to submit issues for polling and allows them to vote on these issues using a preferential ballot system. The app provides relevant information about each issue and tallies the results based on the collective preferences of registered voters. This promotes community engagement and ensures that the most important issues are addressed.</p>
      <h3>How does this work?</h3>
      <p class="gradient-p">We use the Borda Count voting method. Borda count voting is a way of voting that assigns points to each choice based on their rank. The benefits of this voting system include promoting compromise, avoiding the spoiler effect, being easy to understand, and discouraging strategic voting. It's a fair and effective method of voting that accurately reflects each voter's preferences.</p>
      <h3>"That's just math, baby!" --Tanner Gavlak</h3>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
};
</script>

<style scoped>
h1 {
  margin-bottom: 0px;
  color: #837f79;
  text-shadow: 2px 2px 0px #fccc13, 4px 4px 0px #3f88c5, 6px 6px 0px #d00000;
  font-size: 4em;
}
h3 {
  text-align: center;
  font-size: 2em;
}
</style>


