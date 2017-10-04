//: Playground - noun: a place where people can play

import Foundation

/// Ticket mapping object
public struct Ticket: Codable {
  
  /// A unique ticket ID
  let ticketId: String
  
  /// Ticket number
  public let number: Int?
  
  /// Line ID
  public var line: Int
  
//  /// Source of the ticket. "MANUAL", "NAME" or "PRINTER". This field will not be present if no source has been specified when creating a ticket.
//  public let source: String?
//
//  /// Ticket status. "NEW", "CALLED", "CANCELLED", "CANCELLED_BY_CLERK", "NOSHOW" or "SERVED"
//  public var status: String
//
//  /// First name
//  public var firstName: String?
//
//  ///   Last name
//  public var lastName: String?
//
//  /// Phone number
//  public var phoneNumber: Int?
//
//  /// Created data
//  public var created: Created
//
//  /// Called data
//  public var called: Called?
//
//  /// Served data
//  public var served: Served?
//
//  /// Labels
//  public var labels: Array<Label>?
//
//  /// Extra info
//  public var extra: Array<Extra>?
//
//  /// Order after
//  public var orderAfter: Date?
  
  enum CodingKeys: String, CodingKey {
      case ticketId = "id"
    
    case number
    case line
  }
}

extension Ticket {
  var id: Int? {
    guard let id = Int(self.ticketId) else { return nil }
    
    return id
  }
}

/// Created data object
public struct Created: Codable {
  
  /// Time when ticket was created
  public var date: Date
}

/// Called data
public struct Called: Codable {
  
  /// Call date
  public var date: Date
  
  /// Desk number
  public var desk: Int?
  
  /// User ID of a clerk who called the ticket
  public var caller: Int?
}

/// Served object
public struct Served: Codable {
  
  /// Date of the end of the service
  public let date: Date
}

/// Label object
public struct Label: Codable {
  
  /// Label hex color code
  public let color: String
  
  /// Value
  public let value: String
}

/// Extra object
public struct Extra: Codable {
  
  /// Title
  public let title: String?
  
  /// Value
  public let value: String?
  
  /// URL if there is
  public let url: String?
}


/// Tickets object
struct Tickets: Codable {
  
  /// Status code
  let statusCode: Int
  
  /// Tickets array
  let data: [Ticket]
}

func parse() {

  /// JSON decoder with milliseconds
  let jsonDecoderWithMilliseconds: JSONDecoder = {
    let jsonDecoder = JSONDecoder()
    
    let dateISO8601Formatter = DateFormatter()
    dateISO8601Formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    let dateISO8601MillisecondsFormatter = DateFormatter()
    dateISO8601MillisecondsFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    jsonDecoder.dateDecodingStrategy = .custom({decoder -> Date in
      
      let container = try decoder.singleValueContainer()
      let dateStr = try container.decode(String.self)
      
      // possible date strings: "yyyy-MM-dd'T'HH:mm:ssZ" or "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
      
      var tmpDate: Date? = nil
      
      if dateStr.count == 24 {
        tmpDate = dateISO8601MillisecondsFormatter.date(from: dateStr)
      } else {
        tmpDate = dateISO8601Formatter.date(from: dateStr)
      }
      
      guard let date = tmpDate else {
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateStr)")
      }
      
      return date
    })
    
    return jsonDecoder
  }()
  
  let data = """
    {"statusCode":200,
      "data":[{"id":"11689298","status":"SERVED","source":"NAME","line":47466,"firstName":"Hhhhhh","lastName":"","created":{"date":"2016-06-27T11:34:55.283Z"}}]}
  """.data(using: .utf8)!
  
  let tickets = try! jsonDecoderWithMilliseconds.decode(Tickets.self, from: data)
  

  print(tickets)
  
}

parse()

// {"statusCode":200,"data":[{"id":"11689298","status":"SERVED","source":"NAME","line":47466,"firstName":"Hhhhhh","lastName":"","created":{"date":"2016-06-27T11:34:55.283Z"}]}
