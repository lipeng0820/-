import Foundation
import CoreMotion

class MotionDetector: ObservableObject {
    private let motionManager = CMMotionManager()
    private let queue = OperationQueue()

    var shakeDetected: (() -> Void)?

    func start() {
        guard motionManager.isAccelerometerAvailable else {
            print("Accelerometer is not available.")
            return
        }

        motionManager.accelerometerUpdateInterval = 0.1

        motionManager.startAccelerometerUpdates(to: queue) { [weak self] (data, error) in
            guard let data = data, error == nil else {
                print("Error receiving accelerometer data: \(String(describing: error))")
                return
            }

            let accelerationThreshold: Double = 2.5
            let x = data.acceleration.x
            let y = data.acceleration.y
            let z = data.acceleration.z

            if sqrt(x * x + y * y + z * z) > accelerationThreshold {
                DispatchQueue.main.async {
                    self?.shakeDetected?()
                }
            }
        }
    }

    func stop() {
        motionManager.stopAccelerometerUpdates()
    }
}
