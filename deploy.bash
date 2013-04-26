#!/bin/bash

git add -A
git commit -m "$1"
git push origin dev

ssh lifelessboring@lifelessboring.com 'cd /home/lifelessboring/ludumdare26.git/; git merge dev; cp -v bin/flash/bin/ludumdare26.swf ../public_html/ludumdare26/bin/flash/bin/; cp -v index.html ../public_html/ludumdare26/'
