//
//  OfficialLink.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/13.
//

import SwiftUI

struct OfficialLink: View {
    var body: some View {
        Button{
//                        openURL(URL(string: "https://x.com/ynu_fes?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor")!)
            print("xが押された")
        }label:{
            HStack {
                Image("x_icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("大学祭実行委員会Twitter")
            }
//                            .clipShape(Circle())
        }
    }
}

#Preview {
    OfficialLink()
}
