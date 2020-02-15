//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by boychenney on 2020/1/29.
//  Copyright © 2020 boychenney. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
//    init(){
//        let path = Bundle.main.path(forResource: "gugong", ofType: "jpg")
//        print("22222")
//        print(path ?? "none")
//    }
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                CircleImage(image: landmark.image)
                    .offset(y: -150)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        Button(action: {
                            self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                        }, label: {
                            if self.userData.landmarks[self.landmarkIndex].isFavorite {
                                Image(systemName: "star.fill").foregroundColor(Color.yellow)
                            } else {
                                Image(systemName: "star")
                                    .foregroundColor(Color.gray)
                            }
                        })
                    }
                    HStack {
                        Text(landmark.city)
                            .font(.subheadline)
                        Spacer()
                        Text(landmark.prov)
                        
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle(Text(landmark.name), displayMode: .inline)
        }

    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return LandmarkDetail(landmark: landmarkData[1]).environmentObject(userData)
    }
}
