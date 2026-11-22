# FONT GUIDE — Katalog Font Open-Source Musang

Katalog referensi font untuk editing gambar & video. Semua font di repo ini
berlisensi **SIL OFL 1.1** — gratis & open-source, boleh dipakai untuk proyek
komersial maupun pribadi tanpa membayar.

> Aturan keras: **hanya font open-source**. Jangan tambahkan font bajakan,
> font dari sumber tidak jelas lisensinya, atau font hasil unduhan acak.
> Kalau lisensi tidak jelas, font TIDAK masuk katalog.

> **Format penyimpanan (base64):** file font di repo ini disimpan sebagai
> `.b64` (teks base64), bukan `.ttf`/`.otf` langsung — karena konektor
> GitHub yang dipakai untuk push hanya menerima file teks (UTF-8). Isi
> font tidak berubah (decode menghasilkan byte yang identik dengan file
> aslinya, sudah diverifikasi sha256 untuk ke-28 font). Decode dulu sebelum
> dipakai:
>
> ```bash
> ./decode.sh            # decode semua font ke fonts/ (nama .ttf/.otf asli)
> # atau satu file:
> base64 -d fonts/thumbnail_display/Anton-Regular.ttf.b64 > Anton-Regular.ttf
> ```
>
> Nama file di tabel-tabel bawah adalah nama file **hasil decode**
> (`.ttf`/`.otf` asli); di repo, tiap file punya suffix `.b64` (mis.
> `Anton-Regular.ttf.b64`). Kolom `local_path` di `FONT_CATALOG.json`
> menunjuk ke file `.b64`, kolom `decoded_filename` ke nama aslinya.

## Isi katalog (28 font, 4 kategori)

### `fonts/thumbnail_display/` — judul besar, thumbnail, poster
| Font | Gaya | File |
|---|---|---|
| Anton | Sans condensed tebal, impact poster | `Anton-Regular.ttf` |
| Bebas Neue | Sans condensed tinggi, headline bersih | `BebasNeue-Regular.ttf` |
| League Spartan | Sans geometris tebal, display modern | `LeagueSpartan[wght].ttf` (variable) |
| Montserrat | Sans geometris, ExtraBold = wght 800 | `Montserrat[wght].ttf` (variable) |
| Pirata One | Blackletter gothic, ornamen tajam — WOLVGANG | `PirataOne-Regular.ttf` |
| UnifrakturMaguntia | Fraktur klasik, paling gothic — WOLVGANG | `UnifrakturMaguntia-Book.ttf` |
| Cinzel Decorative | Roman ornamen, ukiran metalik — WOLVGANG | `CinzelDecorative-Black.ttf` (900) |
| New Rocker | Gothic rock, kasar berkarakter — WOLVGANG | `NewRocker-Regular.ttf` |
| Metal Mania | Heavy metal, paling agresif — WOLVGANG | `MetalMania-Regular.ttf` |
| MedievalSharp | Gothic runcing, tajam — WOLVGANG | `MedievalSharp.ttf` |
| Ostrich Sans | Sans condensed sangat tinggi, headline retro | `OstrichSans-Bold.otf` |
| Chunk Five | Slab tebal, impact retro | `ChunkFive-Regular.otf` |
| Trickster | Display condensed eksperimental, berkarakter | `Trickster-Reg.otf` |
| Sporting Grotesque | Grotesque sporty berkarakter kuat | `SportingGrotesque-Bold.otf` |
| Mazius Display | Display serif ekspresif | `MaziusDisplay-Regular.otf` |

Enam font WOLVGANG di atas adalah hasil riset 22 Nov 2026 dari referensi
"WOLVGANG — UNITY MIXTAPE 12" (dark gothic-fantasy, ungu gelap, tipografi
ornamen metalik). Specimen perbandingan ada di folder eksperimen Uya.

### `fonts/subtitle_clean/` — subtitle, caption, teks isi
| Font | Gaya | File |
|---|---|---|
| Poppins | Sans geometris, subtitle bersih | `Poppins-Regular.ttf` |
| Inter | Sans netral variable (opsz + wght), sangat terbaca | `Inter[opsz,wght].ttf` (variable) |
| Plus Jakarta Sans | Sans modern, subtitle bersih | `PlusJakartaSans[wght].ttf` (variable) |
| Roboto | Sans standar variable (wdth + wght), serbaguna | `Roboto[wdth,wght].ttf` (variable) |
| Apfel Grotezk | Grotesque modern bersih, subtitle/body | `ApfelGrotezk-Regular.otf` |
| Noto Sans | Sans multi-bahasa anti-tofu | `NotoSans-Regular.ttf` |

