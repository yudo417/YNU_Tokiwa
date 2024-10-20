//
//  ReveseSurface.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/17.
//

import SwiftUI

struct BackSurface: View {

    @Binding var reverse: Bool
    @EnvironmentObject var svm: ShopViewModel
    @Binding var isy : Bool
    @Binding var isyy : CGFloat


    var body: some View {
        NavigationStack {
            VStack {


//                Form {

                    //                                        // MARK: -Sectionここまで
                    //                                        ForEach(Array(svm.homeUIDatas.enumerated()),id:\.element.id){ index,homeUIdata in
                    //                                            Section{
                    //                                                DisclosureGroup(isExpanded: $svm.homeUIDatas[index].isClosure) {
                    //                                                    NavigationStack{
                    //                                                        VStack(alignment:.leading){
                    //                                                            ForEach(svm.Shops.enumerated().filter{$0.1.area == homeUIdata.area}.map{$0.0},id:\.self){ selectedIndex in
                    //                                                                ShopElement(currentshop: $svm.Shops[selectedIndex])
                    //                                                            }
                    //                                                            Divider()
                    //                                                        }
                    //                                                    }
                    //                                                } label: {
                    //                                                    DisclosureLabel(title: homeUIdata.area,titleColor: homeUIdata.titleColor)
                    //                                                }
                    //                                            }
                    //                                        }
                    //
                    //                                    }
                    Text("裏面")
//                }

//                .scaleEffect(x: reverse ? -1 : 1, y: 1) //反転
//                .rotation3DEffect(.degrees(isyy), axis: (x:0,y:-1,z:0.0))//回転
//                .toolbar{
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button {
//                            withAnimation(.linear(duration: 0.4)) {
//                                isy.toggle()
//                                reverse.toggle()    //反転
//                                isyy = isy ? 180 : 0
//                            }
//                            print(reverse)
//                        } label: {
//                            Image(systemName: "arrow.triangle.2.circlepath.doc.on.clipboard")
//                        }
//
//                    }
//                }
                .navigationTitle("一覧")
                .navigationBarTitleDisplayMode(.inline)

            }
        }
    }
}

//#Preview {
//    BackSurface()
//}
