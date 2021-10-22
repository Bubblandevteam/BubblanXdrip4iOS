//
//  Opcode.swift
//  xDripG5
//
//  Copyright © 2018 LoopKit Authors. All rights reserved.
//

import Foundation

enum DexcomTransmitterOpCode: UInt8 {
    // Auth
    case authRequestTx = 0x01

    case authRequestRx = 0x03
    case authChallengeTx = 0x04
    case authChallengeRx = 0x05
    case keepAliveTx = 0x06 // auth; setAdvertisementParametersTx for control
    case bondRequestTx = 0x07
    case paireRequestRx = 0x08 // comes in after having accepted the bluetooth pairing request
    
    // Control
    case disconnectTx = 0x09
    
    case setAdvertisementParametersRx = 0x1c

    case firmwareVersionTx = 0x20
    case firmwareVersionRx = 0x21
    case batteryStatusTx = 0x22
    case batteryStatusRx = 0x23
    case transmitterTimeTx = 0x24
    case transmitterTimeRx = 0x25
    case sessionStartTx = 0x26
    case sessionStartRx = 0x27
    case sessionStopTx = 0x28
    case sessionStopRx = 0x29
    case sensorDataTx = 0x2E
    case sensorDataRx = 0x2F

    case glucoseTx = 0x30
    case glucoseRx = 0x31
    case calibrationDataTx = 0x32
    case calibrationDataRx = 0x33
    case calibrateGlucoseTx = 0x34
    case calibrateGlucoseRx = 0x35

    case glucoseHistoryTx = 0x3e

    case resetTx = 0x42
    case resetRx = 0x43

    case transmitterVersionTx = 0x4a
    case transmitterVersionRx = 0x4b
    
    case glucoseG6Tx = 0x4e
    case glucoseG6Rx = 0x4f

    case glucoseBackfillTx = 0x50
    case glucoseBackfillRx = 0x51
    
    case keepAliveRx = 0xFF // found during testing
}


extension Data {
    init(for opcode: DexcomTransmitterOpCode) {
        self.init([opcode.rawValue])
    }

    func starts(with opcode: DexcomTransmitterOpCode) -> Bool {
        guard count > 0 else {
            return false
        }

        return self[startIndex] == opcode.rawValue
    }
}

extension DexcomTransmitterOpCode: CustomStringConvertible {
    public var description: String {
        switch self {
        case .authRequestRx:
            return "authRequestRx"
        case .authChallengeRx:
            return "authChallengeRx"
        case .sensorDataRx:
            return "sensorDataRx"
        case .resetRx:
            return "resetRx"
        case .batteryStatusRx:
            return "batteryStatusRx"
        case .transmitterVersionRx:
            return "transmitterVersionRx"
        default:
            return self.rawValue.description
        }
    }
}
