//
//  ShopData.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/18.
//

import SwiftUI

struct Shop: Codable,Identifiable {

    let id: String
    let title: String
    let club: String
    let genreIcon: String
    let kind: String
    let place: String
    let area: String
    var isSheet: Bool
    var isBookmark: Bool
    let supplement: String?
    let keywords : [String]
}

struct homeUIData:Identifiable,Hashable{

    let id: String
    let area: String
    var isClosure: Bool
    let titleColor: Color

}
