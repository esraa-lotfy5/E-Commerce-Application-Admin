//
//  Featurecard.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 19/06/2022.
//

import SwiftUI
import Kingfisher

struct FeatureCard: View {
    var image: KFImage

    var body: some View {
        image.resizable()
            .scaledToFit()
    }
}
