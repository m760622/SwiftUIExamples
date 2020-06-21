// https://github.com/m760622/SwiftUIExamples
//  TextMaskView.swift
//  FileMultiList
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-06-21.
//  Copyright © 2020 NMDS. All rights reserved.
// https://github.com/m760622


import SwiftUI

struct TextMaskView: View {
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                Text("Mask with Linear Gradient 20200621")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                    .background(Capsule().fill(Color.blue).opacity(0.7))

                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.green, Color.red, Color.green, Color.red, Color.green]),
                    startPoint: .top,
                    endPoint: .bottom)
                    .mask(
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Palestinians\nLives Matter")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                            Spacer()
                        }//HStack
                )//mask
                
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.blue, Color.red, Color.blue, Color.red ]),
                    startPoint: .top,
                    endPoint: .bottomTrailing)
                    .mask(
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Black\nLives\nMatter ")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                            Spacer()
                        }//HStack
                )//mask
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))]),
                               startPoint: .top, endPoint: .bottom)
                    .mask(
                        HStack{
                            Circle()
                            Rectangle()
                            Circle()
                        }
                )//mask

                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))]),
                               startPoint: .leading, endPoint: .trailing)
                    .mask(
                        HStack{
                            Circle()
                            Rectangle()
                            Circle()
                        }
                )//mask
                
            }//VStack
                .navigationBarTitle(Text("SwiftUI Arabic 2020") , displayMode: .inline)
        }//NavigationView
    }//body
}//TextMaskView

struct TextMaskView_Previews: PreviewProvider {
    static var previews: some View {
        //                    Color(.black)
        ForEach([
            ColorScheme.light,
            ColorScheme.dark
        ], id :\.self) { scheme in
            TextMaskView()
                .colorScheme(scheme)
        }
    }//previews
}//TextMaskView_Previews
