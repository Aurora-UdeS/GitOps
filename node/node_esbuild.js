import esbuild from 'esbuild';



const esbuild = require('esbuild');
const fs = require('fs');

// Define the path to Helvetica.afm for the current service
const helveticaAfmPath = './node_modules/pdfkit/js/data/Helvetica.afm';
const helveticaBoldAfmPath = './node_modules/pdfkit/js/data/Helvetica-Bold.afm';

// Check if the file exists before adding it as an asset
if (fs.existsSync(helveticaAfmPath) && fs.existsSync(helveticaBoldAfmPath)) {
  esbuild.build({
    entryPoints: ['app.js'],
    outfile: 'app.cjs',
    external: ['pg-native'], // add 'pg-native' to the list of external modules
    bundle: true,
    platform: 'node',
    assets: [helveticaAfmPath, helveticaBoldAfmPath],
  }).catch(() => process.exit(1));
} else {
  esbuild.build({
    entryPoints: ['app.js'],
    outfile: 'app.cjs',
    external: ['pg-native'], // add 'pg-native' to the list of external modules
    bundle: true,
    platform: 'node'
}).catch(() => process.exit(1));
}
