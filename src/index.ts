import { registerPlugin } from '@capacitor/core';

import type { socketIOPlugin } from './definitions';

const socketIO = registerPlugin<socketIOPlugin>('socketIO', {
  web: () => import('./web').then(m => new m.socketIOWeb()),
});

export * from './definitions';
export { socketIO };
