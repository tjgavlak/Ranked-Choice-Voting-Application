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
@import url("https://fonts.googleapis.com/css2?family=Noto+Emoji&display=swap");

* {
  box-sizing: border-box;
}

#app {
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: 100vh;
}

body {
  font-family: "Alegreya Sans", sans-serif;
  font-size: 1.2em;
  color: #dedbd7;
  max-width: 100%;
  overflow-x: hidden;
  background: linear-gradient(
    to bottom,
    rgba(51, 51, 51, 1) 0%,
    rgba(71, 70, 70, 1) 30%,
    rgba(80, 79, 79, 1) 45%,
    rgba(118, 116, 115, 1) 100%
  );
}

#nav {
  padding-left: 20px;
  margin-bottom: 20px;
}
@media screen and (max-width: 768px) {
  #nav {
    max-width: 100%;
    margin-bottom: 15px;
  }
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

.posted-issue {
  text-align: center;
}

.choice-input {
  margin-right: 10px;
}

.choice-list {
  font-family: "Quicksand", sans-serif;
  list-style-type: circle;
}

a {
  margin-left: 10px;
  font-family: "Quicksand", sans-serif;
  color: #f8f5f1;
  text-decoration: none;
  font-size: 1em;
  padding: 0 15px;
}

a:hover {
  text-shadow: 1px 1px 2px #f8f5f1;
}

header {
  display: flex;
  justify-content: center;
  background-size: cover;
  width: 100vw;
}

p {
  font-family: "Quicksand", sans-serif;
  color: #dedbd7;
  text-indent: 30px;
  margin-top: 0px;
  margin-left: 1em;
  margin-right: 1em;
  font-size: 1.2em;
}

img {
  width: 100vh;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 5px;
  margin-top: 5px;
  filter: drop-shadow(30px 7px 4px #333);
}

button {
  font-family: "Noto Emoji", sans-serif;
  font-size: 1em;
  align-self: center;
  background-color: #f8f5f1;
  background-image: none;
  background-position: 0 90%;
  background-repeat: repeat no-repeat;
  background-size: 4px 3px;
  border-radius: 15px 225px 255px 15px 15px 255px 225px 15px;
  border-style: solid;
  border-color: #333;
  border-width: 2px;
  box-shadow: rgba(0, 0, 0, 0.2) 15px 28px 25px -18px;
  box-sizing: border-box;
  color: #333;
  cursor: pointer;
  display: inline-block;
  line-height: 23px;
  outline: none;
  padding: 0.75rem;
  text-decoration: none;
  transition: all 235ms ease-in-out;
  border-radius: 30px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

button:hover {
  box-shadow: rgba(0, 0, 0, 0.3) 2px 8px 8px -5px;
  transform: translate3d(0, 2px, 0);
}

button:focus {
  box-shadow: rgba(0, 0, 0, 0.3) 2px 8px 4px -6px;
}

.vote {
  font-family: "Quicksand", sans-serif;
}

.vote-button {
  font-family: "Noto Emoji", sans-serif;
  font-size: 1.5em;
  margin-right: 10px;
}

.vote-button:hover {
  box-shadow: rgba(0, 0, 0, 0.3) 2px 8px 8px -5px;
  transform: translate3d(0, 2px, 0);
}

.vote-button:focus {
  box-shadow: rgba(0, 0, 0, 0.3) 2px 8px 4px -6px;
}

.ballot-box {
  font-family: "Noto Emoji", sans-serif;
  color: #f8f5f1;
  text-shadow: 1px 1px 5px green;
}

.list-icon {
  font-family: "Noto Emoji", sans-serif;
  color: #333;
  font-size: 1.3em;
}

.first-form {
  padding: 10px 0 10px 0;
  display: grid;
  grid-template-columns: 1fr 2fr 3fr;
  grid-template-areas:
    ". name desc"
    ". pollClose desc"
    ". genre desc"
    ". buttons .";
  justify-items: auto;
  align-items: stretch;
  border: 3px solid #333;
  border-radius: 5px;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
}

.post-name {
  grid-area: name;
  /* display: block;
  flex-grow: 0;
  flex-shrink: 1;
  flex-basis: auto;
  align-self: center; */
}

input[type="time"] {
  margin-right: 5px;
}

input {
  margin-left: 5px;
  background: linear-gradient(to bottom, #b8bdc2, #f8f5f1);
  color: #333;
  padding: 8px;
  border-radius: 5px;
  border: 1px solid #333;
}

#genre {
  background: linear-gradient(to bottom, #b8bdc2, #f8f5f1);
  color: #333;
  padding: 8px;
  border-radius: 5px;
  border: 1px solid #333;
}

.post-buttons {
  grid-area: buttons;
}

.post-close {
  grid-area: pollClose;
  /* display: block;
  flex-grow: 0;
  flex-shrink: 1;
  flex-basis: auto;
  align-self: center; */
}

.post-genre {
  grid-area: genre;
  /* display: block;
  flex-grow: 0;
  flex-shrink: 1;
  flex-basis: auto;
  align-self: center; */
}

.post-desc {
  grid-area: desc;
  /* display: block;
  flex-grow: 1;
  flex-shrink: 1;
  flex-basis: auto;
  align-self: center; */
}

textarea {
  width: 300px;
  height: 100px;
  background: linear-gradient(to bottom, #b8bdc2, #f8f5f1);
  color: #333;
  padding: 8px;
  border-radius: 5px;
  border: 1px solid #333;
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
  color: #dedbd7;
  margin-top: 35px;
  padding: 20px;
  border: 3px solid #333;
  border-radius: 5px;
  margin-left: auto;
  margin-right: auto;
  /* justify-content: center; */
}

th {
  font-size: 1.5em;
  padding: 10px;
}

td {
  font-family: "Quicksand", sans-serif;
}

#required {
  font-family: "Quicksand", sans-serif;
  color: #dedbd7;
  font-size: 0.7em;
  font-style: italic;
  font-weight: bold;
}

h1 {
  color: #dedbd7;
  font-size: 2em;
  text-align: center;
  margin: 10px;
}

h2 {
  color: #dedbd7;
  font-size: 1em;
  font-weight: bold;
}

label {
  text-align: center;
  color: #dedbd7;
  font-size: larger;
  font-weight: bold;
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
  color: #333;
}

.winner:first-child {
  border-top: #f8f5f1 5px solid;
  border-left: 10px solid #b8bdc2;
  border-bottom: 5px solid #c2c8ce;
  padding-bottom: 5px;
  color: #333;
  font-size: 2em;
  font-weight: bolder;
  font-style: italic;
}

.form-input-group {
  margin-bottom: 1rem;
}

.issue-details-table {
  margin-bottom: 35px;
  max-width: 1200px;
}
.completed-issue-details-table {
  /* margin-bottom: 15px; */
  max-width: 1200px;
}

.list-group-item{
  border-color: #333;
  border-style: solid 5px;
  background-color: #dedbd7;
  margin: 5px;
  text-align: center;
  font-size: 1.5em;
  font-family: "Quicksand", sans-serif;
  border-radius: 3px;
}

.full-list {
  display: flex;
  justify-content: space-evenly;
}

.list-group {
  margin: 5px 10px;
  padding: 5px 10px;
  min-width: 350px;

  /* gradient by nlg */
  background: transparent;
  color: #333;
  border-radius: 5px;
  border: 3px solid #333;
}
.list-group-item:hover {
  cursor: pointer;
}
</style>
