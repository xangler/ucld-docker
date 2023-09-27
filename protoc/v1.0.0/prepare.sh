mkdir -p downloads
if [ ! -f downloads/go1.18.10.linux-amd64.tar.gz ]; then
wget https://go.dev/dl/go1.18.10.linux-amd64.tar.gz -O downloads/go1.18.10.linux-amd64.tar.gz
fi
if [ ! -f downloads/protoc-3.15.8-linux-x86_64.zip ]; then
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.15.8/protoc-3.15.8-linux-x86_64.zip -O downloads/protoc-3.15.8-linux-x86_64.zip
fi
