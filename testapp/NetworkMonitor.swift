//
//  NetworkMonitor.swift
//  testapp
//
//  Created by Chidume Nnamdi on 22/11/2023.
//
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private let monitor = NWPathMonitor()
    private var isMonitoring = false
    
    var isConnected: Bool {
        return monitor.currentPath.status == .satisfied
    }

    private init() {}

    func startMonitoring() {
        guard !isMonitoring else { return }
        
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                // Handle changes in network status
                print("Is Connected: \(self.isConnected)")
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        isMonitoring = true
    }

    func stopMonitoring() {
        guard isMonitoring else { return }
        
        monitor.cancel()
        isMonitoring = false
    }
}
