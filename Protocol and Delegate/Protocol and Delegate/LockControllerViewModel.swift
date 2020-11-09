class LockControllerViewModel : BaseControllerViewModel {

  override func onRealtimeStateReceived(state: RealtimeState) {
    if (state.id == 1) {
      // Update Lock Controller UI.
      print("Lock real-time state: " + state.content)
    } else {
      print("Not Lock")
    }
  }
}
