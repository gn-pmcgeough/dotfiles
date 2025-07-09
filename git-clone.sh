#!/bin/sh

echo "Cloning repositories..."

BRS=$HOME/brs
DEV=$BRS/development
APPS=$DEV/apps
DB=$DEV/database
DOCS=$DEV/documents
JIRA=$DEV/jira
POSTMAN=$DEV/postman
SANDBOX=$DEV/sandbox
TOOLS=$DEV/tools

mkdir -p "$APPS" "$DB" "$DOCS" "$JIRA" "$POSTMAN" "$SANDBOX" "$TOOLS"

# BRS Dev
git clone git@github.com:gn-pmcgeough/database.git $DB
git clone git@github.com:gn-pmcgeough/documents.git $DOCS
git clone git@github.com:gn-pmcgeough/jira.git $JIRA
git clone git@github.com:gn-pmcgeough/postman.git $POSTMAN
git clone git@github.com:gn-pmcgeough/tools.git $TOOLS

# BRS Applications
git clone git@github.com:GolfNowEng/brs-admin-api.git $APPS/brs-admin-api
git clone git@github.com:GolfNowEng/brs-admin-app.git $APPS/brs-admin-app
git clone git@github.com:GolfNowEng/brs-competitions-module.git $APPS/brs-competitions-module
git clone git@github.com:GolfNowEng/brs-consents-api.git $APPS/brs-consents-api
git clone git@github.com:GolfNowEng/brs-directory-service-api.git $APPS/brs-directory-service-api
git clone git@github.com:GolfNowEng/brs-facilities-module-admin-frontend.git $APPS/brs-facilities-module-admin-frontend
git clone git@github.com:GolfNowEng/brs-facilities-module-api.git $APPS/brs-facilities-module-api
git clone git@github.com:GolfNowEng/brs-facilities-module-frontend.git $APPS/brs-facilities-module-frontend
git clone git@github.com:GolfNowEng/brs-members-module.git $APPS/brs-members-module
git clone git@github.com:GolfNowEng/brs-open-competitions.git $APPS/brs-open-competitions
git clone git@github.com:GolfNowEng/brs-organisation-service-api.git $APPS/brs-organisation-service-api
git clone git@github.com:GolfNowEng/brs-rules-api.git $APPS/brs-rules-api
git clone git@github.com:GolfNowEng/brs-teesheet.git $APPS/brs-teesheet
git clone git@github.com:GolfNowEng/brs-visitors-module.git $APPS/brs-visitors-module
git clone git@github.com:gn-pmcgeough/laravel-queue-rabbitmq.git $APPS/laravel-queue-rabbitmq
git clone git@github.com:GolfNowEng/memberships-api.git $APPS/memberships-api
git clone git@github.com:GolfNowEng/memberships-frontend.git $APPS/memberships-frontend
git clone git@github.com:GolfNowEng/person-data-aggregation-tool.git $APPS/person-data-aggregation-tool
git clone git@github.com:GolfNowEng/sync-report.git $APPS/sync-report
git clone git@github.com:GolfNowEng/teesheet-api-client.git $APPS/teesheet-api-client
git clone git@github.com:GolfNowEng/wallet-service.git $APPS/wallet-service
