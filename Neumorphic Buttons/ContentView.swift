//
//  ContentView.swift
//  Neumorphic Buttons
//
//  Created by 林宏諭 on 2021/5/30.
//

import SwiftUI
var newButton:Buttons?
struct ContentView: View {
    var body: some View {
        VStack(spacing: 80) {
            RectangleButton()
            
            CircleButton ()
            
            PayButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.8019031882, green: 0.9499765038, blue: 0.9394686818, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
