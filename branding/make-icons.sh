#!/usr/bin/env bash
# Builds every Android launcher icon from one picture: branding/app-icon.png
#
# To change the app icon, replace branding/app-icon.png with your own square
# image (1024 x 1024 PNG is best) and push. The GitHub build runs this script
# automatically. Keep the important part of the picture in the middle:
# phones crop the outer edge into a circle, squircle or rounded square.
#
# Needs ImageMagick (`convert`). Run from anywhere: bash branding/make-icons.sh
set -euo pipefail
cd "$(dirname "$0")/.."

SRC=branding/app-icon.png
RES=app/src/main/res
[ -f "$SRC" ] || { echo "Missing $SRC"; exit 1; }

# Colour behind the icon on phones that show a little of the background:
# taken from near the top-left corner of the picture.
BG=$(convert "$SRC" -alpha off -format '#%[hex:p{8,8}]' info: | cut -c1-7)
# Non-square pictures are centred on a square canvas (filled with that colour)
# instead of being stretched.
SQ=$(mktemp --suffix=.png)
trap 'rm -f "$SQ"' EXIT
SIDE=$(convert "$SRC" -format '%[fx:max(w,h)]' info:)
convert "$SRC" -background "$BG" -gravity center -extent "${SIDE}x${SIDE}" "$SQ"
SRC="$SQ"

cat > "$RES/values/ic_launcher_background.xml" <<EOF
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="ic_launcher_background">$BG</color>
</resources>
EOF

for pair in mdpi:48 hdpi:72 xhdpi:96 xxhdpi:144 xxxhdpi:192; do
  d=${pair%%:*}; n=${pair##*:}
  out="$RES/mipmap-$d"; mkdir -p "$out"
  r=$(( n * 22 / 100 )); c=$(( n / 2 ))

  # Older phones (Android 7): rounded square and circle versions
  convert "$SRC" -resize "${n}x${n}!" \
    \( -size "${n}x${n}" xc:none -fill white -draw "roundrectangle 0,0,$((n-1)),$((n-1)),$r,$r" \) \
    -alpha set -compose DstIn -composite "$out/ic_launcher.png"
  convert "$SRC" -resize "${n}x${n}!" \
    \( -size "${n}x${n}" xc:none -fill white -draw "circle $c,$c $c,0" \) \
    -alpha set -compose DstIn -composite "$out/ic_launcher_round.png"

  # Android 8+: the picture fills the visible two-thirds of a 108dp canvas
  f=$(( n * 108 / 48 )); s=$(( n * 72 / 48 ))
  convert "$SRC" -resize "${s}x${s}!" -background none -gravity center \
    -extent "${f}x${f}" "$out/ic_launcher_foreground.png"
done

echo "Icons built from branding/app-icon.png (background $BG)"
