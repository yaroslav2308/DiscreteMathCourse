//
//  SolutionPage.swift
//  DiscreteMathCourse
//
//  Created by Yaroslav Monastyrev on 09.05.2022.
//

import SwiftUI

struct SolutionPage: View {
    @State var string1 = ""
    @State var string2 = ""
    @State var answer = ""
    @State var placeHolder = "answer"
    @FocusState private var stringIsFocused: Bool
    var body: some View {
        ZStack {
            Color(UIColor.init(rgb: 0xa6f1a6))
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    TextField("1st string", text: $string1)
                        .font(.system(size: 50))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(UIColor.init(rgb: 0x228b22)))
                        .focused($stringIsFocused)
                    
                    Image(systemName: "arrow.counterclockwise")
                        .resizable()
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                    
                    TextField("2nd string", text: $string2)
                        .font(.system(size: 50))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(UIColor.init(rgb: 0x228b22)))
                        .focused($stringIsFocused)
                }
                Spacer()
                VStack {
                    
                    TextField(placeHolder, text: $answer)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        .padding(.bottom, 90)
                        .disabled(true)
                    
                    
                    Button(action: {
                        if string1 == "" || string2 == "" {
                            placeHolder = "type something"
                        } else {
                            self.answer = self.wagnerFissgerAlgorithm(str1: string1, str2: string2)
                        }
                        
                        stringIsFocused = false
                    }) {
                        Text("Calculate")
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .semibold))
                    .padding()
                    .background(Color(UIColor.init(rgb: 0x64e764)))
                    .cornerRadius(45)
                }
                Spacer()
            }
            .padding(.top, -50)
        }
        
        
    }
    
    func levenshteinDistance(_ i: Int, _ j: Int, _ str1: String, _ str2: String, _ matrix: [[Int]]) -> Int {
        if i == 0 && j == 0 {
            return 0
        } else if i == 0 && j > 0{
            return j
        } else if j == 0 && i > 0{
            return i
        }
        
        let upSideNumber = matrix[i - 1][j]
        let leftSideNumber = matrix[i][j - 1]
        let diagonalNumber = matrix[i - 1][j - 1]
        let m = str1[str1.index(str1.startIndex, offsetBy: i - 1)] != str2[str2.index(str2.startIndex, offsetBy: j - 1)] ? 1 : 0
        
        
        return min(upSideNumber + 1, leftSideNumber + 1, diagonalNumber + m)
    }



    func wagnerFissgerAlgorithm(str1: String, str2: String) -> String {
        
        let string1Size = str1.count
        let string2Size = str2.count
        
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: string2Size + 1), count: string1Size + 1)
        
        for i in 0...string1Size {
            for j in 0...string2Size {
                matrix[i][j] = levenshteinDistance(i, j, str1, str2, matrix)
            }
        }
        return String(matrix[string1Size][string2Size])
    }
}

struct SolutionPage_Previews: PreviewProvider {
    static var previews: some View {
        SolutionPage()
    }
}
