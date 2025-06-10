//
//  AdBannerView 2.swift
//  GoogleAds
//
//  Created by Jeevith on 5/31/25.
//


import SwiftUI
import GoogleMobileAds
import UIKit

struct AdBannerView: UIViewRepresentable {
    // Banner Ads Return
    func makeUIView(context: Context) -> BannerView {
        
        // this is get the screen with
        let screenWidth = UIScreen.main.bounds.width
        
        //this is used to ads convert size all platform responceble
        let adSize = currentOrientationAnchoredAdaptiveBanner(width: screenWidth)
        //that is get the bannerads sixe
        let adView = BannerView(adSize: adSize)
        
        adView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        
        //ads loading
        adView.load(Request())
        return adView
    }

    func updateUIView(_ uiView: BannerView, context: Context) {
    }
}
