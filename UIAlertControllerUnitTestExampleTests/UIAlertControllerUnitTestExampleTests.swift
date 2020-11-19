//
//  UIAlertControllerUnitTestExampleTests.swift
//  UIAlertControllerUnitTestExampleTests
//
//  Created by Sergey Kargopolov on 2020-11-18.
//

import XCTest
@testable import UIAlertControllerUnitTestExample

class UIAlertControllerUnitTestExampleTests: XCTestCase {

    var sut: ViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "ViewController") as ViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testExample() throws {
        
        // Arrange
        let showAlertButton: UIButton = try XCTUnwrap(sut.showAlertButton, "Show alert button does not have a referencing outlet")
        
        // Act
        let showAlertButtonActions = try XCTUnwrap(showAlertButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Show alert button does not have any actions assigned to it")
 
        let presenter = MockPresenter(delegate: sut)
        sut.presenter = presenter
        sut.showAlertButtonTapped(self)
        
        //Assert
        XCTAssertEqual(showAlertButtonActions.count, 1)
        XCTAssertTrue(presenter.hasAlertBeenPresented)
        XCTAssertEqual(presenter.alertPresentedCount, 1)

    }
    
    func testExampleV2() throws {
        
        // Arrange
        let showAlertButton: UIButton = try XCTUnwrap(sut.showAlertButton, "Show alert button does not have a referencing outlet")
        
        // Act
        let showAlertButtonActions = try XCTUnwrap(showAlertButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Show alert button does not have any actions assigned to it")
 
        let controllerMock = MockViewController()
        let presenter = MockPresenter(delegate: controllerMock)
        sut.presenter = presenter
        sut.showAlertButtonTapped(self)
        
        //Assert
        XCTAssertEqual(showAlertButtonActions.count, 1)
        XCTAssertTrue(presenter.hasAlertBeenPresented)
        XCTAssertEqual(presenter.alertPresentedCount, 1)
 
        XCTAssertTrue(controllerMock.hasAlertBeenPresented)
        XCTAssertEqual(controllerMock.alertPresentedCount, 1)
    }

}
