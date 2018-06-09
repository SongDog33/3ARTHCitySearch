//
//  _ARTHCitySearchTests.swift
//  3ARTHCitySearchTests
//
//  Created by Joel Myers on 6/7/18.
//  Copyright © 2018 4Backbase. All rights reserved.
//

import XCTest
@testable import _ARTHCitySearch

class _ARTHCitySearchTests: XCTestCase {
    var vc : CitySearchHomeViewController!
    
    override func setUp() {
        super.setUp()
        vc = CitySearchHomeViewController()
        vc.viewDidLoad()
    }
    //Tests to ensure search results prefixes match the searchText
    //Asserts that the each result equals the search text
    func testSearchFilterMatches() {
        let searchText = "alb"
        vc.filteredCities = (vc.citiesArray?.filter {
            $0.name.lowercased().hasPrefix(searchText.lowercased())
            })!
        for city in vc.filteredCities {
            XCTAssertTrue(city.name.lowercased().hasPrefix(searchText), "Filtered Cities don't match search text")
        }
    }
    //Tests against different text being in the results other than the searchText
    //Asserts that the results don't equal the mismatched text
    func testSearchFilterMismatch() {
        let searchText = "alb"
        let mismatchText = "bla"
        vc.filteredCities = (vc.citiesArray?.filter {
            $0.name.lowercased().hasPrefix(searchText.lowercased())
            })!
        for city in vc.filteredCities {
            XCTAssertFalse(city.name.lowercased().hasPrefix(mismatchText))
        }
    }
    //Tests against different case characters being filtered
    //Asserts that the results match the search text in lowercased form
    func testSearchFilterCaseMatch() {
        let searchText = "YaG"
        let lowerCaseText = "yag"
        vc.filteredCities = (vc.citiesArray?.filter {
            $0.name.lowercased().hasPrefix(searchText.lowercased())
            })!
        for city in vc.filteredCities {
            XCTAssertTrue(city.name.lowercased().hasPrefix(lowerCaseText), "Search filter doesn't match independent of case")
        }
    }
    //Tests against non-alphanumeric characters
    //Asserts that array.count is not greater than 0
    func testSearchFilterInvalids() {
        let searchText = "*@$"
        vc.filteredCities = (vc.citiesArray?.filter {
            $0.name.lowercased().hasPrefix(searchText.lowercased())
            })!
        XCTAssertFalse(vc.filteredCities.count > 0)
    }
    
    override func tearDown() {
        vc = nil
        super.tearDown()
    }
}
