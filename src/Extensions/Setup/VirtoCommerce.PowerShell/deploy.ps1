$Error.Clear()

# change properties below
$subscriptionName = 'Didix development' # Enter your azure subscription name
$publishsettingsfile = "C:\Work\Backup\Azure\Didix development credentials.publishsettings" # specify full path to publish settings file, must have PublishSettings extension
$service_prefix = 'kadobon-dev' # specify unique prefix which most likely should consist of "companyname" plus "virtocommerce", so for example "applevirtocommerce", must be between 3 and 24 characters and be unique
$db_servername = 'nitpvpk141' # enter sql azure server name, that you created, FOR EXAMPLE: "k23asdkasd"
$db_serverlogin = 'kadobon-sa'  # enter sql azure username
$db_serverpassword = 'kdb2015#@!' # enter sql azure password
$db_databasename = 'kadobon.ecommerce.development' # enter sql azure database name, database will be automatically created
$region = 'West Europe' # enter region, for example "West US", "East US", "West Europe", "North Europe", pick the closest region to you so it speeds up the deployment
$slot = 'Production'


# parameters below are automaticaly generated
$frontend_servicename = $service_prefix + '-web'
$search_servicename = $service_prefix + '-search'
$scheduler_servicename = $service_prefix + '-scheduler'
$storageaccount = "kadobondev"
$datafolder = Split-Path -Parent $MyInvocation.MyCommand.Path
$rootfolder = $datafolder + "\..\..\..\.."

# advanced options
$build = "True"
$deploydatabase = "False"
$deploysearch = "False"
$deployfrontend = "True" 
$deployfrontend_website = $false # deploys frontend as a website instead of cloud service, webjobs are deployed as well so no need to deploy scheduler service
$deployscheduler = "True"
$deployadmin = "False"
$db_recreate = "False" # specify if you want to recreate a database

$db_sampledata = $true # specify if you want sample data to be setup
$db_customsqldir = ".\CustomSQL" # specify custom sql folder to run sql scripts from

. "$rootfolder\src\Extensions\Setup\VirtoCommerce.PowerShell\deploy-tfs.ps1" -subscriptionname $subscriptionName -storageaccount $storageaccount -region $region -slot $slot -search_servicename $search_servicename -frontend_servicename $frontend_servicename -scheduler_servicename $scheduler_servicename -db_servername $db_servername -db_serverlogin $db_serverlogin -db_serverpassword $db_serverpassword -db_databasename $db_databasename -publishsettingsfile $publishsettingsfile –build $build -deploydatabase $deploydatabase -deploysearch $deploysearch -deployfrontend $deployfrontend -deployfrontend_website $deployfrontend_website -deployscheduler $deployscheduler -deployadmin $deployadmin -deploymentdir "$datafolder\Deployment" -solutiondir $rootfolder -db_sampledata $db_sampledata -db_recreate $db_recreate -db_customsqldir $db_customsqldir