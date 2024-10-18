//
//  MoneyViewModel.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/15.
//

import Foundation
import SwiftUI

class MoneyViewModel:ObservableObject {

    var sum = 0
    @Published var receipts: [Receipt] = []

    init() {
            // アプリ起動時にデータをロードする
            receipts = loadReceipts()
            sumcalc()
        }

    func saveReceipt(_ receipt: Receipt) {
        receipts.append(receipt)
//        print("現在のレシート:\(receipts)")
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(receipts)
//            print("保存するJSONデータ: \(String(data: encoded, encoding: .utf8) ?? "nil")")
            UserDefaults.standard.set(encoded, forKey: "savedReceipts")
            self.sumcalc()
            print("レシート保存成功")
        } catch  {
            print("エンコード失敗:\(error.localizedDescription)")
        }
    }

    func loadReceipts () -> [Receipt] {
        do {
            if let savedData = try UserDefaults.standard.data(forKey: "savedReceipts"){
                let decoder = JSONDecoder()
                let loadreceipts = try decoder.decode([Receipt].self, from: savedData)
                    print("JOSNデータ呼び出し成功")

                    return loadreceipts

            }
        } catch  {
            print("デコード失敗:\(error.localizedDescription)")
        }


        return []
    }

    func deleteReceipt(_ receipt:Receipt){
        self.receipts.removeAll(where:{
            $0.id == receipt.id
        })
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(receipts)
            UserDefaults.standard.set(encoded, forKey: "savedReceipts")
            print("上書き成功")
        } catch  {
            print("エンコード失敗:\(error.localizedDescription)")
        }
        self.sumcalc()
        print("レシートを削除した:\(self.receipts)")
    }

    func sumcalc(){
        self.sum = 0
        for valu in receipts {
            guard let elementNum = Int(valu.value) else {return }
            self.sum += elementNum
        }
    }
}
