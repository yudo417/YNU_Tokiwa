//
//  DisclosureLabel.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/20.
//

import SwiftUI

struct DisclosureLabel: View {
    let title: String
    let titleColor: Color
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(titleColor)
        Spacer()
        Divider()
        Image(systemName: "mappin.and.ellipse")
                .foregroundStyle(.red)
        }
        .padding(.leading,10)
        .padding(.trailing,30)
    }
}

#Preview {
    DisclosureLabel(title: "タイトル",titleColor: Color.red)
}
