import SwiftUI

struct HowView: View {
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented.toggle()
                }

            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    Text("Hi！你好：\n\n快速了解一下你应该如何使用这个软件。\n\n1、你可以随时点击右下角关闭这个界面，它只在第一次运行时，提醒新手用户。\n\n2、如果觉得挑战太难或太简单，你可以长按开始界面的大白点。那里有你想要的。\n\n3、晃动一下手机，你可以了解这个软件的由来。\n\n谢谢你的支持！让我们开始挑战吧！")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding()
                }
                .frame(maxWidth: .infinity)
            }
            .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.height * 0.6)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                })
                .padding(.bottom, 10)
                .padding(.trailing, 10),
                alignment: .bottomTrailing
            )
        }
    }
}

struct HowView_Previews: PreviewProvider {
    static var previews: some View {
        HowView(isPresented: .constant(true))
    }
}
