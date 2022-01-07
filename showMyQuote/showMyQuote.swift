//
//  showMyQuote.swift
//  showMyQuote
//
//  Created by pablo on 26/1/21.
//

import WidgetKit
import SwiftUI
import CoreData

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let entry = SimpleEntry(date: Date())
        
        entries.append(entry)
        
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    
}

struct showMyQuoteEntryView : View {
    @Environment(\.widgetFamily) var family
    
    var entry: Provider.Entry
    
    var body: some View {
        GeometryReader{ geometry in
                    switch family{
                        case .systemSmall:
                            ZStack{
                                ZStack {
                                    Rectangle()
                                        .fill(Helper.getRectColorWidget())
                                        .frame(width: .infinity, height: .infinity)
                                        .edgesIgnoringSafeArea(.all)
                                    if Helper.getShowGradientWidget(){
                                        RoundedRectangle(cornerRadius: 18)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Helper.getGradientColor1Widget(),
                                                        Helper.getGradientColor2Widget()
                                                    ]),
                                                    startPoint: .top,
                                                    endPoint: .bottom)
                                            )
                                            .frame(width: geometry.size.width/1.05, height: geometry.size.height/1.07)
                                            .shadow(color: Helper.getUpShadowWidget(), radius: 8, x: -8, y: -8)
                                            .shadow(color: Helper.getDownShadowWidget(), radius: 8, x: 8, y: 8)
                                    }
                                    else{
                                        RoundedRectangle(cornerRadius: 18)
                                            .fill(Helper.getRecRoundColorWidget())
                                            .frame(width: geometry.size.width/1.05, height: geometry.size.height/1.07)
                                            .shadow(color: Helper.getUpShadowWidget(), radius: 8, x: -8, y: -8)
                                            .shadow(color: Helper.getDownShadowWidget(), radius: 8, x: 8, y: 8)
                                    }

                                }
                                imageCircle(divisor: 1.2, width: geometry.size.width / 1.2, height: geometry.size.height, image: Helper.getPic1Widget())
                                    .opacity(Helper.getShowPic1Widget() ? 1 : 0)
                                    
                                
                                Text(Helper.getQuoteWidget())
                                    .frame(width: geometry.size.width/1.1, height: geometry.size.height/1.1)
                                    .font(.custom(Helper.getFontTextWidget(), size:  Helper.getTextSizeWidget()))
                                    .foregroundColor(Helper.getTextColorWidget())
                                    .shadow(color: Helper.getTextShadowWidget(), radius: 2, x: 2.5, y: 4)
                                    .multilineTextAlignment(.center)
                                    .padding(5)
                            }
                        case .systemMedium:
                            ZStack{
                                ZStack{
                                    Rectangle()
                                        .fill(Helper.getRectColorWidget())
                                        .frame(width: .infinity, height: .infinity)
                                        .edgesIgnoringSafeArea(.all)
                                    
                                    if Helper.getShowGradientWidget(){
                                        RoundedRectangle(cornerRadius: 18)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Helper.getGradientColor1Widget(),
                                                        Helper.getGradientColor2Widget()
                                                    ]),
                                                    startPoint: .top,
                                                    endPoint: .bottom)
                                            )
                                            .frame(width: geometry.size.width/1.05, height: geometry.size.height/1.07)
                                            .shadow(color: Helper.getUpShadowWidget(), radius: 8, x: -8, y: -8)
                                            .shadow(color: Helper.getDownShadowWidget(), radius: 8, x: 8, y: 8)
                                    }
                                    else{
                                        RoundedRectangle(cornerRadius: 18)
                                            .fill( Helper.getRecRoundColorWidget())
                                            .frame(width: geometry.size.width/1.05, height: geometry.size.height/1.07)
                                            .shadow(color: Helper.getUpShadowWidget(), radius: 8, x: -8, y: -8)
                                            .shadow(color: Helper.getDownShadowWidget(), radius: 8, x: 8, y: 8)
                                    }
                  
                                }
                                HStack{
                                    VStack(alignment: .center){
                                            imageCircle(divisor: 1, width: geometry.size.width / 3, height: geometry.size.height / 1.5, image: Helper.getPic1Widget())
                                        }.padding(.top, 5)
                                        .padding([.leading, .trailing], 15)
                                        .opacity(Helper.getShowPic1Widget() ? 1 : 0)
                                    Spacer()
                                }

                                Text(Helper.getQuoteWidget())
                                    .frame(width: Helper.getShowPic1Widget() ?  geometry.size.width/1.7 : .infinity, height: geometry.size.height/1.1)
                                    .font(.custom(Helper.getFontTextWidget(), size:  Helper.getTextSizeWidget()))
                                    .foregroundColor(Helper.getTextColorWidget())
                                    .shadow(color: Helper.getTextShadowWidget(), radius: 2, x: 2.5, y: 4)
                                    .multilineTextAlignment(Helper.getShowPic1Widget() ? .center : .center)
                                    .padding(.top, 10)
                                    .padding(.leading, Helper.getShowPic1Widget() ? geometry.size.width / 2.8 : 10)
                            }.frame(width: .infinity, height: .infinity)
                            
                        case .systemLarge:
                            ZStack{

                                ZStack {
                                    Rectangle()
                                        .fill(Helper.getRectColorWidget())
                                        .frame(width: .infinity, height: .infinity)
                                        .edgesIgnoringSafeArea(.all)
                                    
                                    if Helper.getShowGradientWidget(){
                                        RoundedRectangle(cornerRadius: 18)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Helper.getGradientColor1Widget(),
                                                        Helper.getGradientColor2Widget()
                                                    ]),
                                                    startPoint: .top,
                                                    endPoint: .bottom)
                                            )
                                            .frame(width: geometry.size.width/1.05, height: geometry.size.height/1.05)
                                            .shadow(color: Helper.getUpShadowWidget(), radius: 8, x: -8, y: -8)
                                            .shadow(color: Helper.getDownShadowWidget(), radius: 8, x: 8, y: 8)
                                    }
                                    else{
                                        RoundedRectangle(cornerRadius: 18)
                                            .fill( Helper.getRecRoundColorWidget())
                                            .frame(width: geometry.size.width/1.05, height: geometry.size.height/1.05)
                                            .shadow(color: Helper.getUpShadowWidget(), radius: 8, x: -8, y: -8)
                                            .shadow(color: Helper.getDownShadowWidget(), radius: 8, x: 8, y: 8)
                                    }
                                }
                                    VStack{
                                        HStack{
                                            Spacer()
                                            imageCircle(divisor: 2.5, width: geometry.size.width / 2, height: geometry.size.height, image: Helper.getPic1Widget())
                                            Spacer()

                                            
                                        }.padding(.top, 20)
                                         .padding([.leading, .trailing], 45)
                                        .opacity(Helper.getShowPic1Widget() ? 1 : 0)
                                        Spacer()
                                    }
                                
                                Text(Helper.getQuoteWidget())
                                    .padding(.top, Helper.getShowPic1Widget() ? 47 : 10)
                                    .frame(width: geometry.size.width/1.1, height: geometry.size.height/1.1)
                                    .font(.custom(Helper.getFontTextWidget(), size:  Helper.getTextSizeWidget()))
                                    .foregroundColor(Helper.getTextColorWidget())
                                    .shadow(color: Helper.getTextShadowWidget(), radius: 2, x: 2.5, y: 2.5)
                                    .multilineTextAlignment(.center)
                                    .padding([.leading, .trailing], 5)
                                }

                        @unknown default:
                            fatalError()
                    }
        }
        
    }
}

struct imageCircle: View{
    var divisor: CGFloat
    var width: CGFloat
    var height: CGFloat
    var image: UIImage
    var colorsGradient = Gradient(colors: [Helper.getImageBorderColorWidget(), Color("LightShadow").opacity(0.85),Helper.getImageBorderColorWidget(),Helper.getImageBorderColorWidget(),Helper.getImageBorderColorWidget(),Color("LightShadow").opacity(0.85)])
    
    var body: some View{
        
        Image(uiImage: image)
            .resizable()
            .frame(width: width, height: height / divisor)
            .cornerRadius(29)
            .scaledToFit()
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                    .stroke(LinearGradient(gradient: colorsGradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 8)
            )
            .shadow(color: Helper.getImageShadowWidget(), radius: 2, x: 1.8, y: 2.8)
        

            
    }
    
}


@main
struct showMyQuote: Widget {
    let kind: String = "showMyQuote"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            showMyQuoteEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct showMyQuote_Previews: PreviewProvider {
    static var previews: some View {
        showMyQuoteEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
