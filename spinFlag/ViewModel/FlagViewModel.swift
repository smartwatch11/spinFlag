
import SwiftUI

class FlagViewModel: ObservableObject {
    
    @Published var flagsItems: [FlagItem] = []
    
    func fetchData() {
        flagsItems = [FlagItem(id: 1, flag: "🇫🇷"),
                      FlagItem(id: 2, flag: "🇯🇲"),
                      FlagItem(id: 3, flag: "🇰🇵") ]
    }
}
