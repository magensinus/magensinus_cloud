# Notes

### Precompile
RAILS_ENV=production bundle exec rake assets:precompile

### Development
---------------------------------------------------------------------------

1 - heroku pg:reset --app magensinus-cloud-dev --confirm magensinus-cloud-dev

1 - heroku run rails db:migrate --app magensinus-cloud-dev
2 - heroku run rails db:seed --app magensinus-cloud-dev

---------------------------------------------------------------------------

2 - heroku repo:purge_cache --app magensinus-cloud-dev

### Staging
---------------------------------------------------------------------------

1 - heroku pg:reset --app magensinus-cloud-sta --confirm magensinus-cloud-sta
2 - heroku run rails db:seed --app magensinus-cloud-sta

1 - heroku run rails db:migrate --app magensinus-cloud-sta

---------------------------------------------------------------------------

2 - heroku repo:purge_cache --app magensinus-cloud-sta

### Production
---------------------------------------------------------------------------

1 - heroku run rails db:migrate --app magensinus-cloud-pro

---------------------------------------------------------------------------

2 - heroku repo:purge_cache --app magensinus-cloud-pro
