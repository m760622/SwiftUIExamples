//
//  AnimatedCapsuleMenuView.swift
//  FileMultiList
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-06-18.
//  Copyright © 2020 NMDS. All rights reserved.
// https://github.com/m760622
// AnimatedSideMenuView



import SwiftUI

struct AnimatedCapsuleMenuView: View {
    @State private var isMenuCollapsed = true
    @State private var menuItemVisible = false
    @State private var imageName = "moon"
    
    var body: some View {
        VStack(){
            Spacer()
            Group{
                Text("قائمة أزرار مع الحركة")
                Text("Animated Capsule Menu View")
            }
            .font(.headline)
            .padding(.leading, 40 )
            .padding(.trailing, 40)
            .foregroundColor(.white)
//            .padding()
            .background(Capsule().fill(Color.blue))
            .padding()
            Spacer()
            Image(systemName: imageName)
                .resizable().frame(width: 200, height: 200)
            Spacer()
            HStack () {
                Group {
                    Spacer()
                    Button(action:{
                        self.buttonVisibleFn()
                        self.imageName = "pencil"
                    }){
                        Image(systemName: "pencil")
                    }//Button
                    Spacer()
                    Button(action:{
                        self.buttonVisibleFn()
                        self.imageName = "scribble"
                    }){
                        Image(systemName: "scribble")
                    }//Button
                    Spacer()
                    Button(action:{
                        self.buttonVisibleFn()
                        self.imageName = "lasso"
                    }){
                        Image(systemName: "lasso")
                    }//Button
                    Spacer()
                }//Group
                    .opacity(menuItemVisible ? 1 : 0)
                Button(action: {
                    self.buttonVisibleFn()
                }) {
                    Image(systemName: "line.horizontal.3.decrease")
                        .rotationEffect(.degrees(-90))
                }
                .offset(x: 50)
            }//HStack
                .padding(20)
                .padding(.leading, 40)
                .padding(.trailing, 40)
                .foregroundColor(.white)
                .background(Capsule().fill(Color.blue))
                .font(.largeTitle)
                .offset(x: isMenuCollapsed ? -320 : -70)
            
        }//VStack
    }//body
    
    fileprivate func buttonVisibleFn() {
        withAnimation(Animation.interpolatingSpring(stiffness: 50, damping: 5))
        {
            self.isMenuCollapsed.toggle()
        }
        withAnimation(Animation.interpolatingSpring(stiffness: 50, damping:5)) {
            self.menuItemVisible.toggle()
        }
    }//buttonVisibleFn
}//AnimatedCapsuleMenuView

struct AnimatedCapsuleMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedCapsuleMenuView()
    }
}



