//
//   LandmarkList.swift
//  Landmark
//
//  Created by boychenney on 2020/1/30.
//  Copyright © 2020 boychenney. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("只看收藏")
                }
                ForEach(userData.landmarks) { landmark in

                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("风景名胜"))
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS"], id: \.self) { deviceName in
            NavigationView {
                LandmarkList()
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
            }
            
        }
    }
}
