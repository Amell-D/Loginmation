//
//  HomeView.swift
//  Restart
//
//  Created by Amel Dizdarevic on 7/21/22.
//

import SwiftUI

struct HomeView: View {

    @AppStorage("onboarding") var isOnboardingActive = false
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // MARK: Header
            Spacer()

            // MARK: Center
            Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(Animation.easeInOut(duration: 4).repeatForever(), value: isAnimating)
                .background(
                    CircleViewGroup(ShapeColor: .gray, ShapeOpacity: 0.1)
                )
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            // MARK: Footer
            Spacer()

            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
