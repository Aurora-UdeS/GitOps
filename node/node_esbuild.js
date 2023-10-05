import esbuild from 'esbuild';

esbuild.build({
  entryPoints: ['app.js'],
  outfile: 'app.cjs',
  external: ['pg-native'], // add 'pg-native' to the list of external modules
  bundle: true,
  platform: 'node',
  loader: { '.afm': 'file' },
}).catch(() => process.exit(1));
