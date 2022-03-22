#!/bin/bash

[ -z "$1" ] && echo "Must provide course number as argument to this script" && exit 1

COURSE_ID=$1

wget --recursive --level=2 \
--convert-links \
-e robots=off \
--content-disposition \
--page-requisites \
--adjust-extension \
--restrict-file-names=unix,windows \
--accept-regex "(?:.*\/(?:resource|assign)\/view\.php\?id=\d+|.*.(pdf|pptx|docx))" --regex-type pcre \
--span-hosts --domains=moodle2.cs.huji.ac.il \
--load-cookies cookies.txt \
"https://moodle2.cs.huji.ac.il/nu21/course/view.php?id=$COURSE_ID"
