import { cxStore, termStore } from '$lib/gameBridge.js';

let cx, term;
cxStore.subscribe(v => cx = v);
termStore.subscribe(v => term = v);

async function checkLevel1() {
    if (!cx) return false;
    const exitCode = await cx.run('/bin/sh', ['-c', 'test -f /home/user/flag.txt']);
    return exitCode === 0;
}
