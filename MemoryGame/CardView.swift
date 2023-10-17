import Foundation
import SwiftUI
 
struct CardView: View {
 
    @State private var isCovered: Bool = false
    @State var item: String = "ikona"
 
    var body: some View {
 
            Group{
                if (isCovered){
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(.blue, lineWidth:2)
                        .fill(.white)
                        .frame(height: 50)
                        .overlay{
                            Text(item)
                                .font(.largeTitle)
                        }
                        
                }else{
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(.blue, lineWidth:2)
                        .fill(.blue)
                        .frame(height: 50)
                }
            }
            .onTapGesture{
                isCovered.toggle()
            }
 
 
 
    }
}
 
#Preview {
    CardView()
}
 
