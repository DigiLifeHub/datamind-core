import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.digilifehub.datamind',
  appName: 'DataMind',
  webDir: '../../dist/apps/datamind-pwa',
  server: {
    androidScheme: 'https'
  }
};

export default config;
