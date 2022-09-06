//
//  ContentView.swift
//  TicTacToe WatchKit Extension
//
//  Created by 曹紫光 on 2022/6/27.
//

import SwiftUI

struct ContentView: View {
    @State var current = "X"
    @State var panel: [[String]] = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""],
    ]
    
    func changeCurrent(current: String) -> String {
        switch current{
        case "X":
            return "O"
        default:
            return "X"
        }
    }
    
    func reset() {
        current = "X"
        for i in panel.indices {
            for j in panel[i].indices {
                panel[i][j] = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe").font(.title3)
            ForEach(0..<panel.count,id:\.self) { i in
                HStack {
                    ForEach(0..<panel[i].count,id:\.self) { j in
                        Cell(value: $panel[i][j], ctrl: self)
                    }
                }
            }
            Button("Reset",action: reset)
                .frame(width: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
