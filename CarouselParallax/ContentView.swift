//
//  ContentView.swift
//  CarouselParallax
//
//  Created by Jorge Verdugo on 05/11/24.
//

import SwiftUI

struct ContentView: View {
    
    func getScale(proxy: GeometryProxy) -> CGFloat {
        let midPoint: CGFloat = 190
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold {
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
        return scale
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 10) {
                ForEach(0 ..< 10) { num in
                    GeometryReader { proxy in
                        let scale = getScale(proxy: proxy)
                        VStack(spacing: 8) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 200)
                                .background(Color.pink)
                                .cornerRadius(20)
                                .foregroundColor(.indigo)
                        }
                        .scaleEffect(.init(width: scale, height: scale))
                        .animation(.spring(), value: 1)
                    }
                    .frame(width: 125, height: 250)
                    .padding(.horizontal, 12)
                    .padding(.leading, num == 0 ? 120 : 0)
                    .padding(.trailing, num == 9 ? 90 : 0)
                }
                Spacer()
                    .frame(width: 16)
            }
            .padding(.top, 30)
        }
    }
}

#Preview {
    ContentView()
}
