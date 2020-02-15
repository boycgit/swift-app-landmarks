//
//  ProfileEditor.swift
//  Landmark
//
//  Created by boychenney on 2020/2/3.
//  Copyright © 2020 boychenney. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("用户名", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("打开通知")
            }
            
            VStack(alignment: .leading, spacing: 20.0){
                Text("季节照片").bold()
                
                Picker("季节照片", selection: $profile.seasonalPhoto){
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }.padding(.top)
            VStack(alignment: .leading, spacing: 20) {
                           Text("目标日期").bold()
                           DatePicker(
                               "目标日期",
                               selection: $profile.goalDate,
                               in: dateRange,
                               displayedComponents: .date)
                       } .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
