//
//  testUI.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/19.
//

import SwiftUI

struct testUI: View {
    var vm: ShopViewModel = ShopViewModel()

    var body: some View {
        VStack(spacing:30){
        ForEach(vm.Shops,id:\.id){mock in
                Group{
                    Text(mock.title)
                    Text(mock.kind)
                }
            }
        }
    }
}

#Preview {
    testUI()
}
