//  Created by Apple Developer Academy at TUWAIQ on 01/02/2023

import Foundation

enum Logger {
  static func success(
    _ items: Any...,
    separator: String = " ",
    terminator: String = "\n",
    file: StaticString = #file,
    line: UInt = #line
  ) {
    print(String(repeating: "\n", count: 2))
    print(String(repeating: "=", count: 20))
    print("\("[success]".uppercased()) at \(file) on \(line)")
    print(String(repeating: "-", count: 20))
    print(items, separator: separator, terminator: terminator)
    print(String(repeating: "=", count: 20))
  }

  static func error(
    _ items: Any...,
    separator: String = " ",
    terminator: String = "\n",
    file: StaticString = #file,
    line: UInt = #line
  ) {
    print(String(repeating: "\n", count: 2))
    print(String(repeating: "=", count: 20))
    print("\("[error]".uppercased()) at \(file) on \(line)")
    print(String(repeating: "-", count: 20))
    print(items, separator: separator, terminator: terminator)
    print(String(repeating: "=", count: 20))
  }
}
