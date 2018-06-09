//
//  CityMapViewController.swift
//  3ARTHCitySearch
//
//  Created by Joel Myers on 6/8/18.
//  Copyright © 2018 4Backbase. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CityMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cityLabel: UILabel!
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let city = city {
            cityLabel.text = "\(city.name), \(city.country)"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //MARK: MapView Centers to Coordinates
        if let city = city {
            let center = CLLocationCoordinate2D(latitude: city.center.latitude, longitude: city.center.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
            let savedRegion = MKCoordinateRegion(center: center, span: span)
            
            self.mapView.setRegion(savedRegion, animated: false)
            
            let camera = MKMapCamera(lookingAtCenter: center, fromEyeCoordinate: center, eyeAltitude: 10610)
            mapView.setCamera(camera, animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dismissMapView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
