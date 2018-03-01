//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

struct Observations: Codable {
  let stations: [Station]
  
  enum CodingKeys: String, CodingKey {
    case stations = "station"
  }
}

struct Station: Codable {
  let name: String
  let wmocode: Int?
  let longitude: Float
  let latitude: Float
  let phenomenon: String?
  let visibility: Float?
  let precipitations: Float?
  let airpressure: Float?
  let relativehumidity: Float?
  let airtemperature: Float?
  let winddirection: Int?
  let windspeed: Float?
  let windspeedmax: Float?
  let waterlevel: Float?
  let watertemperature: Float?
  let uvindex: Float?
}

PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "http://www.ilmateenistus.ee/ilma_andmed/xml/observations.php")!

let task = URLSession.shared.dataTask(with: url) { data, response, error in
//  print(String(data: data!, encoding: String.Encoding.isoLatin1)!)
  
  let decoder = XMLDecoder()
  
  let s = try? decoder.decode(Observations.self, from: data!)
  
//  s?.stations.map({ print($0)})
  
  let encodedData = try? JSONEncoder().encode(s)
  let json = try? JSONSerialization.jsonObject(with: encodedData!, options: .allowFragments)
  
  PlaygroundPage.current.finishExecution()
}



task.resume()

