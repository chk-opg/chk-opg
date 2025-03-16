7z a -p -mhe=on test.7z test

docker build -t test .
docker run -e PASS=.... -d -p 9999:9999 test
