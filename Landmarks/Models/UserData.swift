//
//  UserData.swift
//  Landmark
//
//  Created by boychenney on 2020/1/30.
//  Copyright © 2020 boychenney. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
