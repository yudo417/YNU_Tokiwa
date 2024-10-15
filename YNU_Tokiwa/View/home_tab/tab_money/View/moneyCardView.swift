//
//  moneyCardView.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/15.
//

import SwiftUI

struct moneyCardView: View {
    let mock: Receipt
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
    }
}


#Preview {
    moneyCardView(mock: Receipt(id: "1", ShopName: "Test", value: "10000"))
}


extension moneyCardView{

    private var literal: some View{
        VStack(alignment:.center,spacing: 5){
            Text(mock.ShopName)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.black)
            Divider()
            Text("¥"+mock.value)
                .font(.title)
                .foregroundStyle(.black)
        }
    }

    private var trash: some View{
        Button{
            print("削除ボタン")
        }label: {
            Image(systemName: "trash")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(.blue)
        }
    }


}
