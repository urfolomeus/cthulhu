// Ignore any styles or asset files to prevent test fails
function ignore() {
  return null
}
require.extensions['.css'] = ignore
require.extensions['.scss'] = ignore
require.extensions['.svg'] = ignore
require.extensions['.png'] = ignore
require.extensions['.jpg'] = ignore
