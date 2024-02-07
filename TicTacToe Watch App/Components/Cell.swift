//
//  Cell.swift
//  TicTacToe WatchKit Extension
//
//  Created by 曹紫光 on 2022/7/4.
//

import SwiftUI

struct Cell: View {
    var controller: ContentView?
    var i,j : Int?
    @Binding var value: String
    
    var body: some View {
        Button(action: trigger){
            Text(value)
        }
    }
    
    init(value: Binding<String>) {
        self._value = value
    }
    
    init(value: Binding<String>,i :Int,j:Int, ctrl: ContentView) {
        controller = ctrl
        self._value = value
        self.i=i
        self.j=j
    }
    
    func trigger() {
        if controller == nil {
            value = value == "O" ? "X" : "O"
        }
        else{
            value = controller!.updateValue(i:self.i!,j:self.j!)
        }
        return
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(value: .constant("X"))
    }
}
