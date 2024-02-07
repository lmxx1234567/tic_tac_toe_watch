//
//  ContentView.swift
//  TicTacToe WatchKit Extension
//
//  Created by 曹紫光 on 2022/6/27.
//

import SwiftUI

struct ContentView: View {
    @State private var current = "X"
    @State private var panel: [[String]] = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""],
    ]
    
    func changeCurrent(current: String) -> String {
        if (current=="X"){
            return "O"
        }
        return "X"
    }
    
    func reset() {
        current = "X"
        for i in panel.indices {
            for j in panel[i].indices {
                panel[i][j] = ""
            }
        }
    }
    
    func updateValue(i:Int,j:Int) -> String{
        var value = self.panel[i][j]
        if value == ""{
            value = self.current
            self.current = self.changeCurrent(current: self.current)
        }
        else if(value != self.current){
            self.current = value
            value = ""
        }
        return value
    }

var body: some View {
    VStack {
        Text("Tic Tac Toe").font(.title3)
        ForEach(0..<panel.count,id:\.self) { i in
            HStack {
                ForEach(0..<panel[i].count,id:\.self) { j in
                    Cell(value: $panel[i][j],i:i,j:j, ctrl: self)
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
