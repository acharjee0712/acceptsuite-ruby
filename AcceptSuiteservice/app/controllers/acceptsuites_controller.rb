require 'authorizenetsample'

# require '../../../../sample-code-ruby-master/sample-code-ruby-master/lib\PaymentTransactions/create-an-accept-payment-transaction.rb'


class AcceptsuitesController < ApplicationController

	# GET /acceptsuite/acceptJs
	def acceptJs
		response = create_an_accept_payment_transaction(params[:apiLoginId],params[:apiTransactionKey],params[:token])

		if response != nil
	      	if response.messages.resultCode == MessageTypeEnum::Ok
		        if response.transactionResponse != nil && response.transactionResponse.messages != nil
				  render json: {status: true,message:response.transactionResponse.responseCode,successValue:response.transactionResponse.transId},status: :ok
		        else
		          if response.transactionResponse.errors != nil
					render json: {status: false,message:response.transactionResponse.errors.errors[0].errorText,errorMessage:response.transactionResponse.errors.errors[0].errorText},status: :ok
		          end
		        end
	      else
	        if response.transactionResponse != nil && response.transactionResponse.errors != nil
			  render json: {status: false,message:response.transactionResponse.errors.errors[0].errorText,errorMessage:response.transactionResponse.errors.errors[0].errorText},status: :ok
	        else
			  render json: {status: false,message:response.messages.messages[0].text,errorMessage:response.messages.messages[0].text},status: :ok
	        end
	      end
	    else
		  render json: {status: false,errorMessage:"Response is null"},status: :ok
	    end
	end

	#GET /acceptsuite/acceptHosted
	def acceptHosted

		if params[:customerId] == ""
			customerId = nil
		else
			customerId = params[:customerId]
		end
				
		response = get_an_accept_payment_page(params[:apiLoginId],params[:apiTransactionKey],customerId,params[:iFrameCommunicatorUrl])
		
		if response.messages.resultCode == MessageTypeEnum::Ok
	      
	      render json: {status: true,message: response.messages.messages[0].text,successValue:response.token},status: :ok
	    else
	      render json: {status: false,message: response.messages.messages[0].text,errorMessage:response.messages.messages[0].text},status: :ok
	    end
	end

	#GET /acceptsuite/acceptcustomer
	def acceptCustomer
		response = get_accept_customer_profile_page(params[:apiLoginId],params[:apiTransactionKey],params[:iFrameCommunicatorUrl],params[:customerId])
		
		if response.messages.resultCode == MessageTypeEnum::Ok
	      render json: {status: true,message: response.messages.messages[0].text,successValue:response.token},status: :ok
	    else
	      render json: {status: false,errorMessage: response.messages.messages[0].text},status: :ok
	    end
	end

	#GET /acceptsuite/validateCustomer
	def validateCustomer
		response = get_customer_profile(params[:apiLoginId],params[:apiTransactionKey],params[:customerId])
		if response.messages.resultCode == MessageTypeEnum::Ok
			render json: {status: true,successValue: response.messages.messages[0].text},status: :ok
		elsif 
			render json: {status: false,errorMessage: response.messages.messages[0].text},status: :ok
		end
	end
end
