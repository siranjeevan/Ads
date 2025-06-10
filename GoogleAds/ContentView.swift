import SwiftUI
import UIKit

struct ContentView: View {
    @StateObject private var interstitialAdManager = InterstitialAdManager()

    var body: some View {
        VStack {
            Spacer()
            
            Text("Google Mobile Ads Example")
                .font(.title)
                .padding()
            
            Button("Show Interstitial Ad") {
                print("jeevith")
                if let rootVC = UIApplication.shared.topViewController() {
                    interstitialAdManager.showAd(from: rootVC)
                } else {
                    print("Failed to find root view controller.")
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()

            AdBannerView()
                .frame(width: UIScreen.main.bounds.width,
                       height: 50)
                .background(Color.gray.opacity(0.2))
        }
        .padding()
    }
}
