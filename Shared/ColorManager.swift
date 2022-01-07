//
//  ColorManager.swift
//  MyQuote
//
//  Created by pablo on 2/2/21.
//


#if os(iOS)
import UIKit
import SwiftUI
#endif
#if os(macOS)
import Foundation
#endif

struct ColorData: Codable {
    var r: Double
    var g: Double
    var b: Double
    var a: Double
  }

class ColorManager: NSObject, ObservableObject{
    
}

func encodeColor(color: Color) -> Data{
    
    let uiColor = UIColor(color)
    var (r, g, b, a) = (CGFloat.zero, CGFloat.zero, CGFloat.zero, CGFloat.zero)
    uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
    
    if let encoded = try? JSONEncoder().encode(ColorData(r: Double(r), g: Double(g), b: Double(b), a: Double(a))){
        return encoded
    }
    
    return Data(count: 0)
    
}

func decodeColorData(colorData: Data)-> Color{
    guard let decoded = try? JSONDecoder().decode(ColorData.self, from: colorData) else { return Color(.purple) }
    
    return Color(.sRGB, red: decoded.r, green: decoded.g, blue: decoded.b, opacity: decoded.a)
}



