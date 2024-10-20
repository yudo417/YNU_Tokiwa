//
//  DetailElement.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/17.
//

import SwiftUI

struct DetailElement: View {
    @Binding var currentshop: Shop
    var body: some View {
        Form{
            Section(){

                HStack{
                    VStack(){
                        Text(currentshop.title)
                            .font(.title)
//                            .centered()
                        HStack{
                            Spacer()
                            Text("by　\(currentshop.club)")
                                        .font(.title3)
                                        .centered()//センター寄せのつもり、レイアウト怖い、修正あるかも
                            Spacer()
                                    Button {
                                        currentshop.isBookmark.toggle()
                                        UserDefaults.standard.set(currentshop.isBookmark, forKey: "\(currentshop.id)")
                                    } label: {
                                        Image(systemName: currentshop.isBookmark ? "bookmark.fill" : "bookmark")
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
                    Image(systemName: currentshop.genreIcon)
                        .foregroundStyle(.yellow)
                    Text(")")
                    Divider()
                    Text(currentshop.kind)
                        .centered()
                }

                HStack{
                    Text("教室")
                    Text("(")
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundStyle(.red)
                    Text(")")
                    Divider()
                    Text("\(currentshop.area)  \(currentshop.place)")
                        .centered()
                }
            }
        }
    }
}
//
//#Preview {
//    
//    DetailElement()
//}
