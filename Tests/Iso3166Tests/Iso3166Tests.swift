import Iso3166
import Testing

@Test func chinaRegionAndCurrencyMappings() throws {
    let byCode = try #require(FromCode["CN"])
    #expect(byCode == China)
    #expect(FromRegionInCN["中国大陆"] == China)
    #expect(FromCommonNameInAlphaNumeric["China"] == China)
    #expect(China.callingCode == "86")
    #expect(China.alphabeticCode == "CNY")
    #expect(China.numericCode4217 == "156")

    let cny = try #require(FromAlphabeticCode["CNY"])
    #expect(cny.entities.contains("CN"))
    #expect(cny.numericCode4217 == "156")
    #expect(cny.currency == China.currency)
}

@Test func hongKongRegionAndCurrencyMappings() throws {
    let byCode = try #require(FromCode["HK"])
    #expect(byCode == HongKong)
    #expect(FromRegionInCN["中国香港"] == HongKong)
    #expect(FromCommonNameInAlphaNumeric["HongKong"] == HongKong)
    #expect(HongKong.callingCode == "852")
    #expect(HongKong.alphabeticCode == "HKD")
    #expect(HongKong.numericCode4217 == "344")

    let hkd = try #require(FromAlphabeticCode["HKD"])
    #expect(hkd.entities.contains("HK"))
    #expect(hkd.numericCode4217 == "344")
    #expect(hkd.currency == HongKong.currency)
}

@Test func unitedStatesRegionAndCurrencyMappings() throws {
    let byCode = try #require(FromCode["US"])
    #expect(byCode == UnitedStates)
    #expect(FromRegionInCN["美国"] == UnitedStates)
    #expect(FromCommonNameInAlphaNumeric["UnitedStates"] == UnitedStates)
    #expect(UnitedStates.callingCode == "1")
    #expect(UnitedStates.alphabeticCode.isEmpty)

    let usd = try #require(FromAlphabeticCode["USD"])
    #expect(usd.entities.contains("US"))
    #expect(usd.numericCode4217 == "840")
    #expect(usd.currencyInCN == UnitedStates.currencyInCN)
    #expect(usd.currency == UnitedStates.currencyInNative)
}
