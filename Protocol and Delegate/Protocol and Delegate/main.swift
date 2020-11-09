let cache = Cache()
let lockViewModel = LockControllerViewModel(cache: cache)
let lightViewModel = LightControllerViewModel(cache: cache)
let thermoViewModel = ThermoControllerViewModel(cache: cache)

// Fake real-time passing from FCM or APNS.
let realtimeLockData = RealtimeState(id: 1, content: "Front door lock LOCKED")
let realtimeLightData = RealtimeState(id: 2, content: "Living room lamp OFF")
let realtimeThermoData = RealtimeState(id: 3, content: "Bedroom thermostat HEATING")

print("testing")
cache.onReceiveUpdateFromServer(state: realtimeThermoData)
print("done")
