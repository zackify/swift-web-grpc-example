# protoc

Generating the swift code requires the exact grpc-swift version in the Package.swift to be cloned on your computer. Building the plugins from source, then the command below will work. Only needed if you change the protobuf.

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
