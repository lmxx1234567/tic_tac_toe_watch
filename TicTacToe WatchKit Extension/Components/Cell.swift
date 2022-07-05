//
//  Cell.swift
//  TicTacToe WatchKit Extension
//
//  Created by 曹紫光 on 2022/7/4.
//

import SwiftUI

struct Cell: View {
    var id = UUID()
    var controller: ContentView
    @Binding var value: String
    
    var body: some View {
        Button(value, action: self.trigger)
    }
    
    init(value: Binding<String>, ctrl: ContentView) {
        controller = ctrl
        self._value = value
    }
    
    func trigger() {
        switch value {
        case "":
            value = controller.current
            controller.current = controller.changeCurrent(current: controller.current)
        default:
            if(value != controller.current){
                controller.current = value
                value = ""
            }
        }
        return
    }
}
