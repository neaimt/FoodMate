//import SwiftUI
//import MapKit
//import CoreLocation
//
//struct MapView: View {
//    @State private var region: MKCoordinateRegion = MKCoordinateRegion()
//    @State var isShowMapView: Bool = false
//    
//    var body: some View {
//        if isShowMapView {
//            Map(coordinateRegion: $region, showsUserLocation: true)
//        }
//        
//        Button("지도에서 현재 위치보기") {
//            let manager = CLLocationManager()
//            manager.desiredAccuracy = kCLLocationAccuracyBest
//            manager.requestWhenInUseAuthorization()
//            
//            let latitude = manager.location?.coordinate.latitude
//            let longitude = manager.location?.coordinate.longitude
//            
//            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
//            isShowMapView = true
//        }
//    }
//}
//
//#Preview {
//    MapView()
//}
