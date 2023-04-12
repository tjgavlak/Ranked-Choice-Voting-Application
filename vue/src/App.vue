<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != ''"
        >Logout</router-link
      >&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'active-issues' }"
        >Active Issues</router-link
      >
    </div>
    <router-view />
  </div>
</template>


<style>
@import url("https://fonts.googleapis.com/css2?family=Quicksand");

body {
  background-color: #18453b;
  color: #ffffff;
  font-family: "Quicksand", sans-serif;
  font-size: 1.2em;
}

#nav {
  color: #ffffff;
}

a {
  color: #F4bb4e;
  text-decoration: none;
}

a:hover {
  text-shadow: 1px 1px 5px #eaeaea;
}

header {
  display: flex;
  justify-content: center;
}

p {
  text-indent: 30px;
}
</style>
