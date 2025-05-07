//
//  CardView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-06.
//

import SwiftUI

struct CardView: View {
    let heading: String
    let infoItems: [(String, String)]
    let cornerRadius: CGFloat
    let padding: CGFloat
    let shadowRadius: CGFloat
    let tint: Color

    init(
        heading: String,
        infoItems: [(String, String)],
        tint: Color = .accentColor,
        cornerRadius: CGFloat = 16,
        padding: CGFloat = 16,
        shadowRadius: CGFloat = 4
    ) {
        self.heading = heading
        self.infoItems = infoItems
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.shadowRadius = shadowRadius
        self.tint = tint
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(heading)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.bottom, 8)

            ForEach(infoItems, id: \.0) { item in
                HStack(alignment: .top, spacing: 8) {
                    Text(item.0)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .frame(width: 100, alignment: .leading)

                    Text(item.1)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)

                    Spacer()
                }
            }
        }
        .padding(padding)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(tint.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(tint.opacity(0.3), lineWidth: 1)
        )
        .shadow(color: tint.opacity(0.08), radius: shadowRadius, x: 0, y: 2)
        .padding(.horizontal)
    }
}

//import SwiftUI
//
//struct CardView: View {
//    let heading: String
//    let infoItems: [(String, String)]
//    let cornerRadius: CGFloat
//    let padding: CGFloat
//    let shadowRadius: CGFloat
//    let tint: Color
//
//    init(
//        heading: String,
//        infoItems: [(String, String)],
//        tint: Color = .accentColor,
//        cornerRadius: CGFloat = 16,
//        padding: CGFloat = 16,
//        shadowRadius: CGFloat = 4
//    ) {
//        self.heading = heading
//        self.infoItems = infoItems
//        self.cornerRadius = cornerRadius
//        self.padding = padding
//        self.shadowRadius = shadowRadius
//        self.tint = tint
//    }
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            Text(heading)
//                .font(.title3)
//                .fontWeight(.semibold)
//                .foregroundColor(tint)
//
//            ForEach(infoItems, id: \.0) { item in
//                HStack(alignment: .top, spacing: 8) {
//                    Text(item.0)
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                        .frame(width: 100, alignment: .leading)
//
//                    Text(item.1)
//                        .font(.subheadline)
//                        .foregroundColor(.primary)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(3)
//                        .fixedSize(horizontal: false, vertical: true)
//
//                    Spacer()
//                }
//                .padding(.vertical, 4)
//                .padding(.horizontal, 8)
//                .background(
//                    RoundedRectangle(cornerRadius: 8)
//                        .fill(tint.opacity(0.05))
//                )
//            }
//        }
//        .padding(padding)
//        .background(
//            RoundedRectangle(cornerRadius: cornerRadius)
//                .fill(.ultraThinMaterial)
//                .overlay(
//                    RoundedRectangle(cornerRadius: cornerRadius)
//                        .stroke(tint.opacity(0.3), lineWidth: 1)
//                )
//                .shadow(color: tint.opacity(0.08), radius: shadowRadius, x: 0, y: 2)
//        )
//        .padding(.horizontal)
//    }
//}
//
//
////import SwiftUI
////
////struct CardView: View {
////    let heading: String
////    let infoItems: [(String, String)]
////    let cornerRadius: CGFloat
////    let padding: CGFloat
////    let shadowRadius: CGFloat
////    let tint: Color
////
////    init(
////        heading: String,
////        infoItems: [(String, String)],
////        tint: Color = .primary,
////        cornerRadius: CGFloat = 16,
////        padding: CGFloat = 16,
////        shadowRadius: CGFloat = 4
////    ) {
////        self.heading = heading
////        self.infoItems = infoItems
////        self.cornerRadius = cornerRadius
////        self.padding = padding
////        self.shadowRadius = shadowRadius
////        self.tint = tint
////    }
////
////    var body: some View {
////        VStack(alignment: .leading, spacing: 12) {
////            Text(heading)
////                .font(.headline)
////                .foregroundColor(tint)
////                .fontWeight(.bold)
////
////            // Loop through the infoItems and display them
////            ForEach(infoItems, id: \.0) { item in
////                HStack {
////                    Text("\(item.0):")
////                        .font(.subheadline)
////                        .foregroundColor(.secondary)
////                        .frame(width: 120, alignment: .leading)
////
////                    Text(item.1)
////                        .font(.subheadline)
////                        .foregroundColor(.primary)
////                        .lineLimit(nil)
////                }
////            }
////        }
////        .padding(padding)
////        .background(
////            RoundedRectangle(cornerRadius: cornerRadius)
////                .fill(Color(.systemBackground))
////                .stroke(tint, lineWidth: 2)
////                .shadow(color: tint.opacity(0.05), radius: shadowRadius, x: 0, y: 2)
////        )
////        .padding(.horizontal)
////    }
////}
//
