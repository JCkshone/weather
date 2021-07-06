//
//  XibBundle.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation

public func bundleFor(root object: AnyClass, name: String) -> Bundle? {
    guard let path = Bundle(for: object).path(forResource: name, ofType: "bundle"), let bundle = Bundle(path: path) else { return nil }
    return bundle
}

public func bundleForXib<T: NSObject>(type: T.Type) -> Bundle {
    let defaultBundle = Bundle(for: T.classForCoder())
    let name = String(describing: type)

    if defaultBundle.has(xib: name) { return defaultBundle }
    
    if !Bundle.main.has(xib: name) {
        print("The xib named: " + name + " isn't in the resources bundle.")
    }
    return .main
}


public extension Bundle {
    func has(xib: String) -> Bool {
        return path(forResource: xib, ofType: "nib") != nil
    }
}

public protocol OptionalType {
    associatedtype Wrapped
    var optional: Wrapped? { get }
}

extension Optional: OptionalType {
    public var optional: Wrapped? { return self }
}

public extension Optional where Wrapped: Any {
    
    var isNull: Bool {
        return self == nil
    }
    
    func value(or defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }
}
