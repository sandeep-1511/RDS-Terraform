#!/bin/bash


get_current_utc_time() {
    utc_time=$(date -u +"%Y-%m-%d %H:%M:%S")
    echo "Current Time in UTC: $utc_time"
}

get_current_ist_time() {
    ist_time=$(TZ=Asia/Kolkata date +"%Y-%m-%d %H:%M:%S")
    echo "Current Time in IST: $ist_time"
}


get_future_datetime() {
    future_datetime=$(date -d "+10 days" +"%Y-%m-%d %H:%M:%S")
    echo "Date and Time 10 days from now: $future_datetime"
}


echo "Fetching times..."
get_current_utc_time
get_current_ist_time
get_future_datetime


