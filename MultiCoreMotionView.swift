//
//  MultiCoreMotionView.swift
//  FileMultiList
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-06-19.
//  Copyright © 2020 NMDS. All rights reserved.
// https://github.com/m760622

import SwiftUI
import CoreMotion

struct MultiCoreMotionView: View {
    @State private var motionManagerD: Double = 0
    var body: some View {
        VStack{
            Text("Multi Core MotionView View with Animation")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .background(Color.blue)
                .padding()
            Text("Opacity")
                .font(.largeTitle)
                .frame(width: 190, height: 50)
                .foregroundColor(.white)
                .background(Rectangle().fill(Color.blue))
                .modifier(MotionOpacityModifier(magnitude: 1))
                .padding()
            Text("Corner Radius")
                .font(.largeTitle)
                .frame(width: 130, height: 130)
                .foregroundColor(.white)
                .background(Rectangle().fill(Color.blue).opacity(0.5))
                .modifier(MotionCornerRadiusModifier(magnitude: 100))
            Text("OffSet")
                .font(.largeTitle)
                .padding(.leading, 40 )
                .padding(.trailing, 40)
                .foregroundColor(.white)
                .background(Capsule().fill(Color.blue).opacity(0.7))
                .padding()
                .modifier(MotionOffSetModifier(magnitude: 100))
            Spacer()
            Spacer()
            Group{
                Text("Scal")
            }
            .font(.body)
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
            .background(Circle().fill(Color.blue).opacity(0.9))
            .modifier(MotionScalModifier(magnitude: 1.9))
            Spacer()
        }//VStack
    }//body
}//MultiCoreMotionView

struct CircleCoreMotionView_Previews: PreviewProvider {
    static var previews: some View {
        MultiCoreMotionView()
    }
}

class CircleMotionManager: ObservableObject {
    @Published var pitch: Double = 0.0
    @Published var roll: Double = 0.0
    private var motionManager: CMMotionManager
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.deviceMotionUpdateInterval = 1/90
        self.motionManager.startDeviceMotionUpdates(to: .main) {
            (motionData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            if let motionData = motionData {
                self.pitch = motionData.attitude.pitch
                self.roll = motionData.attitude.roll
                let rollD: String = String(format:  "%g", self.roll)
                let pitchD: String = String(format: "%g", self.pitch)
                print("The values of rollD ",rollD, " pitchD ",pitchD)
            }
        }
    }//init
}//CircleMotionManager

struct MotionOpacityModifier: ViewModifier {
    var magnitude: Double
    @ObservedObject private var motion: CircleMotionManager = CircleMotionManager()
    func body(content: Content) -> some View {
        content
            .opacity(motion.pitch * magnitude)
    }
}

struct MotionCornerRadiusModifier: ViewModifier {
    var magnitude: Double
    @ObservedObject private var motion: CircleMotionManager = CircleMotionManager()
    func body(content: Content) -> some View {
        content
            .cornerRadius(CGFloat(motion.pitch * magnitude))
    }
}

struct MotionOffSetModifier: ViewModifier {
    var magnitude: Double
    @ObservedObject private var motion: CircleMotionManager = CircleMotionManager()
    func body(content: Content) -> some View {
        content
            .offset(
                x: CGFloat(motion.roll * magnitude),
                y: CGFloat(motion.pitch * magnitude)
        )
    }
}

struct MotionScalModifier: ViewModifier {
    var magnitude: Double
    @ObservedObject private var motion: CircleMotionManager = CircleMotionManager()
    func body(content: Content) -> some View {
        content
            .scaleEffect(CGFloat(motion.pitch * magnitude))
    }
}


