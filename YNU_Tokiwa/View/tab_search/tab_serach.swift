//
//  tab_serach.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/17.
//

import SwiftUI

struct tab_serach: View {
    @EnvironmentObject var svm:ShopViewModel
    @State var text: String = ""
    @State var textResult: String = ""
    @FocusState var isText : Bool
    var body: some View {
            VStack{

//MARK: -UI
                HStack{
                    Image(systemName: "magnifyingglass")
                        .padding(.leading,15)
                    TextField("検索", text: $text)
                    //                    .border(.black, width: 1)
                        .frame(width: .infinity, height:40)
                        .focused($isText)
                        .toolbar{
                            ToolbarItem(placement:.keyboard){
                                HStack{
                                    Spacer()
                                    Button {
                                        isText = false
                                        textResult = text
                                    } label: {
                                        Text("閉じる")
                                    }
                                }

                            }
                        }
                        .onSubmit {
                            withAnimation(.linear(duration:0.2)) {
                                textResult = text   //検索に投げる値
                            }
                            print("submit: \(textResult)")
                        }
                    Button {
                        text = ""
                        withAnimation(.linear(duration: 0.2)) {
                            textResult = ""
                        }
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size:30))
                            .foregroundStyle(Color.Primary.opacity(0.5))
                            .padding(5)
//                            .border(.red)
                    }
                    .offset(x:-5)
                    .buttonStyle(.plain)

                }
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray.opacity(0.3))
                        .gesture(
                            TapGesture()
                                .onEnded {
                                    isText.toggle()
                                    print("toggle")
                                }
                        )
                    
                }
                .padding(.horizontal)
                .padding(.vertical,15)
                Spacer()


//MARK: -検索結果

                Form{
                    if textResult.isEmpty {
                        Text("入力がありません")
                    }else{
                        ForEach(svm.searchShop(searchText: textResult), id: \.id){ filteredshop in

                            let currentIndex = svm.fetchIndex(shop: filteredshop)
                            HStack(spacing:10){
                                Image(systemName: filteredshop.genreIcon)
                                    .frame(width: 15, height: 15)
                                //                Spacer()
                                Text(filteredshop.title)
                                    .lineLimit(1)
                                Spacer()
                                Divider()
                                //                    .frame(width: 15, height: 15)
                                Button {
                                    withAnimation{
                                        svm.Shops[currentIndex].isSheet = true
                                    }
                                    print(filteredshop.isSheet)
                                } label: {
                                    HStack {
                                        Text(filteredshop.place)
                                        Image(systemName: "arrowshape.turn.up.right")
                                            .font(.system(size:20))
                                            .foregroundStyle(.blue)
                                    }
                                }
                                .buttonStyle(.plain)
                            }
//MARK: 原因は不明だがSheetを開く時に最初の一度だけ開いた直後閉じてしまうバグが稀に発生する(ShopElement)と同じコード
                            .sheet(isPresented: $svm.Shops[currentIndex].isSheet) {
                                DetailElement(currentshop:$svm.Shops[currentIndex])
                            }
                        }
                    }
                    
                    
                }
            }


    }
}

#Preview {
    tab_serach()
        .environmentObject(ShopViewModel())

}


//extension tab_serach {
//    private var searchResults -> [String]{
//
//    }
//}
