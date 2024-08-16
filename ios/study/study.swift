//
//  study.swift
//  study
//
//  Created by Donna :) on 8/16/24.
//

import WidgetKit
import SwiftUI

private let groupId = "group.isaac_widget"
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😼",title:"PlaceHolder Message")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let data = UserDefaults.init(suiteName: groupId)
        let entry = SimpleEntry(date: Date(), emoji: "😼",title: data?.string(forKey: "title") ?? "oops")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        getSnapshot(in: context) { (entry) in
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
    let title: String
}

struct studyEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            Text(entry.title)
            Text(entry.emoji)
        }
    }
}

struct study: Widget {
    let kind: String = "study"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                studyEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                studyEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    study()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀",title:"Love Isaac")
    SimpleEntry(date: .now, emoji: "🤩",title:"Love Isaac")
}
