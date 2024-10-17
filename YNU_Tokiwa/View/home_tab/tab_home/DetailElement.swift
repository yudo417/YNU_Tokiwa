//
//  DetailElement.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/17.
//

import SwiftUI

struct DetailElement: View {
    var body: some View {
        Form{
            Section{
                
                HStack(alignment: .center,spacing: 50){
                    Spacer()
                        Text("a")
                        Text("b")
                    Spacer()
                    }
                    HStack{
                        Text("a")
                        Text("b")

                }
            }
        }
    }
}

#Preview {
    DetailElement()
}
