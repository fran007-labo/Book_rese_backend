#!/bin/bash

sudo service nginx start
cd /app
RAILS_ENV=production bin/rails db:migrate
bundle exec pumactl start