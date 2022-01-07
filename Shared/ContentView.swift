//
//  ContentView.swift
//  Shared
//
//  Created by pablo on 25/1/21.
//

import SwiftUI
import CoreData
import WidgetKit

struct ContentView: View {
    
    //    TextEditor is backed by UITextView. So you need to get rid of the UITextView's backgroundColor first and then you can set any View to the background.
        init() {
            UITextView.appearance().backgroundColor = .clear
        }

    
    let fonts = UIFont.familyNames.sorted()
    @State private var showFontPicker = false
    //
    @State private var rectangleColor: Color = Color.white
    @State private var rectangleRoundColor: Color = Color.white
    @State private var gradientColor1: Color = Color.white
    @State private var gradientColor2: Color = Color.white
    @State private var showGradient: Bool = false
    @State private var optionsBackground = ["Fill","Gradient"]
    @State private var indexSelected = 0
    @State private var hiddeBox = true
    
    
    //background shadow
    @State private var lightShadowColor: Color = Color("LightShadow")
    @State private var darkShadowColor: Color = Color("DarkShadow")
    //text property
    @State private var fontSelected: String = "Arial"
    @State private var textColorSelected: Color = Color.black
    @State private var textShadowColorSelected: Color = Color.gray
    @State private var textSizeSelected: CGFloat = 10
    @State private var inputTextSelected: String = "insert here your quote"
    
    @State private var rectacgleWidth: CGFloat = 300
    @State private var rectacgleHeight: CGFloat = 300
    @State private var textWidth: CGFloat = 100
    @State private var textHeight: CGFloat = 200
    @State private var maxLines: Int = 2
    
    @State var sizeSelect = "large"
    @State var smallSelected = false
    @State var mediumSelected = false
    @State var largeSelected = false
    
    //images
    @State var showPhotoPicker1 = false
    @State var showPhotoPicker2 = false
    @State var showPhotoPicker3 = false
    @State var picture1UI = UIImage(imageLiteralResourceName: "imgDefault")
    @State var picture2UI = UIImage(imageLiteralResourceName: "imgDefault")
    @State var picture3UI = UIImage(imageLiteralResourceName: "imgDefault")
    @State var showPic1 = false
    @State var showPic2 = false
    @State var showPic3 = false
    @State var imageShadow = Color.black
    @State var imageBorder = Color(red: 51/255, green: 50/255, blue: 51/255)

