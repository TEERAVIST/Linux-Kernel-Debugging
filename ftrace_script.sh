#!/bin/bash

# Function to read user input with a prompt
prompt_user() {
  read -p "$1" response
  echo "$response"
}

# Check if the script is run with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "Please run this script as root."
  exit 1
fi

# Path to tracer and filter files
tracer_file="/sys/kernel/tracing/current_tracer"
filter_file="/sys/kernel/tracing/set_ftrace_filter"
available_functions_file="/sys/kernel/tracing/available_filter_functions"

# Get the list of available tracers
available_tracers=$(cat /sys/kernel/tracing/available_tracers)

# Prompt user to choose a tracer
echo "Available tracers: $available_tracers"
chosen_tracer=$(prompt_user "Enter the name of the tracer you want to use: ")
echo "$chosen_tracer" > "$tracer_file"

# Display available filter functions
echo "Available filter functions:"
cat "$available_functions_file"

# Prompt user to set a filter keyword
read -p "Do you want to set a filter? [Y/N]: " set_filter
if [[ "$set_filter" == "Y" || "$set_filter" == "y" ]]; then
  keyword=$(prompt_user "Enter the keyword for set_ftrace_filter: ")
  echo "$keyword" > "$filter_file"
fi

# Display the trace
cat /sys/kernel/tracing/trace

