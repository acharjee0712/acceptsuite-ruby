# The SDK initialization enters here. Loads all needed libraries and files. Inspects
# the current runtime to see if Rails is present. If it is, we inject our helper into
# ActiveSupport.

# coverall
# require 'coveralls'
# Coveralls.wear!



# TODO: Add local data validation where possible

$LOAD_PATH.unshift File.dirname(__FILE__)

require "PaymentTransactions/create-an-accept-payment-transaction.rb"

require "PaymentTransactions/get-an-accept-payment-page.rb"

require "CustomerProfiles/get-customer-profile.rb"

require "CustomerProfiles/get-accept-customer-profile-page.rb"
