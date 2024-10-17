//
//  tab_home.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/04.
//

import SwiftUI

struct tab_home: View {
    @State var isExpanded: Bool = false
    @State var reverse: Bool = false
    @State var isy : Bool = false
    @State var isyy : CGFloat = 0
    @State var isSheet : Bool = false
    var body: some View {
        NavigationStack {
            VStack {


                if reverse {
                    BackSurface()
                }else{
                    Form {
                        Section{
                            DisclosureGroup(isExpanded: $isExpanded) {
                                NavigationStack{
                                    VStack(alignment:.leading){
                                        ShopElement(isSheet: $isSheet)
                                        Divider()
//                                        ShopElement()

                                    }
                                }
                            } label: {
                                HStack {
                                Text("タイトル")
                                Spacer()
                                Divider()
                                Image(systemName: "mappin.and.ellipse")
                                        .foregroundStyle(.red)
                                }
                                .padding(.leading,10)
                                .padding(.trailing,30)
                                //                            .resizable()
                                //                            .font(.system(size:30))
                            }
                        }
                    }

                }
                //                    .animation(.linear(duration: 1))




            }

            .scaleEffect(x: reverse ? -1 : 1, y: 1)
            .rotation3DEffect(.degrees(isyy), axis: (x:0,y:-1,z:0.0))
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
            .sheet(isPresented: $isSheet) {
                DetailElement()
            }
        }
    }
}

#Preview {
    tab_home()
}
