//
//  Configuration.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//


import Foundation

enum ConfigurationKey: String {
    case baseUrl = "BASE_URL"
    case ipBaseUrl = "BASE_URL_IP"
    case applicationCode = "APPLICATION_CODE"
}

enum WeatherError: Error {
    case invalidApplicationCode
    case invalidEndpoint
    case undefinedError
}

enum MerlinConfigurationPath: String {
    case configuration = "Configuration"
    case anteiaConfiguration = "AnteiaConfiguration"
}


class Configuration {
    
    struct ConfigurationType {
        static let developtment = "Development"
        static let production = "Production"
    }
    
    let isDevelopment = true
    var configurationPath = "Configuration"
    var bundle: Bundle?
    
    var mode: String {
        return isDevelopment ? ConfigurationType.developtment : ConfigurationType.production
    }
    
    var modeIsActive = true
    
    func getValueConfiguration<T> (withType _: T.Type, key: ConfigurationKey) -> T? {
        bundle = Bundle.main
        configurationPath = MerlinConfigurationPath.configuration.rawValue
        modeIsActive = true
        
        if let configurations = getConfigurations() {
            return configurations.object(forKey: key.rawValue) as? T
        }
        return nil
    }
    
    func getApplicationCode() throws -> String? {
        bundle = Bundle.main
        configurationPath = MerlinConfigurationPath.anteiaConfiguration.rawValue
        modeIsActive = false
    
        guard let configurations = getConfigurations(),
              let appCode = configurations.object(forKey: ConfigurationKey.applicationCode.rawValue) as? String else {
            throw WeatherError.invalidApplicationCode
        }
        return appCode
    }
    
    private func getConfigurations () -> NSDictionary? {
        guard let bundle = bundle else { return nil }
        let envsPListPath = bundle.path(forResource: configurationPath, ofType: "plist")
        guard let data = try? NSData(contentsOfFile: envsPListPath ?? "") as Data else {
            return nil
        }
        
        do {
            if let enviroments = try PropertyListSerialization.propertyList(from: data,
                                                                            options: .mutableContainersAndLeaves,
                                                                            format: nil) as? [String: Any] {
                return (modeIsActive ? enviroments[mode] : enviroments) as? NSDictionary
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
