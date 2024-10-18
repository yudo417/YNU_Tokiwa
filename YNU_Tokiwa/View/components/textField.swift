//
//  textField.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/16.
//

import SwiftUI

struct inputField: View {
    @Binding var text: String
     let name: String
     let placeholder: String
     var isnumberPad : Bool = false

    var body: some View {
        VStack(alignment:.leading, spacing:20) {
            Text(name)
                .font(.footnote).opacity(0.9)

            if isnumberPad{
                TextField(placeholder, text: $text)
                    .keyboardType(.numberPad)
            }else{
                TextField(placeholder, text: $text)
            }
            Divider()
        }
        .padding(.horizontal)
    }
}

#Preview {
    inputField(text: .constant(""), name: "名前", placeholder: "入力してください")
}
