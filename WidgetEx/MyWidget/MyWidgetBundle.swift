//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by 김민준 on 12/11/24.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyWidget()
        MyWidgetControl()
        MyWidgetLiveActivity()
    }
}
