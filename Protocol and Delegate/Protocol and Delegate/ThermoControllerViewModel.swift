class ThermoControllerViewModel : BaseControllerViewModel {

  override func onRealtimeStateReceived(state: RealtimeState) {
    if (state.id == 3) {
      // Update Thermostat Controller UI.
      print("Thermostat real-time state: " + state.content)
    } else {
      print("No Thermostat")
    }
  }
}
