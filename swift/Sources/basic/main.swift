

var info = BookInfo.with {
  $0.id = 123
  $0.title = "test"
  $0.author = "Zach"
}

let json = try info.jsonUTF8Data()

print(String(data: json, encoding: .utf8)!)
