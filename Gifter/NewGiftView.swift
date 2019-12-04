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

struct NewGiftView: View {
  
  // Properties
  // ==========
  
  @ObservedObject var giftList: GiftList
  @State private var recipient = ""
  @State private var description = ""
  @State private var price = ""
  @State private var purchased = false
  @Binding var isPresented: Bool
  
  var body: some View {
    NavigationView {
      VStack {
        Form {
          TextField("Recipient's Name", text: $recipient)
          TextField("Description", text: $description)
          TextField("Price", text: $price)
          Toggle(isOn: $purchased) { Text("Purchased") }
          Button(action: {
            self.giftList.items.append(Gift(description: self.description, recipient: self.recipient, price: Double(self.price) ?? 0.0, isPurchased: self.purchased))
            
            self.isPresented = false
          }) {
            HStack {
              Image(systemName: "plus.square")
              Text("Add Gift")
            }
          }
          .disabled(recipient.count == 0 || description.count == 0 || price.count == 0)
        }
      }
      .navigationBarTitle("New Gift", displayMode: .inline)
    }
  }
}

// Preview
// =======

struct NewGiftView_Previews: PreviewProvider {
  static var previews: some View {
    NewGiftView(giftList: GiftList(), isPresented: .constant(true))
  }
}
