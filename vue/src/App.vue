<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'active-issues' }"
        >Active Issues</router-link
      >&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'proposal-form' }"
        >Post an Issue</router-link
      >&nbsp;|&nbsp;
      <!--CHANGE THIS WHEN REFACTORING -->
      <router-link v-bind:to="{ name: 'login' }"
        >Login</router-link
      >&nbsp;|&nbsp;
      <router-link
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != ''"
        >Logout</router-link
      >
    </div>
    <router-view />
  </div>
</template>


<style>
@import url("https://fonts.googleapis.com/css2?family=Quicksand");

body {
  background: linear-gradient(
    to bottom,
    #ece6c2 0%,
    #ece6c2 4%,
    #cc6b49 4%,
    #cc6b49 4.2%,
    #73bda8 4.2%,
    #73bda8 22%,
    #cc6b49 22%,
    #cc6b49 22.2%,
    #73bda8 22.2%,
    #73bda8 23%,
    #cc6b49 23%,
    #cc6b49 23.2%,
    #73bda8 23.2%,
    #73bda8 24%,
    #cc6b49 24%,
    #cc6b49 24.2%,
    #73bda8 24%,
    #73bda8 24.3%,
    #ece6c2 26.2%
  );
  font-family: "Quicksand", sans-serif;
  font-size: 1.2em;
  width: 100%;
  height: 100vh;
}
#nav {
  color: #cc6b49;
}

a {
  color: #6f5643;
  text-decoration: none;
}

a:hover {
  text-shadow: 1px 1px 2px #6f5643;
}

header {
  display: flex;
  justify-content: center;
}

p {
  color: #6f5643;
  text-indent: 30px;
}
</style>
