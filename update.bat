@echo off
mv -f coffee.cc coffee.cc.orig
cat coffee.cc.orig | sed -n "1,/^\/\/ DO NOT EDIT/p" > coffee.cc
curl -s http://jashkenas.github.com/coffee-script/extras/coffee-script.js | sed "s/\([\\""""]\)/\\\1/g" | sed "s/^/""""/g" | sed "s/$/""""/g" >> coffee.cc
printf ;>> coffee.cc
