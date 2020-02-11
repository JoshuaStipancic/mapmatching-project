# Introduction to Topological Map Matching

## Algorithm Description

This section presents a topological decision rule-based methodology that detects and solves spatial mismatches as GPS measurements are collected.
There is few available services which use TMMin mapmatching and "TrackingMatching" is one of them. In the refrence paper you can find the details of the algorithm used in this TMM.
TrackMatching performs the map-matching of location data (e.g. GPS/GPX tracks). The service is primarily intended for car data for now. The service is provided as a SaaS (“Software as a Service”) running on Amazon cloud platform.

You can find "TrackingMatching" in https://mapmatching.3scale.net

## Publications


# Run the Topological Map Matching Algorithm
TrackMatching uses a REST API accessible from scripts. The popular command-line tool "CURL" is used for running. A Node.js sample invocation is also provided below. To process a GPX file, we sould run the following command:

curl -X POST -H 'Content-Type: application/gpx+xml' -H 'Accept: application/json' --data-binary @gpslog.gpx "http://test.roadmatching.com/rest/mapmatch/?app_id=YOUR_APPID&app_key=YOUR_APPKEY" -o output.json

# Licensing


