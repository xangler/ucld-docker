FROM ubuntu:20.04

RUN apt-get update 
RUN apt-get install -y curl;apt install -y make;apt install -y build-essential;apt-get install -y git;apt-get install -y zip 
RUN git config --global url."https://".insteadOf git://; git config --global http.sslVerify false; git config --global http.postBuffer 1048576000

ADD ./downloads /downloads
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf /downloads/go1.18.10.linux-amd64.tar.gz
RUN unzip /downloads/protoc-3.15.8-linux-x86_64.zip -d /usr/local/protoc 
RUN cp -r /usr/local/protoc/include/google /usr/local/include/ 
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/protoc/bin:/usr/local/go/bin:/go/bin
ENV GOPATH=/go
ENV GOPROXY=https://goproxy.cn

RUN mkdir -p /go/pkg/mod/github.com/googleapis && cd /go/pkg/mod/github.com/googleapis && git clone https://github.com/googleapis/api-common-protos.git
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28.0
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2.0
RUN go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@v2.12.0
RUN go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@v2.10.3
RUN go install github.com/envoyproxy/protoc-gen-validate@v0.6.13