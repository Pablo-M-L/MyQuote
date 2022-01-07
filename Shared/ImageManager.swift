//
//  ImageManager.swift
//  MyQuote
//
//  Created by pablo on 3/2/21.
//

import SwiftUI
import WidgetKit

class ImageManager: NSObject, ObservableObject{
    
    @Published var photos = [String]()
    
    // MARK: - SETUP
    override init() {
        super.init()
        
       // photos = Helper.getImageIdsFromUserDefault()
    }
    
    func guararQuote(quote: String){
        if let userDefaults = UserDefaults(suiteName: appGroupName){
            userDefaults.setValue(quote, forKey: quoteKey)
        }
        
    }
    
//    func appendImage(image: UIImage) {
//        
//        // Save image in userdefaults
//        if let userDefaults = UserDefaults(suiteName: appGroupName) {
//            
//            if let jpegRepresentation = image.jpegData(compressionQuality: 0.5) {
//                
//                let id = UUID().uuidString
//                userDefaults.set(jpegRepresentation, forKey: id)
//                
//                // Append the list and save
//                photos.append(id)
//                saveIntoUserDefaults()
//                
//                // Notify the widget to reload all items
//                WidgetCenter.shared.reloadAllTimelines()
//            }
//        }
//    }
//    
//    private func saveIntoUserDefaults() {
//        if let userDefaults = UserDefaults(suiteName: appGroupName) {
//            
//            let data = try! JSONEncoder().encode(photos)
//            userDefaults.set(data, forKey: userDefaultsPhotosKey)
//        }
//        
//        WidgetCenter.shared.reloadAllTimelines()
//    }
}
