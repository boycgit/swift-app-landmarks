//
//  ProfileSummary.swift
//  Landmark
//
//  Created by boychenney on 2020/2/2.
//  Copyright © 2020 boychenney. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.username)
            .bold()
                .font(.title)
            Text("通知开关: \(self.profile.prefersNotifications ? "On": "Off" )")
            
            Text("季节照片: \(self.profile.seasonalPhoto.rawValue)")
            
            Text("目标日期: \(self.profile.goalDate, formatter: Self.goalFormat)")
            
            VStack(alignment: .leading) {
                Text("已获勋章")
                    .font(.headline)
                ScrollView {
                    HStack {
                        HikeBadge(name: "首次登山")
                        
                        HikeBadge(name: "地球日")
                            .hueRotation(Angle(degrees: 90))
                        
                        
                        HikeBadge(name: "第十次登山")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                }
                .frame(height: 140)
            }
            VStack(alignment: .leading) {
                Text("最近登山情况")
                    .font(.headline)
            
                HikeView(hike: hikeData[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
