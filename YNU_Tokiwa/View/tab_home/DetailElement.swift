//
//  DetailElement.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/17.
//

import SwiftUI

struct DetailElement: View {
    var body: some View {
        Form{
            Section(){

                HStack{
                    VStack(){
                        Text("タイトル")
                            .font(.title)
//                            .centered()
                        HStack{
                            Spacer()
                                    Text("by　サークル名")
                                        .font(.title3)
                            Spacer()
                                    Button {
                                        print("ブックマーク押された")
                                    } label: {
                                        Image(systemName: "bookmark")
                                            .font(.system(size:20))
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
                    Image(systemName: "fork.knife")
                        .foregroundStyle(.yellow)
                    Text(")")
                    Divider()
                    Text("食品、販売")
                        .centered()
                }

                HStack{
                    Text("教室")
                    Text("(")
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundStyle(.red)
                    Text(")")
                    Divider()
                    Text("都市科学部棟202")
                        .centered()
                }
            }
        }
    }
}

#Preview {
    DetailElement()
}
