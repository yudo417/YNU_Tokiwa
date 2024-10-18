//
//  ShopViewModel.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/19.
//

import SwiftUI

class ShopViewModel:ObservableObject{

    @Published var Shops : [Shop] = []

    init(){
        Shops = loadShopData()

    }

    func loadShopData() -> [Shop]{
        do {
            if let shopUrl = try Bundle.main.url(forResource: "ShopData", withExtension: "json"){
                let data = try Data(contentsOf: shopUrl)
                let shopData = try JSONDecoder().decode([Shop].self, from: data)
                return  shopData
            }
        }catch{
            print("JSON読み込みエラー:\(error.localizedDescription)")
        }
            return []
    }


}