    var body: some View {
        
        GeometryReader{ geometry in
            ZStack{
                VStack{
                    VStack{
                        
                        //boton save y restore
                        HStack{
                            Button(action:{
                                UIApplication.shared.endEditing()
                                guardarConfiguracion()
                            }){
                                Text("Save Changes")
                            }.buttonStyle(GradientButtonStyle(colorGradient: Gradient(colors: [Color.green, Color.orange])))
                            
                            Spacer()
                            Button(action:{
                                self.textColorSelected = Color.black
                                self.textSizeSelected = 15
                                self.textShadowColorSelected = Color.gray
                                self.lightShadowColor = Color("LightShadow")
                                self.darkShadowColor = Color("DarkShadow")
                                self.rectangleColor = Color.white
                                self.rectangleRoundColor = Color.white
                                self.sizeSelect = "medium"
                                self.showGradient = false
                                self.showPic1 = false
                                self.imageShadow = Color.black
                                self.imageBorder = Color(red: 51/255, green: 50/255, blue: 51/255)
                                
                            }){
                                Text("Restore")
                            }.buttonStyle(GradientButtonStyle(colorGradient: Gradient(colors: [Color.red, Color.blue])))
                        }.padding()
                        //marco

                        Divider()
                        Button(action:{
                            withAnimation(.easeIn(duration: 0.8)){
                              hiddeBox.toggle()
                            }
//                            switch sizeSelect{
//                            case "small":
//                                widgetSmall(width: geometry.size.width, height: geometry.size.height)
//                            case "medium":
//                                widgetMedium(width: geometry.size.width, height: geometry.size.height)
//                            case "large":
//                                widgetLarge(width: geometry.size.width, height: geometry.size.height)
//                            default:
//                                widgetMedium(width: geometry.size.width, height: geometry.size.height)
//
//                            }
                        }){
                            HStack{
                                Text(hiddeBox ? "Show text Box" : "Hide Text Editor")
                                Image(systemName: hiddeBox ? "arrow.down.to.line" : "arrow.up.to.line")
                            }.foregroundColor( hiddeBox ? .gray : .red)
                        }
                        
//                        if !hiddeBox{
//
//                            VStack{
//                                HStack{
//                                    Button(action:{
//                                        widgetSmall(width: geometry.size.width, height: geometry.size.height)
//                                    }){
//                                        btnFamilySize(text: "Small", selected: smallSelected)
//                                    }
//
//                                    Button(action:{
//                                        widgetMedium(width: geometry.size.width, height: geometry.size.height)
//
//                                    }){
//                                        btnFamilySize(text: "Medium", selected: mediumSelected)
//                                    }
//
//                                    Button(action:{
//                                        widgetLarge(width: geometry.size.width, height: geometry.size.height)
//
//
//                                    }){
//                                        btnFamilySize(text: "Large", selected: largeSelected)
//                                    }
//                                }.padding(.top, 10)
//
//
//                                ZStack{
//                                    RectangleNeumorphis(rectWidth: rectacgleWidth,
//                                                        rectHeight: rectacgleHeight,
//                                                        lightShadow: lightShadowColor,
//                                                        darkShadow: darkShadowColor,
//                                                        rectangleColor: rectangleColor,
//                                                        rectangleRoundedColor: rectangleRoundColor)
//                                        //.animation(.easeIn(duration: 5))
//                                    TextEditor(text: $inputTextSelected)
//                                        .font(.custom(fontSelected, size: textSizeSelected))//TODO comprobar opcion de shadow en .custom
//                                        .foregroundColor(textColorSelected)
//                                        .frame(width: textWidth, height: textHeight)
//                                        //.shadow(color: textShadowColorSelected, radius: 2, x: 3, y: 3)
//                                        .multilineTextAlignment(.center)
//                                        .background(rectangleRoundColor)
//                                }.padding()
//                            }
//                            //.animation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0.5))
//
//
//                        }

                        if !hiddeBox{
                            ZStack{
                                RectangleNeumorphis(rectWidth: geometry.size.width / 1.15,
                                                    rectHeight: geometry.size.height / 4.2,
                                                    lightShadow: lightShadowColor,
                                                    darkShadow: darkShadowColor,
                                                    rectangleColor: rectangleColor,
                                                    rectangleRoundedColor: rectangleRoundColor)
                                    //.animation(.easeIn(duration: 5))
                                TextEditor(text: $inputTextSelected)
                                    .font(.custom(fontSelected, size: textSizeSelected))//TODO comprobar opcion de shadow en .custom
                                    .foregroundColor(textColorSelected)
                                    .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 4.6)
                                    //.shadow(color: textShadowColorSelected, radius: 2, x: 3, y: 3)
                                    .multilineTextAlignment(.center)
                                    .background(rectangleRoundColor)
                            }.padding()
                        }


                        
                        //font
                        Divider()
                        Button(action: {
                            withAnimation(.easeOut(duration: 0.8)){
                            self.showFontPicker.toggle()
                            }
                        }, label: {
                            HStack{
                                Text(showFontPicker ? "Hide Font List":  "Show Font List")
                                Image(systemName: showFontPicker ? "arrow.up.to.line" : "arrow.down.to.line")
                            }.foregroundColor(showFontPicker ? .red : .gray)

                        }).padding(.top, 5)
                        if showFontPicker{
                            Picker(selection: $fontSelected, label: Text("Fonts"), content: {
                                ForEach(fonts, id: \.self){font in
                                    Text(font)
                                        .font(.custom(font, size: 20))
                                }
                            })
                        }
                    }
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                    
                    
                    
                    
                    Form{
                        Section(header: Text("Quote")){
                            VStack(alignment: .leading){
                                
                                //                                    TextField("insert text", text: $inputTextSelected)
                                //                                    Divider()
                                Text("Text size: \(Int(textSizeSelected))")
                                Slider(value: $textSizeSelected, in: 10...200, step: 2)
                                
                                colorPickerView(title: "Text Color", colorSelected: $textColorSelected, colorDefault: Color.black)
                                colorPickerView(title: "Text Shadow Color", colorSelected: $textShadowColorSelected, colorDefault: Color.gray)
                            }
                        }
                        
                        Section(header: Text("Background")){
                            VStack{
                                
                                Picker("optionsBackground", selection: $indexSelected){
                                    ForEach(0..<optionsBackground.count){index in
                                        Text(self.optionsBackground[index]).tag(index)
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                
                                if optionsBackground[indexSelected] == "Gradient"{
                                    ColorPicker("Gradient color 1", selection: $gradientColor1)
                                    ColorPicker("Gradient color 2", selection: $gradientColor2)
                                }
                                else{
                                    ColorPicker("Background color", selection: $rectangleRoundColor)
                                }
                            }
                        }
                        
                        Section(header: Text("Shadows")){
                            ColorPicker("Up Shadow Color", selection: $lightShadowColor)
                            ColorPicker("Down Shadow Color", selection: $darkShadowColor)
                        }
                        
                        Section(header: Text("Images")){
                            VStack{
                                ColorPicker("Image border color", selection: $imageBorder)
                                
                                ColorPicker("Image shadow color", selection: $imageShadow)
                                
                            }
                        }
                        
                        Section(header: Text("Picture")){
                                HStack{
                                    Image(uiImage: picture1UI)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: geometry.size.height / 8)
                                        .clipShape(Circle())
                                        .padding(2)
                                        .onTapGesture{
                                            self.showPhotoPicker1.toggle()
                                        }
                                        .sheet(isPresented: $showPhotoPicker1){
                                            ImagePicker(selectedImage: self.$picture1UI)
                                        }
                                    Spacer()
                                    Toggle(isOn: $showPic1){
                                        Text("")
                                    }
                                }
                            
                        }
                        
                    }
                    
                }
            }
        }.onAppear{
            print("cita-- \(Helper.getQuoteWidget())")
            if let userDefaults = UserDefaults(suiteName: appGroupName) {
                inputTextSelected = userDefaults.string(forKey: quoteKey) ?? "Insert here your Quote"
                textSizeSelected = userDefaults.value(forKey: textSizeKey) as? CGFloat ?? 20
                fontSelected = userDefaults.string(forKey: fontTextKey) ?? "Arial"
                sizeSelect = userDefaults.string(forKey: sizeRectSelectKey) ?? "large"
                //text color
                if let colorTextData: Data = userDefaults.data( forKey: textColorKey){
                    textColorSelected =  decodeColorData(colorData: colorTextData)
                     }
                //text shadow color
                if let colorTextShadowData: Data = userDefaults.data( forKey: textShadowKey){
                    textShadowColorSelected =  decodeColorData(colorData: colorTextShadowData)
                     }
                //rectangles colors
                if let colorRectangle: Data = userDefaults.data(forKey: rectColorKey){
                    rectangleColor = decodeColorData(colorData: colorRectangle)
                }
                if let colorRectRound: Data = userDefaults.data(forKey: rectRoundColorKey){
                    rectangleRoundColor = decodeColorData(colorData: colorRectRound)
                }
                
                if let gradient1: Data = userDefaults.data(forKey: gradientColor1Key){
                    gradientColor1 = decodeColorData(colorData: gradient1)
                }
                if let gradient2: Data = userDefaults.data(forKey: gradientColor2Key){
                    gradientColor2 = decodeColorData(colorData: gradient2)
                }
                showGradient = userDefaults.bool(forKey: showGradientKey)
                if showGradient {
                    indexSelected = 1
                }
                else{
                    indexSelected = 0
                }
                
                //shadows rectangles
                if let colorUpShadow: Data = userDefaults.data(forKey: upShadowColorKey){
                    lightShadowColor = decodeColorData(colorData: colorUpShadow)
                }
                if let colorDownShadow: Data = userDefaults.data(forKey: downShadowColorKey){
                    darkShadowColor = decodeColorData(colorData: colorDownShadow)
                }
                //images
                
                if let colorImageShadowData: Data = userDefaults.data( forKey: imageShadowKey){
                    imageShadow =  decodeColorData(colorData: colorImageShadowData)
                     }
                
                if let colorImageBorderData: Data = userDefaults.data( forKey: imageBorderKey){
                    imageBorder =  decodeColorData(colorData: colorImageBorderData)
                     }
                
                if let colorTextShadowData: Data = userDefaults.data( forKey: textShadowKey){
                    textShadowColorSelected =  decodeColorData(colorData: colorTextShadowData)
                     }
                
                showPic1 = userDefaults.bool(forKey: pic1AllowKey)
                
                if let picture1Data = userDefaults.data(forKey: picture1Key) {
                    let data1 = try! JSONDecoder().decode(Data.self, from: picture1Data)
                    picture1UI = UIImage(data: data1) ?? UIImage(imageLiteralResourceName: "imgDefault")
                    }

            }
        }
    }
    
