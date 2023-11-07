import Foundation
import SwiftUI
 
struct CardView: View {
 
    @State private var isCovered: Bool = false
    @State var item: String = "ikona"
    var theme: Color
    var body: some View {
 
            Group{
                if (isCovered){
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(theme, lineWidth:2)
                        .fill(.white)
                        .frame(height: 50)
                        .overlay{
                            Text(item)
                                .font(.largeTitle)
                        }
                        
                }else{
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(theme, lineWidth:2)
                        .fill(theme)
                        .frame(height: 50)
                }
            }
            .onTapGesture{
                isCovered.toggle()
            }
 
 
 
    }
}
 
#Preview {
    CardView(theme: Color.blue)
}
 
