//
//  Coin.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/15.
//

import Foundation

struct Receipt : Codable,Identifiable{
    let id: String
    let ShopName: String
    let value: String

//    static let MOCK1 = Receipt(id: "1", ShopName: "MCOKNAME1", value: "100")
//    static let MOCK2 = Receipt(id: "2", ShopName: "MCOKNAME2", value: "200")
//    static let MOCK3 = Receipt(id: "3", ShopName: "MCOKNAME3", value: "300")
}

extension Receipt {
//    static let MOCKS = [MOCK1, MOCK2,MOCK3]
}
