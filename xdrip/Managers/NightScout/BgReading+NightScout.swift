import Foundation

extension BgReading {
    
    /// dictionary representation for upload to NightScout
    public var dictionaryRepresentationForNightScoutUpload: [String: Any] {
        
        return  [
            "_id": id,
            "device": deviceName ?? "",
            "date": timeStamp.toMillisecondsAsInt64(),
            "dateString": timeStamp.ISOStringFromDate(),
            "type": "sgv",
            "sgv": Int(calculatedValue.round(toDecimalPlaces: 0)),
            "direction": slopeName,
            "filtered": (ageAdjustedRawValue > 0.0 ? round(ageAdjustedRawValue * 1000) : Int(calculatedValue.round(toDecimalPlaces: 0))*1000),
            "unfiltered": (ageAdjustedRawValue > 0.0 ? round(ageAdjustedRawValue * 1000) : Int(calculatedValue.round(toDecimalPlaces: 0))*1000),
            "noise": 1,
            "sysTime": timeStamp.ISOStringFromDate()
        ]
        
    }
    
}

