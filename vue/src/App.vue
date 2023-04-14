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
    #00274c 0%,
    #00274c 4.5%,
    #fcaf38 4.5%,
    #fcaf38 22%,
    #f8f5f1 22%,
    #f8f5f1 22.2%,
    #fcaf38 22.2%,
    #fcaf38 23%,
    #f8f5f1 23%,
    #f8f5f1 23.2%,
    #fcaf38 23.2%,
    #fcaf38 24%,
    #f8f5f1 24%,
    #f8f5f1 24.2%,
    #fcaf38 24.2%,
    #fcaf38 25%,
    #00274c 24.2%
  );
  font-family: "Quicksand", sans-serif;
  font-size: 1.2em;
  width: 100%;
  height: 100vh;
}
#nav {
  color: #fcaf38;
}

a {
  color: #f8f5f1;
  text-decoration: none;
}

a:hover {
  text-shadow: 1px 1px 5px #fff;
}

header {
  display: flex;
  justify-content: center;
}

p {
  color: #f8f5f1;
  text-indent: 30px;
}
</style>
