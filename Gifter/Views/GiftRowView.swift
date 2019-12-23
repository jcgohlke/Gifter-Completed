/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct GiftRowView: View {
  
  // Properties
  // ==========
  
  @Binding var gift: Gift
  
  var body: some View {
    HStack(spacing: 12) {
      Button(action: {
        self.gift.isPurchased.toggle()
      }) {
        Image(systemName: gift.isPurchased ? "gift.fill" : "gift")
          .foregroundColor(gift.isPurchased ? .green : .black)
          .font(.system(size: 28, weight: .regular))
      }
      
      VStack(alignment: .leading, spacing: 4) {
        Text(gift.description)
          .font(.title)
        Text(gift.recipient)
          .font(.headline)
      }
      
      Spacer()
      
      Text("$\(gift.price, specifier: "%.2f")")
        .font(.headline)
    }
  }
}

// Preview
// =======

struct GiftRowView_Previews: PreviewProvider {
  static var previews: some View {
    GiftRowView(gift: .constant(Gift(description: "PS4 Controller", recipient: "Doug", price: 38.99)))
  }
}
