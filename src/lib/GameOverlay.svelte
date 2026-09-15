<script>
  import { cxStore, termStore } from '$lib/gameBridge.js';

  let cx, term;
  cxStore.subscribe(v => cx = v);
  termStore.subscribe(v => term = v);

  let menuOpen = false;
  let feedback = '';

  function toggleMenu() {
    menuOpen = !menuOpen;
    feedback = '';
  }

  async function checkLevel1() {
    if (!cx) return;
    const exitCode = await cx.run("/bin/sh", ["-c", "test -f /tmp/test.txt"]);
    console.log(exitCode);
    feedback = exitCode === 0 ? '✅ Correct!' : '❌ Not yet — keep trying.';
  }

  function handleKeydown(e) {
    if (e.key === 'Escape') menuOpen = false;
  }
</script>

<svelte:window on:keydown={handleKeydown} />

<button class="menu-trigger" on:click={toggleMenu}>
  ☰ Menu
</button>

{#if menuOpen}
  <div class="overlay-backdrop" on:click={toggleMenu}>
    <div class="overlay-panel" on:click|stopPropagation>
      <div class="overlay-header">
        <h2>Level 1</h2>
        <button class="close-btn" on:click={toggleMenu}>✕</button>
      </div>

      <p class="objective">Create a file called <code>test.txt</code> in <code>/tmp</code>.</p>

      <button class="check-btn" on:click={checkLevel1}>Check Level 1</button>

      {#if feedback}
        <p class="feedback">{feedback}</p>
      {/if}
    </div>
  </div>
{/if}

<style>
  .menu-trigger {
    position: fixed;
    top: 1rem;
    right: 1rem;
    z-index: 9998;
    background: rgba(0, 0, 0, 0.8);
    color: white;
    border: none;
    padding: 0.6rem 1.1rem;
    border-radius: 0.5rem;
    font-size: 1rem;
    cursor: pointer;
  }

  .menu-trigger:hover {
    background: rgba(0, 0, 0, 0.95);
  }

  .overlay-backdrop {
    position: fixed;
    inset: 0;
    z-index: 9999;
    background: rgba(0, 0, 0, 0.7);
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .overlay-panel {
    background: white;
    color: black;
    width: min(90vw, 480px);
    max-height: 80vh;
    overflow-y: auto;
    border-radius: 0.75rem;
    padding: 1.5rem;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
  }

  .overlay-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1rem;
  }

  .overlay-header h2 {
    margin: 0;
  }

  .close-btn {
    background: none;
    border: none;
    font-size: 1.25rem;
    cursor: pointer;
    color: #666;
  }

  .close-btn:hover {
    color: #000;
  }

  .objective {
    margin-bottom: 1.25rem;
    line-height: 1.5;
  }

  .objective code {
    background: #f0f0f0;
    padding:
