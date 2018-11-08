# Accept Suite Integration with Ruby on Rails WEB API

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

## Prerequisite:
*	Sublime Text or any editor of your choice.
*	Heroku account (New account can be created using the link https://signup.heroku.com/)

## Very detailed explanation of each product type.
Authorized.Net Accept suite has below products.
*	Accept JS
*	Accept UI
*	Accept Hosted
*	Accept Customer

Detailed explanation of each product are available in the below links.
https://developer.authorize.net/api/reference/features/accept.html
https://developer.authorize.net/api/reference/features/acceptjs.html
https://developer.authorize.net/api/reference/features/accept_hosted.html
https://developer.authorize.net/api/reference/features/customer_profiles.html#Using_the_Accept_Customer_Hosted_Form

## Integration
Constants.js file consists of required URLs that are used for WEB API calls and constant parameters that are used throughout the application.

URL format when deployed in Heroku
https://<applicationname>.herokuapp.com/index_all.html

Below are the sample URLs of web api methods

* AcceptJSRequestUrl : URL to invoke Accept JS web service on payment.
![Image of AcceptJSRequestUrl](Github-Images/AcceptJSRequestUrl.PNG)
* AcceptHostedRequestUrl : URL to get the token value for Accept Hosted.
![Image of HostedRequestUrl](Github-Images/HostedRequestUrl.PNG)
* AcceptCustomerRequestUrl : URL to get the token value for Accept Customer.
![Image of CustomerRequestUrl](Github-Images/CustomerRequestUrl.PNG)
* ValidateCustomerRequestUrl : URL to invoke a web api method to validated customer ID.
![Image of ValidateCustomerUrl](Github-Images/ValidateCustomerUrl.PNG)
 

The following are the parameters with values that remains constant throughout the application. These parameters are used in script through Ajax calls for performing payments.

* ClientKey 
* ApiLoginID
* ApiTransactionKey

### Steps to deploy the application in Heroku

*	Open the command prompt

*	Run the command "heroku login"  and provide the login credentials for heroku.

*	Go inside the application root folder path where index_all.html file exists and run the command "git init" (before running the command, delete the git folder in the root path if exists)

*	Run the command "heroku create <applicationName>". Eg:- heroku create accepsuitui

* 	Check the remote URL using the command “git remote -v”. it should be the created app git URL.
       Eg:- heroku  https://git.heroku.com/accepsuitui.git (fetch)
            heroku  https://git.heroku.com/accepsuitui.git (push)

*   Run “git status” command, it will provide the details of file not pushed to heroku git.

*   Run the command “git add .” to add the untracked file to heroku git.

*   Run "git commit –am <Comments>" command to commit the changes to heroku git.

*	Finally, run the command “git push heroku master” which will do the deployment. Deployed URL will be displayed on successful deployment.

## browse the website

Sample URL: https://accepsuitui.herokuapp.com/index_all.html

![Image of dashboard](Github-Images/dashboard.PNG)