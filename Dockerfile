FROM golang:1.18
RUN mkdir /code
COPY . /code
WORKDIR /code
RUN go env -w GO111MODULE="off"
RUN go get gitee.com/notfresh/doorman/go/cmd/doorman
ENV PORT 6000
CMD doorman: $GOPATH/bin/doorman -config=./doc/simplecluster/config.yml -port=$PORT -debug_port=$(expr $PORT + 50) -etcd_endpoints=http://etcd:2379 -master_election_lock=/doorman.master -log_dir="./doorman_log_dir"  -alsologtostderr


