//
//  ShopData.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/18.
//

import Foundation

struct Shop: Codable,Identifiable {

    let id: String
    let title: String
    let club: String
    let genreIcon: String
    let kind: String
    let place: String
    let area: String
    var isBookmark: Bool
    let supplement: String?
}
