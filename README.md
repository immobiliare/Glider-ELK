<p align="center">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./Documentation/assets/glider-elk-dark.png" width="350">
  <img alt="logo-library" src="./Documentation/assets/glider-elk-light.png" width="350">
</picture>
</p>

[![Swift](https://img.shields.io/badge/Swift-5.1_5.3_5.4_5.5_5.6_5.7-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.1_5.3_5.4_5.5_5.6_5.7-Orange?style=flat-square)
[![Platform](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20Linux-4E4E4E.svg?colorA=28a745)](#installation)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/GliderELK.svg?style=flat-square)](https://img.shields.io/cocoapods/v/GliderLogger.svg)

# Glider

**Glider is the logger for just about everything!**

It's designed to be:
- **SIMPLE**: with a modular & extensible architecture, fully documented
- **PERFORMANT**: you can use Glider without the worry of impacting your app performances
- **UNIVERSAL**: it supports 14+ transports to satisfy every need; you can create your transport too!

See the [project's page on GitHub for more informations](https://github.com/immobiliare/Glider).

# Glider-ELK

Glider-ELK is a logging trasnport for Glider Logging Framework.

The log entries are properly formatted, cached, and then uploaded via HTTP/HTTPS to elastic/logstash, which allows for further processing in its pipeline. The logs can then be stored in elastic/elasticsearch and visualized in elastic/kibana.

- Uploads the log data automatically to Logstash (e.g. the ELK stack)
- Caches the created log entries and sends them via HTTP either periodically or when exceeding a certain configurable memory threshold to Logstash
- Converts the logging metadata to a JSON representation, which allows querying after those values (e.g. filter after a specific parameter in Kibana)
- Logs itself via a background activity logger (including protection against a possible infinite recursion)

```swift
let elkTransport = try GliderELKTransport(hostname: "127.0.0.1", port: 5000, delegate: self) {
    $0.uploadInterval = TimeAmount.seconds(10)
}
        
let logger = Log {
    $0.subsystem = "com.myapp"
    $0.category = "network"
    $0.level = .info
    $0.transports = [elkTransport]
}
```

# Install

This package require the Core Library of Glider you [can found here](https://github.com/immobiliare/Glider).  
Package is distributed both as CocoaPods dependency and SPM dependency.

## Swift Package Manager

The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler. It is in early development, but Glider does support its use on supported platforms.

Once you have your Swift package set up, adding Glider as a dependency is as easy as adding it to the dependencies value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/immobiliare/Glider-ELK.git")
]
```

## CocoaPods

CocoaPods is a dependency manager for Cocoa projects.  
To integrate Glider into your project, specify it in your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

pod 'GliderELK'
```

## Requirements

Minimum requirements are:
- Swift 5.4
- iOS 13+, macOS 10.15+

## Support & Contribute

Made with ❤️ by [ImmobiliareLabs](https://github.com/orgs/immobiliare) & [Contributors](https://github.com/immobiliare/Glider/graphs/contributors)

We'd love for you to contribute to Glider!  
If you have questions on using Glider, bugs, and enhancement, please feel free to reach out by opening a [GitHub Issue](https://github.com/immobiliare/Glider/issues).

<a href="http://labs.immobiliare.it"><img src="./Documentation/assets/immobiliarelabs.png" alt="Indomio" width="200"/></a>