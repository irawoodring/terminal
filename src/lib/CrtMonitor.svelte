<script>
import {onMount, tick} from 'svelte';

onMount(async() => {
    await tick();
    requestAnimationFrame(() => {
      requestAnimationFrame(() => {
        window.dispatchEvent(new Event('resize'));
      });
    });
  });
</script>

<div class="crt-room">
  <div class="crt-monitor">
    <div class="crt-bezel">
      <div class="crt-screen">
        <div class="crt-content">
          <slot></slot>
        </div>
        <div class="crt-scanlines"></div>
        <div class="crt-vignette"></div>
        <div class="crt-flicker"></div>
      </div>
    </div>
    <div class="crt-stand"></div>
    <div class="crt-base"></div>
  </div>
</div>

<style>
  .crt-room {
    width: 100vw;
    height: 100vh;
    background: #1a1a1a;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
  }

  .crt-monitor {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .crt-bezel {
    width: min(90vw, 1100px);
    height: min(70vh, 720px);
    background: linear-gradient(160deg, #d8d4c8 0%, #b8b3a3 40%, #8f8a7a 100%);
    border-radius: 32px;
    padding: 40px 40px 60px;
    box-shadow:
      0 20px 60px rgba(0, 0, 0, 0.6),
      inset 0 2px 4px rgba(255, 255, 255, 0.4),
      inset 0 -4px 8px rgba(0, 0, 0, 0.3);
    position: relative;
  }

  .crt-screen {
    width: 100%;
    height: 100%;
    background: #0a0f0a;
    border-radius: 20px / 24px;
    position: relative;
    overflow: hidden;
    box-shadow:
      inset 0 0 60px rgba(0, 0, 0, 0.9),
      inset 0 0 20px rgba(0, 0, 0, 0.7);
  }

  .crt-content {
    position: absolute;
    inset: 0;
    filter: brightness(1.15) contrast(1.1);
  }

  .crt-content :global(#console),
  .crt-content :global(.xterm) {
    background: transparent !important;
  }

  .crt-content :global(.xterm-screen) {
    text-shadow: 0 0 4px currentColor, 0 0 8px currentColor;
  }

  .crt-scanlines {
    position: absolute;
    inset: 0;
    pointer-events: none;
    background: repeating-linear-gradient(
      to bottom,
      rgba(0, 0, 0, 0) 0px,
      rgba(0, 0, 0, 0.15) 1px,
      rgba(0, 0, 0, 0) 2px
    );
    mix-blend-mode: multiply;
  }

  .crt-vignette {
    position: absolute;
    inset: 0;
    pointer-events: none;
    background: radial-gradient(
      ellipse at center,
      transparent 55%,
      rgba(0, 0, 0, 0.5) 100%
    );
  }

  .crt-flicker {
    position: absolute;
    inset: 0;
    pointer-events: none;
    background: rgba(255, 255, 255, 0.02);
    animation: flicker 6s infinite;
  }

  @keyframes flicker {
    0%, 96%, 100% { opacity: 0; }
    97% { opacity: 1; }
    98% { opacity: 0; }
    99% { opacity: 0.5; }
  }

  .crt-stand {
    width: 100px;
    height: 40px;
    background: linear-gradient(180deg, #b8b3a3, #8f8a7a);
    margin-top: -4px;
    clip-path: polygon(20% 0%, 80% 0%, 100% 100%, 0% 100%);
  }

  .crt-base {
    width: 220px;
    height: 20px;
    background: linear-gradient(180deg, #a8a394, #7f7a6a);
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
  }
</style>
