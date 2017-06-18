//
//  ArgoExtensions.swift
//  Tentacle
//
//  Created by Matt Diephouse on 3/10/16.
//  Copyright © 2016 Matt Diephouse. All rights reserved.
//

import Foundation
import Result

//public protocol Encodable {
//    func encode() -> JSON
//}
//
//extension JSON {
//    func JSONObject() -> Any {
//        switch self {
//        case .null:
//            return NSNull()
//        case .string(let value):
//            return value
//        case .number(let value):
//            return value
//        case .array(let array):
//            return array.map { $0.JSONObject() }
//        case .bool(let value):
//            return value
//        case .object(let object):
//            var dict: [String : Any] = [:]
//            for (key, value) in object {
//                dict[key] = value.JSONObject()
//            }
//            return dict as Any
//        }
//    }
//}
//
internal func decode<T: Decodable>(_ payload: Data) -> Result<T, DecodingError> {
    return Result(attempt: { () -> T in
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: payload)
    })
}

internal func decodeList<T: Decodable>(_ payload: Data) -> Result<[T], DecodingError> {
    return Result(attempt: { () -> [T] in
        let decoder = JSONDecoder()
        return try decoder.decode([T].self, from: payload)
    })
}
//
//internal func toString(_ number: Int) -> Decoded<String> {
//    return .success(number.description)
//}
//
//internal func toInt(_ string: String) -> Decoded<Int> {
//    if let int = Int(string) {
//        return .success(int)
//    } else {
//        return .failure(.custom("String is not a valid number"))
//    }
//}
//
//internal func toIssueState(_ string: String) -> Decoded<Issue.State> {
//    if let state = Issue.State(rawValue: string) {
//        return .success(state)
//    } else {
//        return .failure(.custom("String \(string) does not represent a valid issue state"))
//    }
//}
//
//internal func toDate(_ string: String) -> Decoded<Date> {
//    if let date = DateFormatter.iso8601.date(from: string) {
//        return .success(date)
//    } else {
//        return .failure(.custom("Date is not ISO8601 formatted"))
//    }
//}
//
//internal func toOptionalDate(_ string: String?) -> Decoded<Date?> {
//    guard let string = string else { return .success(nil) }
//    if let date = DateFormatter.iso8601.date(from: string) {
//        return .success(date)
//    } else {
//        return .failure(.custom("Date is not ISO8601 formatted"))
//    }
//}
//
//internal func toURL(_ string: String) -> Decoded<URL> {
//    if let url = URL(string: string) {
//        return .success(url)
//    } else {
//        return .failure(.custom("URL \(string) is not properly formatted"))
//    }
//}
//
//internal func toOptionalURL(_ string: String?) -> Decoded<URL?> {
//    guard let string = string else { return .success(nil) }
//
//    return .success(URL(string: string))
//}
//
//internal func toColor(_ string: String) -> Decoded<Color> {
//    return .success(Color(hex: string))
//}
//
//internal func toUserType(_ string: String) -> Decoded<UserInfo.UserType> {
//    if let type = UserInfo.UserType(rawValue: string) {
//        return .success(type)
//    } else {
//        return .failure(.custom("String \(string) does not represent a valid user type"))
//    }
//}
//
//internal func toSHA(_ string: String) -> Decoded<SHA> {
//    return .success(SHA(hash: string))
//}

