require 'rubygems'
require 'yaml'
require 'authorizenet'
require 'securerandom'
require 'certified'


  include AuthorizeNet::API
 
 
  def get_aujob_Details()
   config = YAML.load_file(File.dirname(__FILE__) + "/credentials.yml")
   transaction = AuthorizeNet::API::Transaction.new(config['api_login_id'], config['api_transaction_key'], :gateway => :sandbox)
     #@month = '2006-11'
     modifiedTypeFilter = "all"
     refId='123456'
     paging = Paging.new
     paging.limit = 100
     paging.offset = 1
     # Build the request object
     request= GetAUJobDetailsRequest.new
     #request = AuthorizeNet::API::GetAUJobDetailsRequest.new
     request.paging = paging
     request.month="2018-08"
     request.modifiedTypeFilter=modifiedTypeFilter
     request.refId=refId
     response = transaction.get_aujob_details(request)
     puts "result: #{response.message}"
     puts response.messages.resultCode
     #puts response.totalNumInResultSet
     if response != nil
      if response.messages.resultCode == MessageTypeEnum::Ok
        if response.auDetails == nil
          return response;
        else
          puts response.auDetails
          puts "Refrence id is :#{response.refId}"
          puts" message is : "
          puts response.messages.messages[0].code        
          puts response.messages.messages[0].text
          puts "  Total number in result set: #{response.totalNumInResultSet}"
          update= response.auDetails[0].auUpdate
         
            puts "Customer profile id : #{update.customerProfileID}"
            puts "Customer Payment Profile ID:#{update.customerPaymentProfileID}"
            puts "Update Time (UTC): #{update.updateTimeUTC}"
            puts "Reason Code:#{update.auReasonCode}"
            puts "Reason Description:#{update.reasonDescription}"
            puts"SubscriptionId list:#{update.subscriptionIdList}"
            puts"New card details"
            puts "Card Number:#{update.newCreditCard.cardNumber}"
            puts "New Expiration Date:#{update.newCreditCard.expirationDate}"
            puts "New Card Type: #{update.newCreditCard.cardType}"
            puts"Old card details"
            puts "Card Number:#{update.oldCreditCard.cardNumber}"
            puts "New Expiration Date:#{update.oldCreditCard.expirationDate}"
            puts "New Card Type: #{update.oldCreditCard.cardType}"
          
          delete=  response.auDetails[0].auDelete
            puts "Customer profile id : #{delete.customerProfileID}"
           puts "Customer Payment Profile ID:#{delete.customerPaymentProfileID}"
           puts "Update Time (UTC): #{delete.updateTimeUTC}"
           puts "Reason Code:#{delete.auReasonCode}"
           puts "Reason Description:#{delete.reasonDescription}"
           puts"SubscriptionId list:#{delete.subscriptionIdList}"
           puts"credit card details"
           puts "Card Number:#{delete.creditCard.cardNumber}"
           puts "New Expiration Date:#{delete.creditCard.expirationDate}"
           puts "New Card Type: #{delete.creditCard.cardType}"

         

        
        end
        
      else
        puts response.messages.messages[0].code        
        puts response.messages.messages[0].text
        raise "Failed to create a new customer profile."
      end
    else
      puts "Response is null"
      raise "Failed to create a new customer profile."
    end

    return response
  end

  if __FILE__ == $0
    get_aujob_Details()
  end