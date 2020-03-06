# protoc

- brew install grpc-swift

```
protoc Sources/Model/helloworld.proto \
    --proto_path=Sources/Model \
    --plugin=../grpc-swift/.build/debug/protoc-gen-swift \
    --swift_opt=Visibility=Public \
    --swift_out=Sources/Model \
    --plugin=../grpc-swift/.build/debug/protoc-gen-grpc-swift \
    --grpc-swift_opt=Visibility=Public \
    --grpc-swift_out=Sources/Model
```