    func guardarConfiguracion(){
    
        if let userDefaults = UserDefaults(suiteName: appGroupName) {
            let domain = Bundle.main.bundleIdentifier!
            userDefaults.removePersistentDomain(forName: domain)
            userDefaults.setValue(inputTextSelected, forKey: quoteKey)
            userDefaults.setValue(textSizeSelected, forKey: textSizeKey)
            userDefaults.setValue(fontSelected, forKey: fontTextKey)
            userDefaults.setValue(encodeColor(color: textColorSelected), forKey: textColorKey)
            userDefaults.setValue(encodeColor(color: textShadowColorSelected), forKey: textShadowKey)
            userDefaults.setValue(encodeColor(color: rectangleColor), forKey: rectColorKey)
            userDefaults.setValue(encodeColor(color: rectangleRoundColor), forKey: rectRoundColorKey)
            if indexSelected == 0{
                showGradient = false
            }
            else{
                showGradient = true
            }
            userDefaults.setValue(showGradient, forKey: showGradientKey)
            userDefaults.setValue(encodeColor(color: gradientColor1), forKey: gradientColor1Key)
            userDefaults.setValue(encodeColor(color: gradientColor2), forKey: gradientColor2Key)
            
            userDefaults.setValue(encodeColor(color: lightShadowColor), forKey: upShadowColorKey)
            userDefaults.setValue(encodeColor(color: darkShadowColor), forKey: downShadowColorKey)
            userDefaults.setValue(sizeSelect, forKey: sizeRectSelectKey)
            
            //images
            userDefaults.setValue(encodeColor(color: imageShadow), forKey: imageShadowKey)
            userDefaults.setValue(encodeColor(color: imageBorder), forKey: imageBorderKey)
           
            //Image 1
            userDefaults.setValue(showPic1, forKey: pic1AllowKey)
            let imagenUIRedimensionada = resizeImage(image: picture1UI)
            guardarImagenSeleccionada(key: picture1Key, image: imagenUIRedimensionada)
            
            userDefaults.synchronize()
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    
    func guardarImagenSeleccionada(key: String, image: UIImage){
        if let userDefaults = UserDefaults(suiteName: appGroupName){
            let imageData =  image.jpegData(compressionQuality: 0.5)
            let data = try! JSONEncoder().encode(imageData)
            userDefaults.setValue(data, forKey: key)
        }

    }
    
    func guardarImagenDefecto(key: String){
        if let userDefaults = UserDefaults(suiteName: appGroupName){
            let imageData =  UIImage(imageLiteralResourceName: "imgDefault").pngData()
            let data = try! JSONEncoder().encode(imageData)
            userDefaults.setValue(data, forKey: key)
        }

    }
    
    func widgetSmall(width: CGFloat, height: CGFloat){
        self.smallSelected = true
        self.mediumSelected = false
        self.largeSelected = false
        UIApplication.shared.endEditing()
        rectacgleWidth = CGFloat(width / 2.1)
        rectacgleHeight = CGFloat(height / 3.8)
        textWidth = width / 2.45
        textHeight = height / 4.2
        sizeSelect = "small"
    }

    func widgetMedium(width: CGFloat, height: CGFloat){
        self.smallSelected = false
        self.mediumSelected = true
        self.largeSelected = false
        UIApplication.shared.endEditing()
        rectacgleWidth = CGFloat(width / 1.2)
        rectacgleHeight = CGFloat(height / 4.2)
        textWidth = width / 1.3
        textHeight = height / 4.6
        sizeSelect = "medium"
    }

    func widgetLarge(width: CGFloat, height: CGFloat){
        self.smallSelected = false
        self.mediumSelected = false
        self.largeSelected = true
        UIApplication.shared.endEditing()
        rectacgleWidth = CGFloat(width / 1.2)
        rectacgleHeight = CGFloat(height / 2.1)
        textWidth = width / 1.35
        textHeight = height / 2.3
        sizeSelect = "large"
    }



}

struct GradientButtonStyle: ButtonStyle {
    var colorGradient: Gradient
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: colorGradient, startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 1.1 : 0.8 )
            //.background(configuration.isPressed ? Color.green : Color.yellow)
    }
}

struct colorPickerView: View {
    var title: String
    @Binding var colorSelected: Color
    var colorDefault: Color
    
    var body: some View{
        HStack{
            ColorPicker(title, selection: $colorSelected)
        }
    }
}

struct btnFamilySize: View{
    var text: String
    var selected: Bool
    
    var body: some View{
        Text(text)
            .padding(5)
            .background(selected ? Color.orange : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

