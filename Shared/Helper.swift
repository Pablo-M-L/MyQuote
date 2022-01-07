//
//  Helper.swift
//  MyQuote
//
//  Created by pablo on 2/2/21.
//

import Foundation
import SwiftUI

let appGroupName = "group.PABLOMILLANLOPEZ.To-Do"
let textSizeKey = "textSize"
let quoteKey = "qoute"
let fontTextKey = "fontTextKey"
let textColorKey = "textColor"
let textShadowKey = "textShadow"
let rectColorKey = "rectagleColor"
let rectRoundColorKey = "rectRoundColor"
let showGradientKey = "showGradient"
let gradientColor1Key = "gradientColor1"
let gradientColor2Key = "gradientColor2"
let upShadowColorKey = "upShadowColor"
let downShadowColorKey = "downShadowColor"
let sizeRectSelectKey = "sizeRect"
let picture1Key = "picture1"
let picture2Key = "picture2"
let picture3Key = "picture3"
let pic1AllowKey = "pic1Allow"
let pic2AllowKey = "pic2Allow"
let pic3AllowKey = "pic3Allow"
let imageShadowKey = "imageShadow"
let imageBorderKey = "imageBorder"


struct Helper{
    static func getQuoteWidget() -> String{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            return userDefault.string(forKey: quoteKey) ?? "Quote Is Empty"
        }
        return "quote empty"
    }
    
    static func getTextSizeWidget() -> CGFloat{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            return userDefault.value(forKey: textSizeKey) as? CGFloat ?? 20
        }
        return 20
    }
    
    static func getFontTextWidget() -> String{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            return userDefault.string(forKey: fontTextKey) ?? "Arial"
        }
        return "Arial"
    }
    
    static func getTextShadowWidget() -> Color{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let colorTextData: Data = userDefault.data( forKey: textShadowKey){
                return  decodeColorData(colorData: colorTextData)
                 }
        }
        return Color.gray
    }
    
    //Colors
    static func getTextColorWidget() -> Color{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let colorTextData: Data = userDefault.data( forKey: textColorKey){
                return  decodeColorData(colorData: colorTextData)
                 }
        }
        return Color.black
    }
    
    static func getRectColorWidget() -> Color{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let colorTextData: Data = userDefault.data( forKey: rectColorKey){
                return  decodeColorData(colorData: colorTextData)
                 }
        }
        return Color.white
    }
    
    static func getRecRoundColorWidget() -> Color{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let colorTextData: Data = userDefault.data( forKey: rectRoundColorKey){
                return  decodeColorData(colorData: colorTextData)
                 }
        }
        return Color.white
    }
    
    static func getShowGradientWidget() -> Bool{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            return userDefault.bool(forKey: showGradientKey)
        }
        return false
    }
    
    static func getGradientColor1Widget() -> Color{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let colorTextData: Data = userDefault.data( forKey: gradientColor1Key){
                return  decodeColorData(colorData: colorTextData)
                 }
        }
        return Color.white
    }
    
    static func getGradientColor2Widget() -> Color{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let colorTextData: Data = userDefault.data( forKey: gradientColor2Key){
                return  decodeColorData(colorData: colorTextData)
                 }
        }
        return Color.white
    }
    
    static func getUpShadowWidget() -> Color{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let colorTextData: Data = userDefault.data( forKey: upShadowColorKey){
                return  decodeColorData(colorData: colorTextData)
                 }
        }
        return Color("LightShadow")
    }
    
    static func getImageShadowWidget() -> Color{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let colorShadowData: Data = userDefault.data( forKey: imageShadowKey){
                return  decodeColorData(colorData: colorShadowData)
                 }
        }
        return Color.gray
    }
    
    static func getImageBorderColorWidget() -> Color{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let colorData: Data = userDefault.data( forKey: imageBorderKey){
                return  decodeColorData(colorData: colorData)
                 }
        }
        return Color.orange
    }
    
    static func getDownShadowWidget() -> Color{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let colorTextData: Data = userDefault.data( forKey: downShadowColorKey){
                return  decodeColorData(colorData: colorTextData)
                 }
        }
        return Color("DarkShadow")
    }
    
    
    //Images
    static func getPic1Widget() -> UIImage{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let picture1Data = userDefault.data(forKey: picture1Key) {
                let data1 = try! JSONDecoder().decode(Data.self, from: picture1Data)
                return UIImage(data: data1) ?? UIImage(imageLiteralResourceName: "imgDefaultWidget")
                }
        }
        
        return UIImage(imageLiteralResourceName: "imgDefaultWidget")
    }
    
    static func getPic2Widget() -> UIImage{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let picture2Data = userDefault.data(forKey: picture2Key) {
                let data2 = try! JSONDecoder().decode(Data.self, from: picture2Data)
                return UIImage(data: data2) ?? UIImage(imageLiteralResourceName: "imgDefaultWidget")
                }
        }
        
        return UIImage(imageLiteralResourceName: "imgDefaultWidget")
    }
    
    static func getPic3Widget() -> UIImage{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            if let picture3Data = userDefault.data(forKey: picture3Key) {
                let data3 = try! JSONDecoder().decode(Data.self, from: picture3Data)
                return UIImage(data: data3) ?? UIImage(imageLiteralResourceName: "imgDefaultWidget")
                }
        }
        
        return UIImage(imageLiteralResourceName: "imgDefaultWidget")
    }
    
    static func getShowPic1Widget() -> Bool{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            return userDefault.bool(forKey: pic1AllowKey)
        }
        return false
    }
    
    static func getShowPic2Widget() -> Bool{
        if let userDefault = UserDefaults(suiteName: appGroupName){
            return userDefault.bool(forKey: pic2AllowKey)
        }
        return false
    }
    
    static func comprobarSiMuestraFoto()-> Bool{
        if getShowPic1Widget() || getShowPic2Widget(){
            return true
        }
        else{
            return false
        }
        
    }
}


func resizeImage(image: UIImage)->UIImage{
    
    let originalSize = image.size
    //obtener factor de escalado
    let witdhRatio = 250 / originalSize.width
    let heightRatio = 250 / originalSize.height
    
    let targerRatio = max(witdhRatio, heightRatio)
    let newSize = CGSize(width: originalSize.width * targerRatio, height: originalSize.height * targerRatio)
    
    //definir el rectangulo. (la zona donde se va a renderizar)
    let rectImagen = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rectImagen)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    //destapar nuevaImagen que es UIImage?
    guard let nuevaImagen = newImage else {
        return image
    }
    return nuevaImagen
    
}

func imgDataWidget()-> UIImage{
    if let userDefaults = UserDefaults(suiteName: appGroupName){
        if let picture3Data = userDefaults.data(forKey: picture3Key) {
            let data3 = try! JSONDecoder().decode(Data.self, from: picture3Data)
            let imageUI = UIImage(data: data3) ?? UIImage(imageLiteralResourceName: "imgDefault")
            return imageUI
        }
    }
    return UIImage(imageLiteralResourceName: "imgDefault")
}

//para ocultar teclado
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct RectangleNeumorphis: View {
    
    var rectWidth: CGFloat
    var rectHeight: CGFloat
    var lightShadow: Color
    var darkShadow: Color
    var rectangleColor: Color
    var rectangleRoundedColor: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(rectangleColor)
                .frame(width: rectWidth, height: rectHeight)
                .edgesIgnoringSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(rectangleRoundedColor)
                .frame(width: rectWidth, height: rectHeight)
                .shadow(color: lightShadow, radius: 8, x: -8, y: -8)
                .shadow(color: darkShadow, radius: 8, x: 8, y: 8)
        }
    }
}
