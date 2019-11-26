//
//  ContentView.swift
//  ExpandableFloatingActionButtonFABInSwiftUI
//
//  Created by Ramill Ibragimov on 26.11.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        ZStack {
            List(0..<25) { i in
                Text("mainview \(i)")
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ExpandableFAB(show: $show).padding(.trailing, 30)
                }.padding([.bottom], 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExpandableFAB: View {
    @Binding var show: Bool
    var body: some View {
        VStack(spacing: 20) {
            if self.show {
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "tv.fill")
                        .resizable()
                        .frame(width: 35, height: 25)
                        .padding(18)
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 35, height: 25)
                        .padding(18)
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
            }
            Button(action: {
                self.show.toggle()
            }) {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 25, height: 15)
                    .padding(22)
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotationEffect(.init(degrees: self.show ? 180 : 0))
        }.animation(.spring())
    }
}
