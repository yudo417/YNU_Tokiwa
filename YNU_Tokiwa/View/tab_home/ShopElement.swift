//
//  ShopElement.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/17.
//

import SwiftUI

struct ShopElement: View {
    @Binding var isSheet: Bool
    var body: some View {


        HStack(spacing:10){
            Circle()
                .frame(width: 15, height: 15)
            //                Spacer()
            Text("店名店名店名店名店名店名店名店名店名店名店名店名店名店名店名店名店名")
                .lineLimit(1)
            Spacer()
            Divider()
            //                    .frame(width: 15, height: 15)
            Button {
                isSheet.toggle()
                print(isSheet)
            } label: {
                HStack {
                    Text("202")
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.system(size:20))
                        .foregroundStyle(.blue)
                }
            }
            .buttonStyle(.plain)
        }


    }
}

#Preview {
    @State var isSeet = false
    ShopElement(isSheet: $isSeet)
}
