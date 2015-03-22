API='48a71fc63901b5ceae0b76690554d9c8'
Url='http://apifree.forvo.com/key/'$API'/format/xml/action/standard-pronunciation/word/'$POPCLIP_TEXT

getURL() {
    curl -s $Url | grep -m1 -oE 'http.+?mp3' | tail -1
}

if [[ -s /tmp/$POPCLIP_TEXT.ogg ]]; then
    afplay "/tmp/$POPCLIP_TEXT.mp3"
else
    extractedURL=$(getURL)
    if [[ -n $extractedURL ]]; then
        curl -s -o "/tmp/$POPCLIP_TEXT.mp3" $extractedURL
        afplay "/tmp/$POPCLIP_TEXT.mp3"
    else
        exit 1
    fi
fi
