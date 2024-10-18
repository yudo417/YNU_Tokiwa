//
//  addView.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/16.
//

import SwiftUI

struct addView: View {
    @ObservedObject var  mvm : MoneyViewModel
    @Environment(\.dismiss) var dismiss
    @State var text: String = ""
    @State var value : String = ""
    @State var isTextEmpty: Bool = false
    @State var iszero: Bool = false
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading,spacing:20){
                inputField(text: $text, name: "店名", placeholder: "入力してください")

                inputField(text: $value, name: "金額", placeholder: "入力してください",isnumberPad: true)
            }
            .toolbar{
                ToolbarItem(placement:.topBarTrailing){
                    Button {
                        if text.isEmpty || value.isEmpty{   //　テキストのどっちかが空の場合
                            isTextEmpty.toggle()
                        }else if (value != "0" && value.hasPrefix("0")){
                            iszero.toggle()
                        }else{  //テキストのどちらも空じゃないばあいにデータを送信
                            let id = UUID().uuidString
                            mvm.saveReceipt(Receipt(id: id, ShopName: text, value: value))

                            dismiss()
                        }
                    } label: {
                        HStack{
                            Text("追加")
                            Image(systemName: "paperplane")
                        }
                    }
//                    .padding(.vertical)
                }
            }
        }
        // TODO: -途中（ここから再開)メッセージの編集

        .alert("エラー", isPresented: $isTextEmpty) {
            Button("確認"){

            }
        } message: {
            Text("店名、金額のいずれかが入力されていません")
        }
        .alert("エラー", isPresented: $iszero) {
            Button("確認"){

            }
        } message: {
            Text("有効な金額を入力してください")
        }

    }
}

//#Preview {
//    addView()
//}
