//
//  ReveseSurface.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/17.
//

import SwiftUI

struct BackSurface: View {

    @Binding var reverse: Bool
    @EnvironmentObject var svm: ShopViewModel
    @Binding var isy : Bool
    @Binding var isyy : CGFloat

    @State var offset:CGSize = .zero // drag value
    @State var lastOffset: CGSize = .zero // hold last drag value
    @State var scale:CGFloat = 1.0 // pinch scale value
    @State var lastScale: CGFloat = 1.0 // hold last scale value

    var body: some View {
        NavigationStack {
            VStack {


//
                Image("test")
                    .resizable()
                    .scaledToFit()
                    .offset(offset)
                    .scaleEffect(scale)

                    .gesture(
                        DragGesture()
                            .onChanged{ value  in
                                offset.width = value.translation.width * 0.5 + lastOffset.width 
                                offset.height = value.translation.height * 0.5 + lastOffset.height
                            }
                            .onEnded { value in
                                lastOffset.width = value.translation.width * 0.5 + lastOffset.width
                                lastOffset.height = value.translation.height * 0.5 + lastOffset.height
                            }
                    )
                    .gesture(

                        MagnificationGesture()
                            .onChanged{ value in
                                scale = value * lastScale
                            }
                            .onEnded{ _ in
                                lastScale = scale
                            }
                    )

//

//                .scaleEffect(x: reverse ? -1 : 1, y: 1) //反転
//                .rotation3DEffect(.degrees(isyy), axis: (x:0,y:-1,z:0.0))//回転
//                .toolbar{
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button {
//                            withAnimation(.linear(duration: 0.4)) {
//                                isy.toggle()
//                                reverse.toggle()    //反転
//                                isyy = isy ? 180 : 0
//                            }
//                            print(reverse)
//                        } label: {
//                            Image(systemName: "arrow.triangle.2.circlepath.doc.on.clipboard")
//                        }
//
//                    }
//                }
                .navigationTitle("学内簡易マップ")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            withAnimation(.linear(duration:0.3)){
                                offset = .zero
                                lastOffset = .zero
                                scale = 1.0
                                lastScale = 1.0
                            }
                        } label: {
                            Image(systemName: "gearshape.arrow.triangle.2.circlepath")
                                .font(.title2)
                        }

                    }
                }
            }
        }
    }
}
//
//#Preview {
//    BackSurface()
//}
