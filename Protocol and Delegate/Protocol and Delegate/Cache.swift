class Cache {

  var delegate: RealtimeUpdateListener?

  /* Something like FCM or APNS will trigger this method. */
  func onReceiveUpdateFromServer(state: RealtimeState) {
    delegate?.onRealtimeStateReceived(state: state)
  }

  /* Update the new state to server. */
  func updateState() {
    // This is a dummy method. just to demonstrate this class can handle all the state management.
    print("Updating some new state to server: ")
  }
}
