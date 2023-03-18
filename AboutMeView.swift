import SwiftUI
import AVKit

struct AboutMeView: View {
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
                    VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "Ayumu", withExtension: "mov")!).muted())
                        .aspectRatio(4/3, contentMode: .fit)
                    
                    Text("Ayumu正在进行实验\n\nAyumu was working \n\n从有这个想法到写出这个软件，就是周末2天的时间。\n\n程序的灵感来自于京都大学的一个课题实验，一只叫做Ayumu的猩猩曾参与了京都大学的这个实验项目。让我不禁感叹，虽同为类人猿，几百万年的进化，人类到底是进步了还是退步了？\n\n那些曾写入我们DNA的“超能力”，通过一些训练，还能够被再次激活吗？\n\n来吧，这个软件也许可以帮你一起探索！\n\n站在这个AI爆发的奇点上，感叹自然进化与人类科技的伟大！再次感谢OpenAI创造出GPT这样伟大的模型。\n\n@lipeng0820 创作于2023年3月 北京\n\nFrom having the idea to writing the software was a 2-day weekend.\n\nThe inspiration for the program came from an experiment at Kyoto University, where an orangutan named Ayumu was involved in an experimental project. I can't help but wonder whether humans have progressed or regressed over the millions of years of evolution, despite being apes.\n\nCan those \"superpowers\" that were written into our DNA be reactivated with some training?\n\nCome on, this software may help you to explore together!\n\nStand at the singularity of this AI explosion and marvel at the greatness of natural evolution and human technology! Thanks again to OpenAI for creating such a great model as GPT.\n\n By @lipeng0820 in Beijing 2023.3")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()

                }
                .frame(maxWidth: .infinity)
            }
            .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.height * 0.75)
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

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView(isPresented: .constant(true))
    }
}

extension AVPlayer {
    func muted() -> AVPlayer {
        self.isMuted = true
        return self
    }
}
