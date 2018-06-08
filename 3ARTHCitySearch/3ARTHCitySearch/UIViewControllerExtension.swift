//
//  UIViewControllerExtension.swift
//  3ARTHCitySearch
//
//  Created by Joel Myers on 6/8/18.
//  Copyright © 2018 4Backbase. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func orderCitiesArray(arr: [City]) -> [City] {
        var parsedArr: [City] = arr
        parsedArr.sort(by: {$0.name < $1.name})
        
        return parsedArr
    }
}
