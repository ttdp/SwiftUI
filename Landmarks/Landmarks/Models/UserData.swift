//
//  UserData.swift
//  Landmarks
//
//  Created by Tian Tong on 2019/12/31.
//  Copyright © 2019 TTDP. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
