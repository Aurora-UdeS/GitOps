import esbuild from 'esbuild';

esbuild.build({
  entryPoints: ['app.js'],
  outfile: 'dist/bundle.cjs',
  external: ['pg-native'], // add 'pg-native' to the list of external modules
  bundle: true,
  platform: 'node'
}).catch(() => process.exit(1));
