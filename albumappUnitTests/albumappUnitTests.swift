//
//  albumappTests.swift
//  albumappTests
//
//  Created by Ravulavaru, Arvind on 10/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import XCTest
@testable import albumapp

class AlbumappTests: XCTestCase {
    private var albumVC: AlbumViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        albumVC = AlbumViewController()

        do {
            guard let urlOfMockData = Bundle(for: type(of: self))
                .url(forResource: "Album", withExtension: "json") else {

                    XCTFail("Error reading mock data. Please make sure that the mock data is available.")
                    return
            }
            let fileData = try Data(contentsOf: urlOfMockData)
            let jsonObject = try JSONSerialization.jsonObject(with: fileData, options: JSONSerialization.ReadingOptions.allowFragments)
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions.prettyPrinted)

            let parser = Parser<Album>(keyPath: "Albums") {(albumsArray) in
                self.albumVC.albums = [albumsArray[0]]
                XCTAssertFalse(albumsArray.isEmpty, "Error initilising the shipments objects")
            }
            parser.parseData(jsonData)

        } catch {
            XCTFail("Error reading mock data. Please make sure that the mock data is available.")
        }
   
        let albums = try AlbumTestCase.Valid.albumData.decode()
       XCTAssertFalse(albums.isEmpty, "Error initilising the albums objects")
            
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        albumVC = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(albumVC.albums.count == 0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
