<template>
  <div class="proposal-form">
    <h1>Propose a New Issue:</h1>
    <form action="http://localhost:9000/..." method="POST">
    <label for="issue-name">Issue Name: </label>
      <input
        name="issue-name"
        type="text"
        placeholder="Issue Name"
        maxlength="69"
      /><br>
      <label for="issue-description">Description: </label><br>
      <textarea
        name="issue-description"
        rows=4
        cols="50"
        placeholder="Description"
        maxlength="420"
      /><br>
      <label for="choice1">Options: </label><br>
      <input
        name="choice1"
        type="text"
        placeholder="Option 1*"
        maxlength="25"
        required
      /><br>
      <input
        name="choice2"
        type="text"
        placeholder="Option 2*"
        maxlength="25"
        required
      /><br>
      <input
        name="choice3"
        type="text"
        placeholder="Option 3*"
        maxlength="25"
        required
      /><br>
      <input name="choice4" type="text" placeholder="Option 4" maxlength="25" /><br>
      <input name="choice5" type="text" placeholder="Option 5" maxlength="25" /><br>
      <input name="choice6" type="text" placeholder="Option 6" maxlength="25" /><br>
      <input name="choice7" type="text" placeholder="Option 7" maxlength="25" /><br>
      <input name="choice8" type="text" placeholder="Option 8" maxlength="25" /><br>
      <input name="choice9" type="text" placeholder="Option 9" maxlength="25" /><br>
      <input
        name="choice10"
        type="text"
        placeholder="Option 10"
        maxlength="25"
      /><br>
      <span>*required</span><br><br>
      <label for="expire">Voting Deadline: </label>
      <input name="expire" type="date" /><br>
      <label for="genre">Genre: </label>
      <select name="genre" id="genre">
        <option value="genre1">Genre 1</option>
        <option value="genre2">Genre 2</option>
        <option value="genre3">Ham</option>
      </select><br>
      <button type="submit" value="save">Submit</button>
      <button type="reset" value="clear">Clear</button>
    </form>
  </div>
</template>

<script>
export default {
    name: "proposal-form",
    data() {
        return {

        }
    }
};
</script>

<style>

</style>