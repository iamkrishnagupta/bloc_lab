# BLoC (Business Logic Component) is a state management architecture for Flutter apps.

### Flow:

1. Events: Widgets trigger events (e.g., button clicks, text changes) by calling methods on the BLoC.
2. BLoC: The BLoC receives the event and processes it, potentially updating its internal state.
3. States: The BLoC emits a new state, which is a snapshot of its current state.
4. Widgets: Widgets listen to the BLoC's state stream and rebuild themselves when a new state is emitted.

### Key Components:

1. Events: Input data for the BLoC, typically triggered by user interactions.
2. BLoC: The central component that processes events and manages state.
3. States: Outputs of the BLoC, representing its current state.
4. Streams: Used to emit states and notify widgets of changes.

### BLoC Process:

1. Initialize the BLoC with an initial state.
2. Receive an event from a widget.
3. Process the event, updating the internal state if necessary.
4. Emit a new state through the state stream.
5. Repeat steps 2-4 for each event.
