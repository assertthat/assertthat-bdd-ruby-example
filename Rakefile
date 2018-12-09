require 'rake'
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'assertthat-bdd'

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w[ --format json -o reports/cucumber.json]
end

task :download_features do
 AssertThatBDD::Features.download(
 							  #Optional can be supplied as environment variable ASSERTTHAT_ACCESS_KEY
 							  accessKey:'ASSERTTHAT_ACCESS_KEY',
							  #Optional can be supplied as environment variable ASSERTTHAT_SECRET_KEY
							  secretKey:'ASSERTTHAT_SECRET_KEY', 
							  #Required Jira project id e.g. 10001
							  projectId: 'PROJECT_ID',
							  #Optional - default ./features
							  outputFolder: './features/',
							  #Optional proxy url to connect to Jira
							  proxy: 'PROXY_URL',
							  #Optional - default automated (can be one of: manual/automated/both)
							  mode: 'automated',
							  #Optional - all features downloaded by default - should be a valid JQL
							  jql: 'project = XX AND key in (\'XXX-1\')'
							 ) 
end

task :upload_report do
 AssertThatBDD::Report.upload(
 							  #Optional can be supplied as environment variable ASSERTTHAT_ACCESS_KEY
 							  accessKey:'ASSERTTHAT_ACCESS_KEY',
							  #Optional can be supplied as environment variable ASSERTTHAT_SECRET_KEY
							  secretKey:'ASSERTTHAT_SECRET_KEY', 
							  #Jira project id e.g. 10001
							  projectId: 'PROJECT_ID',
							  #The name of the run - default 'Test run dd MMM yyyy HH:mm:ss'
							  runName: "Dry Tests Run",
    						  #Json report folder - default ./reports
    					      jsonReportFolder: "reports",
    						  #Regex to search for cucumber reports - default .*.json
    						  jsonReportIncludePattern: ".*/cucumber.json"
							 ) 
end

task :cucumber => :download_features

task :default => :cucumber

Rake::Task["cucumber"].enhance do
  Rake::Task[:upload_report].invoke
end