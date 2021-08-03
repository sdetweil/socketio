import { WebPlugin } from '@capacitor/core';

import type { socketIOPlugin } from './definitions';

export class socketIOWeb extends WebPlugin implements socketIOPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
