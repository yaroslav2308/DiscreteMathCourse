//
//  MainPage.swift
//  DiscreteMathCourse
//
//  Created by Yaroslav Monastyrev on 09.05.2022.
//

import SwiftUI


struct MainPage: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.init(rgb: 0xa6f1a6))
                    .ignoresSafeArea()
                VStack{
                    Text("Wagner Fissger \n Algorithm")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 43, weight: .semibold))
                        .foregroundColor(Color(UIColor.init(rgb: 0x228b22)))
                        .padding(.bottom, 100)
                    
                    NavigateToSolutionButton()
                    
                }.padding(.top, -200)
                VStack {
                    Spacer()
                    Text("Made by \n Yaroslav Monastyrev")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(UIColor.init(rgb: 0x228b22)))
                }
                
                
            }
            
            
        }
        .accentColor(Color(UIColor.init(rgb: 0x228b22)))
    }
    
    
}


struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
