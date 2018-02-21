text=$POPCLIP_TEXT
encoded_text=$(echo "${text}" | perl -MURI::Escape -wlne 'print uri_escape ($_)' | perl -pe 's/\n/%0A/')
qr_image="/tmp/qrimage.png"
curl -Lso "${qr_image}" "http://s.jiathis.com/qrcode.php?url=${encoded_text}"

qlmanage -p "${qr_image}" &>/dev/null &