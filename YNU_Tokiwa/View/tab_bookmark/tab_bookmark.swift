//
//  tab_menu.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/04.
//

import SwiftUI

struct tab_bookmark: View {
    @EnvironmentObject var svm: ShopViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Form{



                    let bookmarkedShops = svm.Shops.filter { $0.isBookmark == true }

                    if bookmarkedShops.isEmpty {

                        Section{
                            Text("ブックマークに登録されていません")
                                .foregroundStyle(.blue)

                        }
                    } else {

                            ForEach(bookmarkedShops) { shop in
                                Section{
                                bookmarkedCard(shop: shop)
                            }
                        }
                    }
                }

            }


            .navigationTitle("ブックマーク")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    tab_bookmark()
        .environmentObject(ShopViewModel())
}


extension tab_bookmark{
    func bookmarkedCard(shop:Shop) -> some View {
        Group{
            HStack{
                VStack(){
                    Text(shop.title)
                        .font(.title)
                    //                            .centered()
                    HStack{
                        Spacer()
                        Text("by　\(shop.club)")
                            .font(.title3)
                        Spacer()
                        Button {
                            svm.shopToggleChange(shop: shop)
                            svm.saveBookmark(shop: shop)
                        } label: {
                            Image(systemName: shop.isBookmark ? "bookmark.fill" : "bookmark")
                                .font(.system(size:20))
                                .padding()
                            //                                            .padding(.leading,100)
                            //                                            .offset(x:10)
                        }
                        .foregroundStyle(.blue)
                        .buttonStyle(.plain)
                    }
                }
            }

            HStack{
                Text("分類")
                Text("(")
                Image(systemName: shop.genreIcon)
                    .foregroundStyle(.yellow)
                Text(")")
                Divider()
                Text(shop.kind)
                    .centered()
            }

            HStack{
                Text("場所")
                Text("(")
                Image(systemName: "mappin.and.ellipse")
                    .foregroundStyle(.red)
                Text(")")
                Divider()
                Text("\(shop.area)  \( shop.place)")
                    .centered()
            }
            VStack{

                HStack{
                    VStack{
                        Text("備考")
                            .fontWeight(.thin)


                        Spacer()
                    }
                    Spacer()
                }

                HStack{
                    if let sup = shop.supplement{
                        Text(sup)
//                                .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)

                    }else {
                        Text("")
                    }
                }
            }
            .padding(.bottom,20)
        }
    }
}
