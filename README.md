# font-catalog

Katalog referensi font open-source untuk editing gambar & video (Musang).

Semua font di repo ini berlisensi **SIL OFL 1.1** — gratis & open-source.

> **Catatan format:** file font di repo ini disimpan sebagai **base64
> (`.b64`)**, bukan `.ttf` langsung — karena konektor GitHub yang dipakai
> untuk push ke repo ini hanya menerima file teks (UTF-8). Isi fontnya
> tidak berubah, tetap OFL. Untuk memakai fontnya, decode dulu:

```bash
./decode.sh            # decode semua font ke fonts/ (nama .ttf/.otf asli)
# atau satu file:
base64 -d fonts/thumbnail_display/Anton-Regular.ttf.b64 > Anton-Regular.ttf
```

## Struktur

```
fonts/
  thumbnail_display/   15 font — judul besar, thumbnail, poster
  subtitle_clean/       6 font — subtitle, caption, teks isi
  aesthetic_serif/      5 font — kutipan, judul elegan, cover
  tech_mono/            2 font — coding, terminal, cyberpunk
FONT_CATALOG.json       Indeks lengkap (nama, kategori, gaya, path .b64, nama file hasil decode, raw URL, lisensi, weights)
FONT_GUIDE.md           Panduan pemakaian + cara menambah font baru
decode.sh               Script decode semua file .b64 ke .ttf/.otf asli
```

Lihat `FONT_GUIDE.md` untuk daftar font dan cara memakai (file langsung
setelah decode, Fontsource npm, atau URL raw cadangan).

## Lisensi

Font mengikuti lisensi masing-masing (SIL OFL 1.1). Katalog
(`FONT_CATALOG.json`, `FONT_GUIDE.md`, README ini) bebas dipakai ulang.
