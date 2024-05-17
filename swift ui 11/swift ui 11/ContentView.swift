//
//  ContentView.swift
//  swift ui 11
//
//  Created by Ann Dosova on 12.05.24.
//

import SwiftUI

struct ContentView: View {
    
    @State var text = ""
    @State var totalChars = 0
    @State var lastText = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        
        ZStack {
            Color.purple.ignoresSafeArea()
            VStack {
                ProgressView("Chars:\(totalChars) /150", value: Double(totalChars), total: 150)
                    .frame(width: 150)
                    .padding()
                
                TextEditor(text: $text)
                //.padding()
                    .background(.yellow).opacity(0.5)
                    .foregroundColor(.white)
                    .font(Font.custom("Custom", size: 20, relativeTo: .body))
                    .frame(width: 300, height: 200)
                    .cornerRadius(25)
                    
                    .onChange(of: text, initial: true) { editedText, _  in
                        totalChars = editedText.count
                        if totalChars <= 150 {
                            lastText = editedText
                        } else {
                            text = lastText
                        }
                    }
                Spacer()
                
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

#Preview {
    ContentView()
}
