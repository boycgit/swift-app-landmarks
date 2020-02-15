//
//  FeatureCard.swift
//  Landmark
//
//  Created by boychenney on 2020/2/15.
//  Copyright © 2020 boychenney. All rights reserved.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
    NavigationLink(destination:LandmarkDetail(landmark: landmark)) {
            landmark.featureImage?
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .overlay(TextOverlay(landmark: landmark))
        }
        
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.city)
            }
            .padding(.bottom, 30.0)
            .padding(.leading, 20)
        }
        .foregroundColor(.white)
    }
}


struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: features[0])
    }
}
