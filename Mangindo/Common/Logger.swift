//
//  Logger.swift
//  Mangindo
//
//  Created by Gallant Pratama on 27/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

import Foundation

class Logger {
    
    private static let loggerPrefix = "[%@][%@] %@ -> %@"
    
    static func info(tag: String, message: String) {
        showLog(type: .Info, tag: tag, message: message)
    }
    
    static func debug(tag: String, message: String) {
        showLog(type: .Debug, tag: tag, message: message)
    }
    
    static func error(tag: String, message: String) {
        showLog(type: .Error, tag: tag, message: message)
    }
    
    private static func showLog(type: LoggerType, tag: String, message: String) {
//        print(String(format: getTimeNow(), loggerPrefix, type.rawValue, tag, message))
        print("[\(getTimeNow())][\(type.rawValue)] \(tag) -> \(message)")
    }
    
    private static func getTimeNow() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}

private enum LoggerType: String {
    case Info
    case Debug
    case Error
}
