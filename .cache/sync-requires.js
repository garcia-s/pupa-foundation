
// prefer default export if available
const preferDefault = m => (m && m.default) || m


exports.components = {
  "component---cache-dev-404-page-js": preferDefault(require("/home/symmetry/git/pupa-foundation/.cache/dev-404-page.js")),
  "component---src-pages-index-js": preferDefault(require("/home/symmetry/git/pupa-foundation/src/pages/index.js")),
  "component---src-pages-pupapp-js": preferDefault(require("/home/symmetry/git/pupa-foundation/src/pages/pupapp.js"))
}

