//
//  ShopViewModel.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/19.
//

import SwiftUI

class ShopViewModel:ObservableObject{

    @Published var Shops : [Shop] = []

    @Published var homeUIDatas: [homeUIData] =
    [
        homeUIData(id: "1", area: "都市科学部棟", isClosure: false, titleColor: .purple),
        homeUIData(id: "2", area: "経済・経営学部1号館", isClosure: false, titleColor: .yellow),
        homeUIData(id: "3", area: "教育学部7号館", isClosure: false, titleColor: .green),
        homeUIData(id: "4", area: "理工学部A棟", isClosure: false, titleColor: .mint),
        homeUIData(id: "5", area: "A block", isClosure: false, titleColor: .red),
        homeUIData(id: "6", area: "B block", isClosure: false, titleColor: .orange),
        homeUIData(id: "7", area: "C block", isClosure: false, titleColor: .yellow),
        homeUIData(id: "8", area: "D block", isClosure: false, titleColor: Color(.systemGreen)),
        homeUIData(id: "9", area: "E block", isClosure: false, titleColor: .green),
        homeUIData(id: "10", area: "F block", isClosure: false, titleColor: .cyan),
        homeUIData(id: "11", area: "Y block", isClosure: false, titleColor: .purple),
        homeUIData(id: "12", area: "The others", isClosure: false, titleColor: .pink)
    ]

    init(){
        Shops = loadShopData()
        self.loadBookmark()
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

    func shopToggleChange(shop:Shop){
        if let index = Shops.firstIndex(where: {$0.id == shop.id}){
            withAnimation(.linear(duration:1)){
                Shops[index].isBookmark.toggle()
            }
        }
    }

    func saveBookmark(shop:Shop){
        if let index = Shops.firstIndex(where: {$0.id == shop.id}){
            UserDefaults.standard.set(self.Shops[index].isBookmark, forKey: shop.id)
        }
    }

    func loadBookmark(){
        for (index,shop) in Shops.enumerated(){
            Shops[index].isBookmark = UserDefaults.standard.bool(forKey: shop.id)
        }
    }

    func searchShop(searchText:String) -> [Shop]{
        var filteredTitle: [Shop] = []   //キーワードにヒットしたタイトルの配列
        for shop in Shops{
            for shopKey in shop.keywords{
                if shopKey.contains(searchText) && searchText.count >= 2{    //要素を見つけた
                    let index = self.fetchIndex(shop: shop)
                    filteredTitle.append(Shops[index])//タイトルを追加
                    break
                }
            }
        }
        return filteredTitle
    }

    func fetchIndex(shop:Shop) -> Int{// Not Optional
        return Shops.firstIndex(where: {$0.id == shop.id})!
    }

}
