<script>
  let count = 0
  const increment = () => {
    count += 1
  }
</script>

<main>
  <h1>DataMind Core</h1>
  <div class="card">
    <button on:click={increment}>
      count is {count}
    </button>
    <p>
      Edit <code>src/App.svelte</code> to test hot module replacement
    </p>
  </div>
  <p class="read-the-docs">
    Click on the Vite and Svelte logos to learn more
  </p>
</main>

<style>
  main {
    text-align: center;
    padding: 1em;
    max-width: 240px;
    margin: 0 auto;
  }

  h1 {
    color: #ff3e00;
    text-transform: uppercase;
    font-size: 4em;
    font-weight: 100;
  }

  .card {
    padding: 2em;
  }

  .read-the-docs {
    color: #888;
  }

  button {
    font-family: inherit;
    font-size: inherit;
    padding: 1em 2em;
    color: #ff3e00;
    background-color: rgba(255, 62, 0, 0.1);
    border-radius: 2em;
    border: 2px solid rgba(255, 62, 0, 0);
    outline: none;
    width: 200px;
    font-variant-numeric: tabular-nums;
    cursor: pointer;
  }

  button:focus,
  button:hover {
    border: 2px solid #ff3e00;
  }
</style>
