# Accept Suite

Developer Guide to deploy the .Net CoreRuby on Rails Web API Application on Heroku.

## Prerequisite

* Ruby 2.2.2 or higher
* RubyGem 1.3.6 or higher (To build the gem)
* Bundle 1.6 or higher 
* Sublime Text or any editor of your choice.
* Heroku account (New account can be created using the link https://signup.heroku.com/)

## Steps to deploy the web API in Heroku

* Open the command prompt and navigate to the root folder of Web API.
* Run the command "bundle update" to generate the Gemfile.lock file which will have all the required dependencied for the project(Used while deployment).
* Run the command "heroku login"  and provide the login credentials for heroku.
* Go inside the application root folder path where index_all.html file exists and run the command "git init" (before running the command, delete the git folder in the root path if exists)
* Run the command "heroku create <applicationName>". Eg:- heroku create accepsuitwebapiruby
* Check the remote URL using the command “git remote -v”. it should be the created app's git URL.
       Eg:- heroku  https://git.heroku.com/accepsuitwebapiruby.git (fetch)
            heroku  https://git.heroku.com/accepsuitwebapiruby.git (push)
* Run “git status” command, it will provide the details of file not pushed to heroku git.
* Run the command “git add .” to add the untracked file to heroku git.
* Run "git commit –am <Comments>" command to commit the changes to heroku git.
* Finally, run the command “git push heroku master” which will do the deployment. Deployed URL will be displayed on successful deployment.

## URL format of Accept Suite WEB 

https://APPLICATIONNAME.herokuapp.com/acceptsuite/METHODNAME?REQUIREDQUERYPARAMETERS

Eg:- https://acceptsuitesruby.herokuapp.com/acceptsuite/acceptJs?apiLoginId=VALUE&apiTransactionKey=VALUE&Token=VALUE

## QueryParameter Details

1. AcceptJs and AcceptJS UI - apiLoginId, apiTransactionKey, Token
2. AcceptHosted without customer profile - apiLoginId, apiTransactionKey, iframeCommunicatorUrl
3. AcceptHosted with customer profile - apiLoginId, apiTransactionKey, customerId, iframeCommunicatorUrl
4. AcceptCustomer - apiLoginId, apiTransactionKey, iframeCommunicatorUrl, customerId
