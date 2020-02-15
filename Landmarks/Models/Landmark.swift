//
//  Landmark.swift
//  Landmark
//
//  Created by boychenney on 2020/1/29.
//  Copyright © 2020 boychenney. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var prov: String
    var city: String
    var category: Category
    var isFeatured: Bool
    var isFavorite: Bool
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
        latitude: coordinates.latitude,
        longitude: coordinates.longitude)
    }
    
    var featureImage: Image? {
        guard isFeatured else { return nil }
        
        return Image(
            ImageStore.loadImage(name: "\(imageName)"),
            scale: 2,
            label: Text(verbatim: name))
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case nature = "Nature"
        case humanity = "Humanity"
    }
    
}


extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
