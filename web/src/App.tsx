import React from 'react';
import { GreeterClient } from './protos/HelloworldServiceClientPb';
import { HelloRequest } from './protos/helloworld_pb';

let client = new GreeterClient('http://localhost:51318');

let request = new HelloRequest();
request.setName('Test name');

client.sayHello(request, null, (err, res) => {
  if (err) return err;

  console.log('got stuff from grpc', res.getMessage());
});

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
