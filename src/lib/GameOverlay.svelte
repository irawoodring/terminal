<script>
  import { cxStore, termStore } from '$lib/gameBridge.js';
  import { AboutComponent } from '$lib/AboutComponent.js';

  let cx, term;
  cxStore.subscribe(v => cx = v);
  termStore.subscribe(v => term = v);

  let menuOpen = false;
  let feedback = '';

  function toggleMenu() {
    menuOpen = !menuOpen;
    feedback = '';
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
        <h2>Menu</h2>
        <button class="close-btn" on:click={toggleMenu}>✕</button>
      </div>

      <p class="objective">Terminal is a browser based game for learning.</p>

      <button class="about-btn" on:click={() = > showAbout = true}>About</button>
      {#if showAbout}
        <AboutComponent on:close={() => showAbout = false } />
      {/if}
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
    padding: 0.1rem 0.4rem;
    border-radius: 0.25rem;
  }

  .check-btn {
    background: #22c55e;
    color: white;
    border: none;
    padding: 0.6rem 1.2rem;
    border-radius: 0.5rem;
    font-weight: bold;
    cursor: pointer;
    width: 100%;
  }

  .check-btn:hover {
    background: #16a34a;
  }

  .feedback {
    margin-top: 1rem;
    font-weight: bold;
    text-align: center;
  }
</style>
