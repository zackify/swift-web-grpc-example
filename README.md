## GRPC Example

This is a little grpc example using a swift grpc server, and a basic js web client.

Running the code is the easy part, inside the swift folder, `swift run Server`.

Inside web, `yarn` `yarn start`

## Gotchas

Along the way I learned that generating code from protobufs is a bit finicky in swift and JS. Most of my issues were inside swift though, because the grpc-swift package is currently undergoing a rewrite, you have to pull down the beta branch, manually build the swift protobuf and grpc binaries. THEN you can correctly generate swift code from a protobuf.

On the JS side, it was easier, download their listed binary, and run the command. But I find the process a bit annoying. Having to manually download a binary when theres an update needs to be automated on our machines... bazel? ;)

## Swift

On the swift side, I mostly copied the example code, but learned a lot by manually generating the code and reading through it thoroughly. I find the swift code less verbose than JS, but could still be a little shorter. Here's an example request:

```swift
class GreeterProvider: Helloworld_GreeterProvider {
  func sayHello(
    request: Helloworld_HelloRequest,
    context: StatusOnlyCallContext
  ) -> EventLoopFuture<Helloworld_HelloReply> {
    let recipient = request.name.isEmpty ? "stranger" : request.name
    let response = Helloworld_HelloReply.with {
      $0.message = "Hello \(recipient)!"
    }
    return context.eventLoop.makeSucceededFuture(response)
  }
}
```

For the most part it's "just a function" with the request data passed in. These types are all generated for you from the protobuf generator for swift.

## JS

Also, the commands are really crazy looking. Here's how i generated the required JS code for a basic protobuf:

```
protoc -I=. helloworld.proto \
--js_out=import_style=commonjs:. \
--grpc-web_out=import_style=typescript,mode=grpcwebtext:.
```

Lastly, I find the JS synax to be very verbose, and it also doesnt support async/await currently:

```js
let client = new GreeterClient('http://localhost:51318');

let request = new HelloRequest();
request.setName('Test name');

client.sayHello(request, null, (err, res) => {
  if (err) return console.log(err);

  console.log('got stuff from grpc', res.getMessage());
});
```

I would have expected something much cleaner, like:

```js
let client = new GreeterClient('http://localhost:51318');

try {
  let response = await HelloRequest({ name: 'Test name' });
  console.log('got stuff from grpc', res.getMessage());
} catch (e) {
  console.log(e);
}
```
