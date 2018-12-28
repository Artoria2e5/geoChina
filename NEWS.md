# CHANGES IN geoChina VERSION 1.3.2

## BUG FIXES

- Load the Google Geocode API with "https://" instead of "http://".


# CHANGES IN geoChina VERSION 1.3.1

## BUG FIXES

- replaced Chinese comments with English comments to fix [issue #6](https://github.com/caijun/geoChina/issues/6).


# CHANGES IN geoChina VERSION 1.3.0

## NEW FEATURES

- invoked Google Maps Geocoding API by https instead of http when (rev)geocoding outside China.

## DOCUMENTATION CHANGES

- updated examples of `geocode()`, `revgeocode()`, test cases, and documents.


# CHANGES IN geoChina VERSION 1.2.9

## DOCUMENTATION CHANGES

- updated DECRIPRION and README.md file.


# CHANGES IN geoChina VERSION 1.2.8

## NEW FEATURES

- added CITATION file.
- updated DESCRIPTION and NEWS file
- removed README.Rmd file

## BUG FIXES

- added `importFrom(utils,URLencode)` to NAMESPACE file to avoid producing notes when checking package.


# CHANGES IN geoChina VERSION 1.2.7

## NEW FEATURES

- `geocode()` can provide lat/lng coordinates with formatted address and adress components using `output = 'latlnga'`.


# CHANGES IN geoChina VERSION 1.2.6

## NEW FEATURES

- add some tests

## BUG FIXS

- when geocoding address with space, gencode returns HTTP error 400, which is fixed by encode URL string


# CHANGES IN geoChina VERSION 1.2.5

## NEW FEATURES

- use curl supported by libcurl other than url to open URLs
- remove URLencode to show URLs human friendly


# CHANGES IN geoChina VERSION 1.2.4

## NEW FEATURES

- add time parameter to specify time interval for (rev)geocode to avoid exceeding usage limits of Google Maps API


# CHANGES IN geoChina VERSION 1.2.3

## NEW FEATURES

- `geohost` uses [freegeoip.net](https://freegeoip.net/) or [ipinfo.io](https://ipinfo.io/) rather than [hostip.info](http://www.hostip.info/) IP lookup API
- store IP country to avoid calling geohost repeatedly when (rev)geocoding muptiple addresses or locations


# CHANGES IN geoChina VERSION 1.2.2

## BUG FIXS

- `geocode` and `revgeocode` failed to call google api when user's location can't be geolocated by IP on Windows


# CHANGES IN geoChina VERSION 1.2.1

## BUG FIXS

- `geocode` and `revgeocode` failed to call google api when user's location can't be geolocated by IP


# CHANGES IN geoChina VERSION 1.2

## NEW FEATURES

- add geohost function for IP address lookup.

## DOCUMENTATION CHANGES

- minor revision.


# CHANGES IN geoChina VERSION 1.1.3

## NEW FEATURES

- automaticaly specify different google maps api urls according to user's location geolocated by IP. For users inside China, ditu.google.cn api is used; otherwise, maps.google.com api is used.

## BUG FIXS

- `geocode` and `revgeocode` failed with Error "unable to connect to 'maps.googleapis.com' on port 80"


# CHANGES IN geoChina VERSION 1.1.2

## MINOR CHANGES

- optimized `geocode`/`revgeocode` and friendly usage.

## BUG FIXS

- `geocode` address out of China with no results returned by calling google map api

## DOCUMENTATION CHANGES

- more detail on ics and ocs parameters.


# CHANGES IN geoChina VERSION 1.1.1

## BUG FIXES

- `revgeocode` failed with Error "could not find function "NULLtoNA"" by calling baidu map api
- minor spelling error in DESCRIPTION


# CHANGES IN geoChina VERSION 1.1

## NEW FEATURES

- all functions support vectorize operation.

## BUG FIXES

- `geocode` Chinese address failed with status INVALID_REQUEST by calling google map api on Windows platform.
- `geocode` with turning messaging on failed with Error "invalid multibyte string 1" by calling google map api on Windows platform.

## DOCUMENTATION CHANGES

- added examples to illustrate vectorize operation feature.


# CHANGES IN geoChina VERSION 1.0

## NEW FEATURES

- first version of geoChina

## NOTE

- in this NEWS file, #n means the issue number on GitHub, e.g. #1 is https://github.com/caijun/geoChina/issues/1
