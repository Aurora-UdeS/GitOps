import esbuild from 'esbuild';

esbuild.build({
  entryPoints: ['app.js'],
  outfile: 'app.cjs',
  bundle: true,
  platform: 'node',
  package: 'external',
}).catch(() => process.exit(1));
