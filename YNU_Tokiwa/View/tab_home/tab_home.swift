//
//  tab_home.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/04.
//

import SwiftUI


struct tab_home: View {

    @EnvironmentObject var svm: ShopViewModel
    @State var isExpanded: Bool = false
    @State var reverse: Bool = false
    @State var isy : Bool = false
    @State var isyy : CGFloat = 0
    @State var isSheet : Bool = false
    var body: some View {

        NavigationStack {
            VStack {


                if reverse {
                    BackSurface(reverse: $reverse,isy: $isy,isyy: $isyy)
                }else{
                    Form {
                        
                        // MARK: -Sectionここまで
                        ForEach(Array(svm.homeUIDatas.enumerated()),id:\.element.id){ index,homeUIdata in
                            Section{
                                DisclosureGroup(isExpanded: $svm.homeUIDatas[index].isClosure) {
                                    NavigationStack{
                                        VStack(alignment:.leading){
                                            ForEach(svm.Shops.enumerated().filter{$0.1.area == homeUIdata.area}.map{$0.0},id:\.self){ selectedIndex in
                                                ShopElement(currentshop: $svm.Shops[selectedIndex])
                                            }
                                            Divider()
                                        }
                                    }
                                } label: {
                                    DisclosureLabel(title: homeUIdata.area,titleColor: homeUIdata.titleColor)
                                }
                            }
                        }

                    }
                }
            }

            .scaleEffect(x: reverse ? -1 : 1, y: 1) //反転
            .rotation3DEffect(.degrees(isyy), axis: (x:0,y:-1,z:0.0))//回転
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation(.linear(duration: 0.4)) {
                            isy.toggle()
                            reverse.toggle()    //反転
                            isyy = isy ? 180 : 0
                        }
                        print(reverse)
                    } label: {
                        Image(systemName: "arrow.triangle.2.circlepath.doc.on.clipboard")
                    }

                }
            }
            .navigationTitle("一覧")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    tab_home()
        .environmentObject(ShopViewModel())
}




