//
//  ShopElement.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/17.
//

import SwiftUI

struct ShopElement: View {
    @Binding var currentshop : Shop
    @EnvironmentObject var svm: ShopViewModel
//    @EnvironmentObject var
    var body: some View {


        HStack(spacing:10){
            Image(systemName: currentshop.genreIcon)
                .frame(width: 15, height: 15)
            //                Spacer()
            Text(currentshop.title)
                .lineLimit(1)
            Spacer()
            Divider()
            //                    .frame(width: 15, height: 15)
            Button {
                withAnimation{
                    currentshop.isSheet = true
                }
                print(currentshop.isSheet)
            } label: {
                HStack {
                    Text(currentshop.place)
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.system(size:20))
                        .foregroundStyle(.blue)
                }
            }
            .buttonStyle(.plain)
        }
        .sheet(isPresented: $currentshop.isSheet) {
            DetailElement(currentshop:$currentshop)
        }


    }
}

//#Preview {
//    @EnvironmentObject var svm: ShopViewModel
//    ShopElement(currentshop:$svm.Shops[0])
//        .environmentObject(ShopViewModel())
//}
