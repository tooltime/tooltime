# CPE-366: Team ToolTime

Team: Marcus Ortiz, Jason Stewart, Ben Voogd, Alan Yang

## initial setup

clone the repo:

    git clone git@github.com:tooltime/tooltime.git
    cd tooltime

install the dependencies:

    bundle install
    
## local development

start delayed_job

    rake jobs:work

start the server

    rails server thin
