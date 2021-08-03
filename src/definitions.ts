export interface socketIOPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
