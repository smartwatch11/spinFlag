
import SwiftUI

struct FlagView: View {
    
    @StateObject var viewModel = FlagViewModel()
    @State private var pos: CGPoint = .zero
    
    var body: some View {
        VStack {
            //ScrollViewReader { value in
                Spacer()
                Rectangle()
                    .foregroundColor(.clear)
                    .border(.black, width: 4)
                    .frame(width: 100, height: 100)
                    .overlay {
//                        ScrollView(.vertical, showsIndicators: false) {
                        ScrollableView(self.$pos, animationDuration: 5.0) {
                            LazyVStack {
                                ForEach(viewModel.flagsItems, id: \.self) {flag in
                                    Text(flag.flag)
                                        .font(.system(size: 60))
                                        .id(flag.id)
                                        .padding()
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollDisabled(true)
                        //.scrollPosition(id: $pos)
                    }
                Spacer()
                Button {
//                    withAnimation(.easeInOut(duration: 1.5)) {
//                        value.scrollTo(3)
                    self.pos = CGPoint(x: 0, y: (112 * 2))
//                    }
                    
                    // заглушка чтобы спин возвращался назад через 2 секунды и можно было повторно прокрутить
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                        withAnimation(.easeOut(duration: 1.5)) {
                            //value.scrollTo(1)
                        self.pos = .zero
//                        }
                    }
                } label: {
                    Text("Hit me!")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }
                .frame(height: 60)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(.blue)
                .cornerRadius(10)
            }
            .padding()
        //}
        .onAppear {
            viewModel.fetchData()
        }
    }
}
