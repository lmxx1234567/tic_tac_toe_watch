//
//  ContentView.swift
//  tic_tac_toe WatchKit Extension
//
//  Created by 曹紫光 on 2022/6/27.
//

import SwiftUI

var current = "X"
func changeCurrent(current :String) -> String {
    switch current{
    case "X":
        return "O"
    default:
        return "X"
    }
}
struct Cell: View {
    var id = UUID()
    @State var value = ""
    var body: some View {
        Button(value,action: self.trigger)
    }
    func trigger(){
        switch value{
        case "":
            value = current
            current = changeCurrent(current: current)
        default:
            if(value != current){
                current = value
                value = ""
            }
        }
        return
    }
}



var panel = [
    [Cell(), Cell(), Cell()],
    [Cell(), Cell(), Cell()],
    [Cell(), Cell(), Cell()],
]

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Tic Tac Toe").font(.title3)
            ForEach(0..<panel.count,id:\.self) { i in
                HStack {
                    ForEach(panel[i],id: \.id) { cell in
                        cell
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
