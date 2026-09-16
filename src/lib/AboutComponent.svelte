<script>
  import { createEventDispatcher } from 'svelte';
  const dispatch = createEventDispatcher();
</script>

<div class="backdrop" on:click={() => dispatch('close')}>
  <div class="panel" on:click|stopPropagation>
    <p>Terminal is a game for learning the command line (bash).  It runs on a virtual machine in your browser which runs a Linux distro. Progress is not saved, so refreshing your browser may result in loss of progress.  This also means if you mess something up, you can easily refresh the system to the starting state.</p>
    <button class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded font-bold" on:click={() => dispatch('close')}>Close</button>
  </div>
</div>

<style>
  .backdrop {
    position: fixed;
    inset: 0;
    z-index: 9999;
    background: rgba(0, 0, 0, 0.7);
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 1em;
  }
  .panel {
    background: white;
    padding: 1.5rem;
    border-radius: 0.75rem;
  }
</style>
