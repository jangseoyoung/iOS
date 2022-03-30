//
//  Mapkit.swift
//  Travely
//
//  Created by 장서영 on 2022/03/25.
//

import SwiftUI
import MapKit

struct Mapkit: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct Mapkit_Previews: PreviewProvider {
    static var previews: some View {
        Mapkit()
    }
}
