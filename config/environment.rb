# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:base] = "%Y-%m-%d %H:%M"
Time::DATE_FORMATS[:date] = "%Y-%m-%d"
Time::DATE_FORMATS[:datetime] = "%Y-%m-%d %H:%M:%S"

ActsAsTaggableOn.delimiter = ' '