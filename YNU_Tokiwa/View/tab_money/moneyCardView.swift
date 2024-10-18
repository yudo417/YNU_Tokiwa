//
//  moneyCardView.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/15.
//

import SwiftUI

struct moneyCardView: View {
    let mock: Receipt
    let deletereceipt: (Receipt) -> Void
    @State var istrash : Bool = false
    var body: some View {
        HStack{
            Spacer()
            literal
            Spacer()
            trash
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .padding(.horizontal)
//        .border(.red) //debug
        .background{
            Capsule()
                .foregroundStyle(.white)
        }
        .alert("要素の削除", isPresented: $istrash) {
            Button("削除",role: .destructive){
                deletereceipt(mock)
            }
            Button("キャンセル",role: .cancel){
                print("削除がキャンセルされた")
            }
        } message: {
            Text("完全に削除されます")
        }

    }
}


//#Preview {
//    moneyCardView(mock: Receipt(id: "1", ShopName: "Test", value: "10000"))
//}


extension moneyCardView{

    private var literal: some View{
        VStack(alignment:.center,spacing: 5){
            Text(mock.ShopName)
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
                .frame(alignment:.center)
                .lineLimit(1)
            Divider()
            Text("¥"+mock.value)
                .font(.title)
                .foregroundStyle(.black)
        }
    }

    private var trash: some View{
        Button{
            istrash.toggle()
        }label: {
            Image(systemName: "trash")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(.blue)
        }
    }


}
