//
//  AttachmentsView.swift
//
//
//  Created by O'Brien, Patrick on 9/16/21.
//

import SwiftUI

public struct AttachmentUIMetadata: Identifiable, Equatable {
    public var id = UUID()
    public var title: String = ""
    public var subtitle: String?
    public var info: String?
    public var image: Image?
    public var icon: Image?
}

struct AttachmentsView: View {
    @Binding var attachmentsUIMetadata: [AttachmentUIMetadata]
    
    let title: String?
    let onAddAttachment: (() -> Void)?
    let onSelectAttachment: ((AttachmentUIMetadata) -> Void)?
    
    init(title: String? = nil,
         attachmentsUIMetadata: Binding<[AttachmentUIMetadata]>,
         onAddAttachment: (() -> Void)? = nil,
         onSelectAttachment: ((AttachmentUIMetadata) -> Void)? = nil)
    {
        self.title = title
        self._attachmentsUIMetadata = attachmentsUIMetadata
        self.onAddAttachment = onAddAttachment
        self.onSelectAttachment = onSelectAttachment
    }

    public var body: some View {
        VStack(spacing: 11) {
            if let title = title {
                HStack {
                    Text(title) + Text(" (\(attachmentsUIMetadata.count))")
                    Spacer()
                }
                .foregroundColor(Color.black)
                .font(.system(size: 15, weight: .bold))
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: 110), alignment: .top), count: 1), spacing: 8) {
                    ForEach(0 ..< attachmentsUIMetadata.count + 1, id: \.self) { index in
                        if index == 0 {
                            if let onAddAttachment = onAddAttachment {
                                AddAttachmentView
                                    .onTapGesture {
                                        onAddAttachment()
                                    }
                            }
                        } else {
                            AttachmentCardView(item: attachmentsUIMetadata[index - 1])
                                .onTapGesture {
                                    onSelectAttachment?(attachmentsUIMetadata[index - 1])
                                }
                        }
                    }
                }
                .padding(.top, 5)
            }
        }
        .padding(.horizontal, 16)
    }
    
    private var AddAttachmentView: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(Color.gray, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [7]))
            .overlay(Image(systemName: "plus").font(.system(size: 22)).foregroundColor(Color.fioriNextTint))
            .frame(width: 110, height: 110)
    }
}

private struct AttachmentCardView: View {
    var item: AttachmentUIMetadata
    
    var body: some View {
        VStack {
            ZStack {
                (item.icon ?? Image(systemName: "info"))
                    .font(.system(size: 28))
                    .foregroundColor(.gray)
                
                if let image = item.image {
                    image
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(width: 110, height: 110)
            .cornerRadius(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .bold()
                        .lineLimit(2)
                        .truncationMode(.middle)
                    if let subtitle = item.subtitle {
                        Text(subtitle)
                            .foregroundColor(.gray)
                    }
                    if let info = item.info {
                        Text(info)
                            .foregroundColor(.gray)
                    }
                }
                .lineLimit(1)
                .font(.system(size: 11))
                .foregroundColor(Color.black)
                Spacer()
            }
            Spacer()
        }
        .frame(width: 110)
    }
}
