//
//  ContentView.swift
//  Landmark
//
//  Created by boychenney on 2020/1/29.
//  Copyright © 2020 boychenney. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            CircleImage()
                .offset(y: -150)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("故宫")
                    .font(.title)
                HStack {
                    Text("天安门")
                        .font(.subheadline)
                    Spacer()
                    Text("北京市")
                    
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
