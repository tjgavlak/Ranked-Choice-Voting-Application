<template>
  <div id="app">
        <header><img class="logo" src="@/assets/FTR_OffWhite.png" /></header>
        <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home </router-link
      ><span class="pipe">&nbsp;|</span>
      <router-link v-bind:to="{ name: 'active-issues' }"
        >Active Issues </router-link
      ><span class="pipe">&nbsp;|</span>
      <router-link v-bind:to="{ name: 'completed-issues' }"
        >View Results </router-link
      ><span class="pipe">&nbsp;|</span>
      <router-link v-bind:to="{ name: 'proposal-form' }"
        >Post an Issue </router-link
      ><span class="pipe">&nbsp;|</span>
      <!--CHANGE THIS WHEN REFACTORING -->
      <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''"
        >Login</router-link
      >
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
@import url("https://fonts.googleapis.com/css2?family=Alegreya+Sans:ital,wght@0,300;0,400;0,500;0,700;1,100;1,300;1,400;1,500;1,700&display=swap");

#app {
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: 100vh;
}

body {
  /* background: linear-gradient(
    to bottom,
    #dedbd7 0%,
    #dedbd7 4%,
    #333333 4%,
    #333333 4.2%,
    #f8f5f1 4.2%,
    #f8f5f1 26.5%,
    #d00000 26.5%,
    #d00000 26.7%,
    #f8f5f1 26.7%,
    #f8f5f1 27.8%,
    #3f88c5 27.8%,
    #3f88c5 28%,
    #f8f5f1 28%,
    #f8f5f1 29.2%,
    #fccc13 29.2%,
    #fccc13 29.4%,
    #f8f5f1 29.4%,
    #f8f5f1 30.5%,
    #333333 30.5%,
    #333333 30.7%,
    #dedbd7 30.7%
    #dedbd7 100%
  ); */
  background-color:     #dedbd7;
  font-family: "Alegreya Sans", sans-serif;
  font-size: 1.2em;
  height: 100vh;

}

#nav {
  padding-top: 10px;
}

.pipe {
  font-size: 1.1em;
  background: linear-gradient(
    to bottom,
    #d00000 0%,
    #d00000 33%,
    #3f88c5 33%,
    #3f88c5 66%,
    #fccc13 66%,
    #fccc13 100%
  );
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;

}

a {
  margin-left: 10px;
  font-family: 'Quicksand', sans-serif;
  color: #333;
  text-decoration: none;
  font-size: 1em;
}

a:hover {
  text-shadow: 1px 1px 2px #333;
}

header {
  display: flex;
  justify-content: center;
  background-color: #333;
  /* background-image: url("assets/cat_row_primary.png"); */
  /* background-repeat: no-repeat; */
  background-size: cover;
  width: 100vw;
}

p {
  font-family: 'Quicksand', sans-serif;
  color: #333;
  text-indent: 30px;
  margin-top: 0px;
  margin-left: 1em;
  margin-right: 1em;
  font-size: 1.5em;
}

img {
  width: 100vh;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 45px;
  margin-top: 5px;
}

@media screen and (max-width: 768px) {
  img {
    max-width: 100%;
  }
}
@media screen and (max-width: 1180px) {
  img {
    margin-top: 8%;
    max-width: 100%;
  }
}

table {
  color: #333;
  margin-top: 35px;
  padding: 20px;
  border: 1px solid black;
}

th {
  font-size: 1.5em;
  padding: 10px;
}

td {
  font-family: 'Quicksand', sans-serif;
}

#required {
  font-family: 'Quicksand', sans-serif;
  color: #333;
  font-size: 0.8em;
  font-style: italic;
  font-weight: bold;
}

h1 {
  color: #333;
  font-size: 2em;
  text-align: center;
  margin: 10px;
}

h2 {
  color: #333;
  font-size: 1em;
  font-weight: bold;
}

label {
  color: #333;
  font-size: larger;
  font-weight: bold;
}

.first-form {
  /* margin-top: 20px; */
  border: 1px solid black;
  margin-bottom: 20px;
  width: 50%;
}
@media screen and (max-width: 768px) {
  .first-form {
    width: 75%;
  }
}

.closed {
  font-weight: bold;
}

.winner {
  font-size: 1em;
}

.winner:first-child {
  margin-top: 80px;
  margin-bottom: 15px;
  border-left: 2px solid #333;
  border-width: 10px;
  color: #333;
  font-size: 2em;
  font-weight: bolder;
  font-style: italic;
}

.form-input-group {
  margin-bottom: 1rem;
}

button[type=submit] {
  margin-top: 35px;
  margin-left: 10px;
  color: #333;
}

</style>
