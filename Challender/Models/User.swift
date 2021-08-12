//
//  User.swift
//  Challender
//
//  Created by gibeom on 2021/08/11.
//

import Foundation

struct User: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var surname: String
}
