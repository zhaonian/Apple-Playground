class LightControllerViewModel : BaseControllerViewModel {

  override func onRealtimeStateReceived(state: RealtimeState) {
    if (state.id == 2) {
      // Update Light Controller UI.
      print("Light real-time state: " + state.content)
    } else {
      print("No Light")
    }
  }
}
