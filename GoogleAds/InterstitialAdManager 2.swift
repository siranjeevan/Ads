//
//  InterstitialAdManager 2.swift
//  GoogleAds
//
//  Created by Jeevith on 5/31/25.
//


import Foundation
import GoogleMobileAds
import UIKit
import SwiftUI

class InterstitialAdManager: NSObject, FullScreenContentDelegate, ObservableObject {
    
    @Published var interstitial: InterstitialAd?
    private var shouldShowAd = false

    override init() {
        super.init()
        loadAd()
    }

    func loadAd() {
        let request = Request()
        InterstitialAd.load(
            with: "ca-app-pub-3940256099942544/5135589807", // Test Ad Unit ID
            request: request
        ) { [weak self] ad, error in
            if let error = error {
                print("Interstitial failed to load: \(error.localizedDescription)")
                return
            }
            self?.interstitial = ad
            self?.interstitial?.fullScreenContentDelegate = self
            print("Interstitial loaded successfully.")
            
            // Show ad if user already requested it
            if self?.shouldShowAd == true, let rootVC = UIApplication.shared.topViewController() {
                self?.showAd(from: rootVC)
            }
        }
    }

    func showAd(from rootViewController: UIViewController) {
        if let ad = interstitial {
            ad.present(from: rootViewController)
            shouldShowAd = false
        } else {
            print("Ad not ready yet. Will show when loaded.")
            shouldShowAd = true
        }
    }

//    // MARK: - FullScreenContentDelegate
//
//    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
//        print("Ad dismissed. Loading a new one...")
//        loadAd()
//    }
//
//    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
//        print("Ad failed to present with error: \(error.localizedDescription)")
//        loadAd()
//    }
}
