// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: eos.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct Eosapi_EosTxReq {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var path: String = String()

  public var signDatas: [Eosapi_EosSignData] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Eosapi_EosSignData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var txData: String = String()

  public var pubKeys: [String] = []

  public var chainID: String = String()

  public var to: String = String()

  public var from: String = String()

  public var payment: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Eosapi_EosTxRes {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var transMultiSigns: [Eosapi_EosSignResult] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Eosapi_EosSignResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var hash: String = String()

  public var signs: [String] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Eosapi_EosPubkeyReq {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var path: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Eosapi_EosPubkeyRes {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var pubkey: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Eosapi_EosMessageSignReq {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var path: String = String()

  public var data: String = String()

  public var isHex: Bool = false

  public var pubkey: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Eosapi_EosMessageSignRes {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var signature: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "eosapi"

extension Eosapi_EosTxReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EosTxReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "path"),
    2: .standard(proto: "sign_datas"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.path)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.signDatas)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.path.isEmpty {
      try visitor.visitSingularStringField(value: self.path, fieldNumber: 1)
    }
    if !self.signDatas.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.signDatas, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Eosapi_EosTxReq, rhs: Eosapi_EosTxReq) -> Bool {
    if lhs.path != rhs.path {return false}
    if lhs.signDatas != rhs.signDatas {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Eosapi_EosSignData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EosSignData"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "tx_data"),
    2: .standard(proto: "pub_keys"),
    3: .standard(proto: "chain_id"),
    4: .same(proto: "to"),
    5: .same(proto: "from"),
    6: .same(proto: "payment"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.txData)
      case 2: try decoder.decodeRepeatedStringField(value: &self.pubKeys)
      case 3: try decoder.decodeSingularStringField(value: &self.chainID)
      case 4: try decoder.decodeSingularStringField(value: &self.to)
      case 5: try decoder.decodeSingularStringField(value: &self.from)
      case 6: try decoder.decodeSingularStringField(value: &self.payment)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.txData.isEmpty {
      try visitor.visitSingularStringField(value: self.txData, fieldNumber: 1)
    }
    if !self.pubKeys.isEmpty {
      try visitor.visitRepeatedStringField(value: self.pubKeys, fieldNumber: 2)
    }
    if !self.chainID.isEmpty {
      try visitor.visitSingularStringField(value: self.chainID, fieldNumber: 3)
    }
    if !self.to.isEmpty {
      try visitor.visitSingularStringField(value: self.to, fieldNumber: 4)
    }
    if !self.from.isEmpty {
      try visitor.visitSingularStringField(value: self.from, fieldNumber: 5)
    }
    if !self.payment.isEmpty {
      try visitor.visitSingularStringField(value: self.payment, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Eosapi_EosSignData, rhs: Eosapi_EosSignData) -> Bool {
    if lhs.txData != rhs.txData {return false}
    if lhs.pubKeys != rhs.pubKeys {return false}
    if lhs.chainID != rhs.chainID {return false}
    if lhs.to != rhs.to {return false}
    if lhs.from != rhs.from {return false}
    if lhs.payment != rhs.payment {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Eosapi_EosTxRes: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EosTxRes"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "trans_multi_signs"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.transMultiSigns)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.transMultiSigns.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.transMultiSigns, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Eosapi_EosTxRes, rhs: Eosapi_EosTxRes) -> Bool {
    if lhs.transMultiSigns != rhs.transMultiSigns {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Eosapi_EosSignResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EosSignResult"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "hash"),
    2: .same(proto: "signs"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.hash)
      case 2: try decoder.decodeRepeatedStringField(value: &self.signs)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.hash.isEmpty {
      try visitor.visitSingularStringField(value: self.hash, fieldNumber: 1)
    }
    if !self.signs.isEmpty {
      try visitor.visitRepeatedStringField(value: self.signs, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Eosapi_EosSignResult, rhs: Eosapi_EosSignResult) -> Bool {
    if lhs.hash != rhs.hash {return false}
    if lhs.signs != rhs.signs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Eosapi_EosPubkeyReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EosPubkeyReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "path"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.path)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.path.isEmpty {
      try visitor.visitSingularStringField(value: self.path, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Eosapi_EosPubkeyReq, rhs: Eosapi_EosPubkeyReq) -> Bool {
    if lhs.path != rhs.path {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Eosapi_EosPubkeyRes: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EosPubkeyRes"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "pubkey"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.pubkey)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.pubkey.isEmpty {
      try visitor.visitSingularStringField(value: self.pubkey, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Eosapi_EosPubkeyRes, rhs: Eosapi_EosPubkeyRes) -> Bool {
    if lhs.pubkey != rhs.pubkey {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Eosapi_EosMessageSignReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EosMessageSignReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "path"),
    2: .same(proto: "data"),
    3: .standard(proto: "is_hex"),
    4: .same(proto: "pubkey"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.path)
      case 2: try decoder.decodeSingularStringField(value: &self.data)
      case 3: try decoder.decodeSingularBoolField(value: &self.isHex)
      case 4: try decoder.decodeSingularStringField(value: &self.pubkey)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.path.isEmpty {
      try visitor.visitSingularStringField(value: self.path, fieldNumber: 1)
    }
    if !self.data.isEmpty {
      try visitor.visitSingularStringField(value: self.data, fieldNumber: 2)
    }
    if self.isHex != false {
      try visitor.visitSingularBoolField(value: self.isHex, fieldNumber: 3)
    }
    if !self.pubkey.isEmpty {
      try visitor.visitSingularStringField(value: self.pubkey, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Eosapi_EosMessageSignReq, rhs: Eosapi_EosMessageSignReq) -> Bool {
    if lhs.path != rhs.path {return false}
    if lhs.data != rhs.data {return false}
    if lhs.isHex != rhs.isHex {return false}
    if lhs.pubkey != rhs.pubkey {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Eosapi_EosMessageSignRes: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EosMessageSignRes"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "signature"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.signature)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.signature.isEmpty {
      try visitor.visitSingularStringField(value: self.signature, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Eosapi_EosMessageSignRes, rhs: Eosapi_EosMessageSignRes) -> Bool {
    if lhs.signature != rhs.signature {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}