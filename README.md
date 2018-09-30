# app_for_kube_tests
Build
docker build . -t kub_app

And run
docker run --name kub_app -p 3333:3333 -d kub_app