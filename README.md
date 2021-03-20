# savdhaan_app

1. The aim of the app is to improve women safety while they tavel/commute.
2. Providing Area safety to people purchasing home/lands in an unknown place.
3. Alerting people of safe and unsafe zone

# Progress so far

## Permission
1. The permission of accessing location data where handled and tested in release and realtime location data is accessed using gps and stored only App state.
2. The location is accessed only when the user is using his phone.
## Proguard
1. API keys where hided using android pro guard bu using flutter_config package.

## Sliding Up Panel 
1. The sliding up panel has been setup and the hidden panel ui has been created

## Gooogle Maps
1. GoogleMaps have been rendered on the screen and tested in release mode flutter version was downgraded 1.22.3 to prevent maps from crashing in release mode.
2. Markers and Circles have beeen tested with dummy data and needs to be connected to firebase.

## What need to be done
1. Connecting maps to firebase and getting the location and there respective crime data
2. Connecting intents to dial to hospital and police station and also to navigate
3. Getting nearest police station and hospital through places api



