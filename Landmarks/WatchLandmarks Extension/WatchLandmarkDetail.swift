//
//  WatchLandmarkDetail.swift
//  WatchLandmarks Extension
//
//  Created by Tian Tong on 2020/1/3.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct WatchLandmarkDetail: View {
    
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: self.landmark.image.resizable())
                    .scaledToFit()
                
                Text(self.landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn:
                $userData.landmarks[self.landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                WatchMapView(landmark: self.landmark)
                .scaledToFit()
                .padding()
            }
            .padding(16)
        }
        .navigationBarTitle("Landmarks")
    }
}

struct WatchLandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return Group {
            WatchLandmarkDetail(landmark: userData.landmarks[0]).environmentObject(userData)
                .previewDevice("Apple Watch Series 4 - 44mm")
            
            WatchLandmarkDetail(landmark: userData.landmarks[1]).environmentObject(userData)
                .previewDevice("Apple Watch Series 2 - 38mm")
        }
    }
}
