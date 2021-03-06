//
//  NeoView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import SwiftUI
import Neumorphic

struct NeoContentView: View {
    var body: some View {
        let cornerRadius : CGFloat = 15
        let mainColor = Color.Neumorphic.main
        let secondaryColor = Color.Neumorphic.secondary
        
        let size: CGFloat = 112
        
        return ZStack {
            mainColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 30) {
                Text("Neumorphic Soft UI").font(.headline).foregroundColor(secondaryColor)
                //Create simple shapes with soft inner shadow
                HStack(spacing: 40){
                    RoundedRectangle(cornerRadius: cornerRadius).fill(mainColor).frame(width: 150, height: 150)
                        .softInnerShadow(RoundedRectangle(cornerRadius: cornerRadius))
                    
                    Circle().fill(mainColor).frame(width: 150, height: 150)
                        .softInnerShadow(Circle())
                }
                //You can customize shadow by changing its color, spread, and shadow radius.
                HStack(spacing: 40) {
                    ZStack {
                        Circle().fill(mainColor).frame(width: 120, height: 120)
                            .softInnerShadow(Circle(), spread: 0.6)
                        
                        Circle().fill(mainColor).frame(width: size, height: size)
                            .softOuterShadow(offset: 2, radius: 1)
                    }.frame(width: 150, height: 150)
                    
                    ZStack {
                        Circle().fill(mainColor)
                            .softOuterShadow()
                        
                        Circle().fill(mainColor).frame(width: 80, height: 80)
                            .softInnerShadow(Circle(), radius: 5)
                    }.frame(width: 150, height: 150)
                }
                //Rectanlges with soft outer shadow
                HStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(mainColor).frame(width: 90, height: 90)
                        .softOuterShadow()
                    
                    RoundedRectangle(cornerRadius: cornerRadius).fill(mainColor).frame(width: 90, height: 90)
                        .softInnerShadow(RoundedRectangle(cornerRadius: cornerRadius))
                    
                    Rectangle().fill(mainColor).frame(width: 90, height: 90)
                        .softOuterShadow()
                    
                }
                
                //You can simply create soft button with softButtonStyle method.
                Button(action: {}) {
                    Text("Soft Button").fontWeight(.bold)
                }.softButtonStyle(RoundedRectangle(cornerRadius: cornerRadius))
                
                HStack(spacing: 20) {
                    //Circle Button
                    Button(action: {}) {
                        Image(systemName: "heart.fill")
                    }.softButtonStyle(Circle())
                    
                    
                    //Ellipse Button
                    Button(action: {}) {
                        Text("Thanks").fontWeight(.bold).frame(width: 150, height: 20)
                    }.softButtonStyle(Ellipse())
                        
                    //Circle Button
                    Button(action: {}) {
                        Image(systemName: "heart.fill")
                    }.softButtonStyle(Circle(), mainColor: Color.red, textColor: Color.white, darkShadowColor: Color("redButtonDarkShadow"), lightShadowColor:Color("redButtonLightShadow"))
                    
                }
                 
                Text("Twitter @costachung").font(.footnote).foregroundColor(secondaryColor)
                
            }
        }
    }
}


struct NeoContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           NeoContentView()
              .environment(\.colorScheme, .light)

//           NeoContentView()
//              .environment(\.colorScheme, .dark)
        }
    }
}



