#!/bin/bash
# decode.sh — decode semua file font base64 di repo ini kembali ke .ttf/.otf asli.
#
# Kenapa base64? Konektor GitHub yang dipakai untuk push ke repo ini hanya
# menerima file teks (UTF-8), jadi file biner .ttf/.otf disimpan sebagai
# .b64 (teks ASCII). Font aslinya tetap SIL OFL 1.1, tidak diubah isinya.
#
# Penggunaan:
#   ./decode.sh            # decode ke fonts/ (di samping file .b64-nya)
#   ./decode.sh /tmp/fonts # decode ke folder lain (struktur kategori dipertahankan)
#
# Satu file saja:
#   base64 -d fonts/thumbnail_display/Anton-Regular.ttf.b64 > Anton-Regular.ttf
#
# Di macOS, ganti `base64 -d` dengan `base64 -D`.
set -eu

OUT="${1:-fonts}"
mkdir -p "$OUT"

find fonts -name '*.b64' -type f -print0 | while IFS= read -r -d '' f; do
  rel="${f#fonts/}"            # mis. thumbnail_display/Anton-Regular.ttf.b64
  dest_rel="${rel%.b64}"       # mis. thumbnail_display/Anton-Regular.ttf
  if [ "$OUT" = "fonts" ]; then
    dest="fonts/$dest_rel"
  else
    dest="$OUT/$dest_rel"
    mkdir -p "$(dirname "$dest")"
  fi
  base64 -d "$f" > "$dest"
  echo "decoded $f -> $dest"
done
