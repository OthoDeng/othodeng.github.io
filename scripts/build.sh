set -euo pipefail

cd "$(dirname "$0")/.."
shiroa_binary="${1:-./shiroa}"
test -x "$shiroa_binary"

mkdir -p .build-check assets/fonts
if [ ! -s .build-check/charter-font-assets.tar.gz ]; then
  curl --fail --location --silent --show-error \
    https://github.com/Myriad-Dreamin/shiroa/releases/download/v0.1.0/charter-font-assets.tar.gz \
    --output .build-check/charter-font-assets.tar.gz.download
  mv .build-check/charter-font-assets.tar.gz.download .build-check/charter-font-assets.tar.gz
fi
tar -xzf .build-check/charter-font-assets.tar.gz -C assets/fonts
if [ ! -s .build-check/source-han-serif-font-assets.tar.gz ]; then
  curl --fail --location --silent --show-error \
    https://github.com/Myriad-Dreamin/shiroa/releases/download/v0.1.5/source-han-serif-font-assets.tar.gz \
    --output .build-check/source-han-serif-font-assets.tar.gz.download
  mv .build-check/source-han-serif-font-assets.tar.gz.download .build-check/source-han-serif-font-assets.tar.gz
fi
tar -xzf .build-check/source-han-serif-font-assets.tar.gz -C assets/fonts

"$shiroa_binary" build --path-to-root / --font-path assets/fonts
test -s book/index.html
test -s book/internal/typst_ts_renderer_bg.wasm
