//
//  NavigateToSolutionButton.swift
//  DiscreteMathCourse
//
//  Created by Yaroslav Monastyrev on 09.05.2022.
//

import SwiftUI

extension UIColor {
    convenience init(rgb: UInt) {
       self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
}

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 200, height: 200)
            .background(Color(UIColor.init(rgb: 0x64e764)))
            .clipShape(Circle())
    }
}

struct NavigateToSolutionButton: View {
    
    @State private var solutionViewIsOn = false
    
    var body: some View {
        VStack {
            
            NavigationLink(isActive: $solutionViewIsOn) {
                SolutionPage()
            } label: {
                Button(action: {
                    solutionViewIsOn.toggle()
                }){
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    
                }.buttonStyle(BlueButtonStyle())
            }

            
        }
    }
}

struct NavigateToSolutionButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigateToSolutionButton()
    }
}
