//
// Generated by SwagGen with template `SwiftSAPURLSession`
// https://github.com/MarcoEidinger/SwagGen/tree/sap/Swift-SAPURLSession
//

import Foundation

internal class Scene: APIModel {

    /** Source File */
    public enum SourceFileType: String, Codable, Equatable, CaseIterable {
        case reality = "reality"
        case usdz = "usdz"
    }

    internal var id: String

    internal var alias: String?

    internal var annotationAnchors: [AnnotationAnchor]?

    internal var nameInSourceFile: String?

    internal var referenceAnchor: ReferenceAnchor?

    internal var sourceFile: String?

    /** Source File */
    internal var sourceFileType: SourceFileType?

    internal init(id: String, alias: String? = nil, annotationAnchors: [AnnotationAnchor]? = nil, nameInSourceFile: String? = nil, referenceAnchor: ReferenceAnchor? = nil, sourceFile: String? = nil, sourceFileType: SourceFileType? = nil) {
        self.id = id
        self.alias = alias
        self.annotationAnchors = annotationAnchors
        self.nameInSourceFile = nameInSourceFile
        self.referenceAnchor = referenceAnchor
        self.sourceFile = sourceFile
        self.sourceFileType = sourceFileType
    }

    internal required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        id = try container.decode("id")
        alias = try container.decodeIfPresent("alias")
        annotationAnchors = try container.decodeArrayIfPresent("annotationAnchors")
        nameInSourceFile = try container.decodeIfPresent("nameInSourceFile")
        referenceAnchor = try container.decodeIfPresent("referenceAnchor")
        sourceFile = try container.decodeIfPresent("sourceFile")
        sourceFileType = try container.decodeIfPresent("sourceFileType")
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(alias, forKey: "alias")
        try container.encodeIfPresent(annotationAnchors, forKey: "annotationAnchors")
        try container.encodeIfPresent(nameInSourceFile, forKey: "nameInSourceFile")
        try container.encodeIfPresent(referenceAnchor, forKey: "referenceAnchor")
        try container.encodeIfPresent(sourceFile, forKey: "sourceFile")
        try container.encodeIfPresent(sourceFileType, forKey: "sourceFileType")
    }

    internal func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Scene else { return false }
      guard self.id == object.id else { return false }
      guard self.alias == object.alias else { return false }
      guard self.annotationAnchors == object.annotationAnchors else { return false }
      guard self.nameInSourceFile == object.nameInSourceFile else { return false }
      guard self.referenceAnchor == object.referenceAnchor else { return false }
      guard self.sourceFile == object.sourceFile else { return false }
      guard self.sourceFileType == object.sourceFileType else { return false }
      return true
    }

    internal static func == (lhs: Scene, rhs: Scene) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
