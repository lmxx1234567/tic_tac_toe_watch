//
//  Cell.swift
//  TicTacToe WatchKit Extension
//
//  Created by 曹紫光 on 2022/7/4.
//

import SwiftUI

struct Cell: View {
    var controller: ContentView?
    @Binding var value: String
    
    var body: some View {
        Button(action: trigger){
            Text(value)
        }
    }
    
    init(value: Binding<String>) {
        self._value = value
    }
    
    init(value: Binding<String>, ctrl: ContentView) {
        controller = ctrl
        self._value = value
    }
    
    func trigger() {
        if controller == nil {
            value = value == "O" ? "X" : "O"
        }
        else{
            switch value {
            case "":
                value = controller!.current
                controller!.current = controller!.changeCurrent(current: controller!.current)
            default:
                if(value != controller!.current){
                    controller!.current = value
                    value = ""
                }
            }
        }
        return
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(value: .constant("X"))
    }
}
