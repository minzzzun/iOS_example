import SwiftUI
import WidgetKit
import AppIntents

struct MyWidgetEntry: TimelineEntry {
    let date: Date
    let favoriteEmoji: String
}

struct MyWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> MyWidgetEntry {
        MyWidgetEntry(date: Date(), favoriteEmoji: "🍎")
    }

    func getSnapshot(in context: Context, completion: @escaping (MyWidgetEntry) -> Void) {
        completion(MyWidgetEntry(date: Date(), favoriteEmoji: "🍎"))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MyWidgetEntry>) -> Void) {
        let timelineEntry = MyWidgetEntry(date: Date(), favoriteEmoji: "🍎")
        completion(Timeline(entries: [timelineEntry], policy: .never))
    }
}

struct MyWidgetView: View {
    var entry: MyWidgetProvider.Entry

    var body: some View {
        VStack {
            Text("Favorite Emoji:")
            Text(entry.favoriteEmoji) // 사용자가 설정한 값을 표시
                .font(.largeTitle)
        }
        .padding()
    }
}
//
//@main
//struct MyWidget: Widget {
//    let kind: String = "MyWidget"
//
//    var body: some WidgetConfiguration {
//        AppIntentConfiguration(
//            kind: kind,
//            intent: ConfigurationAppIntent.self, // Intent 연결
//            provider: MyWidgetProvider()
//        ) { entry in
//            MyWidgetView(entry: entry)
//        }
//        .configurationDisplayName("My Widget")
//        .description("Displays your favorite emoji.")
//    }
//}

