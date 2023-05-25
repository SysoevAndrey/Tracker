//
//  AnalyticsService.swift
//  Tracker
//
//  Created by Andrey Sysoev on 24.05.2023.
//

import Foundation
import YandexMobileMetrica

struct AnalyticsService {
    static func activate() {
        guard let configuration = YMMYandexMetricaConfiguration(apiKey: "2c0d6097-f48f-49e9-87a2-7a1c7a7fdeb1") else { return }
        YMMYandexMetrica.activate(with: configuration)
    }
    
    func report(event: String, params: [AnyHashable: Any]) {
        YMMYandexMetrica.reportEvent(event, parameters: params) { error in
            print("REPORT ERROR: %@", error.localizedDescription)
        }
    }
}
