//
//  BotonCircularModifier.swift
//  Contactos
//
//  Created by Jorge Millan on 10/3/22.
//

import SwiftUI

struct BotonCircularModifier: ViewModifier {
    
    var fontFamily: String?
    var fontSize: CGFloat?
    var foregroundColor: Color?
    var backgroundColor: Color?
    var padding: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .padding(padding ?? 20)
            .background(backgroundColor ?? Color.gray)
            .clipShape(Circle())
            .foregroundColor(foregroundColor ?? .white)
            .font(.custom(fontFamily ?? "Arial", size: fontSize ?? 20))
    }
}

struct MyModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("JM")
            .modifier(BotonCircularModifier())
    }
}

extension View {
    func circularButton(fontFamily: String?,
                        fontSize: CGFloat?,
                        foregroundColor: Color?,
                        backgroundColor: Color?,
                        padding: CGFloat?) -> some View {
        self.modifier(BotonCircularModifier(fontFamily: fontFamily,
                                            fontSize: fontSize,
                                            foregroundColor: foregroundColor,
                                            backgroundColor: backgroundColor,
                                            padding: padding))
    }
}
