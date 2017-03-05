//
//  Response+Unbox.swift
//  MoyaUnbox
//
//  Created by Gustavo Perdomo on 3/5/17.
//  Copyright (c) 2017 Gustavo Perdomo. Licensed under the MIT license, as follows:
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import Moya
import Unbox

public extension Response {

    /// Maps data received from the server into an object which implements the Unboxable protocol.
    ///
    /// - Parameter type: Type of the object which implements the Unboxable protocol.
    /// - Returns: The Unboxable object instance.
    /// - Throws: MoyaError if the response can't be mapped.
    public func map<T: Unboxable>(to type: T.Type) throws -> T {
        do {
            return try unbox(data: data)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }

    /// Maps data received from the server into an object which implements the Unboxable protocol.
    ///
    /// - Parameters:
    ///   - type: Type of the object which implements the Unboxable protocol.
    ///   - keyPath: Key of the inner json. This json will be used to map the object.
    /// - Returns: The Unboxable object instance.
    /// - Throws: MoyaError if the response can't be mapped.
    public func map<T: Unboxable>(to type: T.Type, fromKey keyPath: String?) throws -> T {
        guard let keyPath = keyPath else { return try map(to: type) }

        guard let json = try mapJSON() as? UnboxableDictionary else {
            throw MoyaError.jsonMapping(self)
        }

        do {
            return try unbox(dictionary: json, atKey: keyPath)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }

    /// Maps data received from the server into an array of objects which implements the Unboxable protocol.
    ///
    /// - Parameter type: Type of the object which implements the Unboxable protocol.
    /// - Returns: The Unboxable object instance.
    /// - Throws: MoyaError if the response can't be mapped.
    public func map<T: Unboxable>(to type: [T.Type]) throws -> [T] {
        do {
            return try unbox(data: data)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }

    /// Maps data received from the server into an array of object which implements the Unboxable protocol.
    ///
    /// - Parameters:
    ///   - type: Type of the object which implements the Unboxable protocol.
    ///   - keyPath: Key of the inner json. This json will be used to map the array of object.
    /// - Returns: The Unboxable object instance.
    /// - Throws: MoyaError if the response can't be mapped.
    public func map<T: Unboxable>(to type: [T.Type], fromKey keyPath: String? = nil) throws -> [T] {
        guard let keyPath = keyPath else { return try map(to: type) }

        guard let jsonArray = try mapJSON() as? UnboxableDictionary else {
            throw MoyaError.jsonMapping(self)
        }

        do {
            return try unbox(dictionary: jsonArray, atKey: keyPath)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }
}
