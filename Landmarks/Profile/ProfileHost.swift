//
//  ProfileHost.swift
//  Landmark
//
//  Created by boychenney on 2020/2/2.
//  Copyright © 2020 boychenney. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State var isEditMode: EditMode = .inactive
//    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack{
                HStack{
                    if isEditMode == .active {
                       Button("Cancel") {
                           self.draftProfile = self.userData.profile
                        self.isEditMode = .inactive
//                           self.$isEditMode = .inactive
                       }
                   }
                    Spacer()
                    EditButton()
                }.environment(\.editMode, self.$isEditMode)
                
                if isEditMode == .inactive {
                    ProfileSummary(profile: draftProfile)
                } else {
                    ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                    }
                }
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
