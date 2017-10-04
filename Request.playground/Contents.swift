import Foundation
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely()

struct Locations: Decodable {
  let statusCode: Int
  let data: [Location]
}

struct Location: Decodable {
  let id: Int
  let name: String
  let longitude: Double
  let latitude: Double
  let country: String
}


//HTTP Methods
enum HttpMethod : String {
  case  get
  case  post
}

func request() {
  guard let url = URL(string: "https://api.qminder.com/v1/locations") else { return }
  
  var request = URLRequest(url: url)
  request.httpMethod = "GET"
  
  request.setValue("eKsenRpCbpkrpcAkia6nzwzPYkzkNQMOnAYEXSr5", forHTTPHeaderField: "X-Qminder-REST-API-Key")
  
  var session = URLSession.shared
  
  let task = session.dataTask(with: request, completionHandler: {data, response, error in
    
    if data == nil {
      
    } else {
      
      guard let resp = response as? HTTPURLResponse else { return }
      
      print(resp.statusCode)
      
      print(String.init(data: data!, encoding: String.Encoding.utf8))
      
      
      let decoder = JSONDecoder()
      
//      let decodedData = try decoder.decode(Locations, from: data!)
      
      let decodedData = try? decoder.decode(Locations.self, from: data!)
      
//      print(decodedData)
      print(decodedData?.statusCode)
      print(decodedData?.data)
    }
  })
  
  task.resume()
}

request()
