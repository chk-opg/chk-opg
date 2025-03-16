#!/bin/sh
7z x test.7z -p$PASS
cd test/front
npm install
npm run build
cd ../backend
npm install

while [ true ]
do
    npm run start
done