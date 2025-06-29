//
//  ContentView.swift
//  CountApp
//
//  Created by 佐伯小遥 on 2025/06/29.
//

import SwiftUI

struct Choice: Identifiable {
    let id = UUID()
    var text: String
    var count: Int
}

struct ContentView: View {

    @State var question: String = "明日の朝ごはんはどれがいい？"
    @State var choices: [Choice] = [
        Choice(text: "🍚 納豆ご飯", count: 0),
        Choice(text: "🍞 フレンチトースト", count: 0),
        Choice(text: "🍣 寿司", count: 0)
    ]

    var totalCount: Int {
        choices.reduce(0) { $0 + $1.count }
    }

    var body: some View {
        VStack {
            Spacer()

            Text(question)
                .font(.title)
                .padding(.bottom, 40)

            ForEach(choices.indices, id: \.self) { index in
                VStack {
                    Text("\(choices[index].text): \(choices[index].count) 票")
                        .font(.title2)
                        .padding(.bottom, 5)

                    if totalCount > 0 {
                        Text(String(format: "%.0f%%", Double(choices[index].count) / Double(totalCount) * 100))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    Button(action: {
                        choices[index].count += 1
                    }) {
                        Text(choices[index].text)
                            .font(.system(size: 32))
                            .padding(10)
                            .frame(width: 320, height: 70)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .padding(.bottom, 10)
                }
            }

            Spacer()

            Button(action: {
                for i in 0..<choices.count {
                    choices[i].count = 0
                }
            }) {
                Text("リセット")
                    .font(.title3)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    ContentView()
}
