//
//  ServiceProvider.swift
//  PrettyPreview
//
//  Created by Kyle Oba on 9/19/15.
//  Copyright © 2015 Kyle Oba. All rights reserved.
//

import Foundation
import TVServices

class ServiceProvider: NSObject, TVTopShelfProvider {

    override init() {
        super.init()
    }

    // MARK: - TVTopShelfProvider protocol

    var topShelfStyle: TVTopShelfContentStyle {
        // Return desired Top Shelf style.
//        return .Sectioned
        return .Inset
    }

    var topShelfItems: [TVContentItem] {
        // Create an array of TVContentItems.
        let item1 = TVContentItem(contentIdentifier: TVContentIdentifier(identifier:"PhoenixTV.item1", container:nil)!)
        item1?.imageURL = NSURL(string: "http://localhost:9001/images/phoenixframework-logo.jpg")
        return [item1!]
    }

}

