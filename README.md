# savdhaan_app

The aim of the app is to improve women safety while they tavel/commute.
Providing Area safety to people purchasing home/lands in an unknown place.
Alerting people of safe and unsafe zone

# Progress so far

## Permission
The permission of accessing location data where handled and tested in release and realtime location data is accessed using gps and stored only App state.The location is accessed only when the user is using his phone.
## Proguard
API keys where hided using android pro guard bu using flutter_config package.

## Sliding Up Panel 
The sliding up panel has been setup and the hidden panel ui has been created

## Gooogle Maps
GoogleMaps have been rendered on the screen and tested in release mode flutter version was downgraded 1.22.3 to prevent maps from crashing in release mode.
Markers and Circles have beeen tested with dummy data and needs to be connected to firebase.

## What need to be done
Connecting maps to firebase and getting the location and there respective crime data
Connecting intents to dial to hospital and police station and also to navigate
Getting nearest police station and hospital through places api



