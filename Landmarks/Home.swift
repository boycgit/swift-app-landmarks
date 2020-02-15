//
//  Home.swift
//  Landmark
//
//  Created by boychenney on 2020/2/2.
//  Copyright © 2020 boychenney. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {

    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var mapToZh = ["Nature": "自然风景", "Humanity": "人文景观"]
    
    var body: some View {
        NavigationView{
            List{
                FeaturedLandmarks(landmarks: featured)
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .listRowInsets(EdgeInsets())
                
                ForEach(self.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: self.mapToZh[key]!, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList()) {
                    Text("查看所有")
                }
            }
            .navigationBarTitle("特色景点")
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                .environmentObject(self.userData)
            }
        }

    }
}


struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}


struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(UserData())
    }
}