### `fonts/aesthetic_serif/` — kutipan, judul elegan, cover
| Font | Gaya | File |
|---|---|---|
| Playfair Display | Serif kontras tinggi, sinematik | `PlayfairDisplay[wght].ttf` (variable) |
| Cinzel | Serif roman klasik, ukiran elegan | `Cinzel[wght].ttf` (variable) |
| Lora | Serif terbaca, kutipan panjang | `Lora[wght].ttf` (variable) |
| Format 1452 | Serif gaya cetakan awal, cover klasik | `Format1452.otf` |
| Noto Serif | Serif multi-bahasa anti-tofu | `NotoSerif-Regular.ttf` |

### `fonts/tech_mono/` — coding, terminal, cyberpunk
| Font | Gaya | File |
|---|---|---|
| JetBrains Mono | Monospace coding | `JetBrainsMono[wght].ttf` (variable) |
| Fira Code | Monospace coding dengan ligatur | `FiraCode[wght].ttf` (variable) |

Detail lengkap tiap font (ukuran file, URL raw cadangan, weights, Fontsource
ID) ada di `FONT_CATALOG.json`.

## Cara memakai

### 1. Dari repo ini (langsung)
Clone repo ini, jalankan `./decode.sh` (atau decode satu file dengan
`base64 -d <file>.b64 > <file>.ttf`), lalu pakai file `.ttf` hasil decode
di `fonts/<kategori>/` seperti file font biasa — install ke sistem, atau
referensikan langsung dari CSS `@font-face` / Remotion / p5.js / FFmpeg
`drawtext`.

### 2. Via Fontsource (npm, untuk web/Remotion)
Tiap font punya Fontsource ID (lihat `FONT_CATALOG.json` kolom
`fontsource_id`):

```bash
npm install @fontsource/<id>
```

```js
import "@fontsource/<id>/400.css";        // weight 400
import "@fontsource/<id>/800.css";        // weight 800 (kalau tersedia)
```

Untuk font variable, paket Fontsource variable-nya bernama
`@fontsource-variable/<id>` (contoh: `@fontsource-variable/inter`).

### 3. Via URL raw cadangan
Kalau file lokal hilang, unduh ulang dari `raw_url` di `FONT_CATALOG.json`
(sumber: `raw.githubusercontent.com/google/fonts/main/ofl/...`). URL tersebut
sudah terverifikasi HTTP 200 pada 22 Nov 2026.

## Catatan font variable
File `.ttf` dengan nama `[wght]`, `[opsz,wght]`, atau `[wdth,wght]` adalah
**variable font**: satu file berisi semua weight (dan axis lain). Di CSS
pakai `font-variation-settings: "wght" 800;` (contoh: Montserrat ExtraBold
= wght 800 di `Montserrat[wght].ttf`). Di Remotion/p5.js, variable font
bisa di-load seperti font biasa; weight diatur lewat axis-nya.

## Menambah font baru ke katalog (checklist)
1. Lisensi HARUS OFL / Apache 2.0 / UFL — cek file `OFL.txt`/`LICENSE` di
   sumbernya. Kalau tidak jelas, JANGAN masukkan.
2. Verifikasi URL raw: `curl -I <url>` harus HTTP 200.
3. Unduh ke file (jangan `curl | sh`), cek ukuran > 10 KB dan magic bytes
   font (`00 01 00 00` untuk TTF, `OTTO` untuk OTF) — bukan halaman HTML.
4. Taruh di kategori yang tepat di `fonts/`, tambahkan entri ke
   `FONT_CATALOG.json` (nama, kategori, gaya, path lokal, raw URL,
   fontsource_id, lisensi, variable, weights, ukuran byte), dan baris tabel
   di file ini.

## Sumber data
- Fontsource API — https://api.fontsource.org/v1/fonts (2.103 font, diakses
  22 Nov 2026).
- Google Fonts GitHub — https://github.com/google/fonts (direktori `ofl/`,
  pola raw `raw.githubusercontent.com/google/fonts/main/ofl/<slug>/<File>.ttf`).
- Riset font WOLVGANG (Uya, 22 Nov 2026) — 6 kandidat display OFL.
- Foundry open-source: theleagueof, velvetyne, collletttivo, notofonts,
  JetBrainsMono, FiraCode (lihat `FONT_CATALOG.json` kolom `source`).

## Lisensi repo
Font di repo ini mengikuti lisensi masing-masing (SIL OFL 1.1 — lihat
`OFL.txt` di repo sumber tiap font). Katalog (`FONT_CATALOG.json`,
`FONT_GUIDE.md`) bebas dipakai ulang.
