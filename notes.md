# Notes

### Development
1 - heroku pg:reset --app magensinus-cloud-dev --confirm magensinus-cloud-dev
2 - heroku run rails db:migrate --app magensinus-cloud-dev
3 - heroku run rails db:seed --app magensinus-cloud-dev
4 - heroku repo:purge_cache --app magensinus-cloud-dev

### Staging
1 - heroku pg:reset --app magensinus-cloud-sta --confirm magensinus-cloud-sta
2 - heroku run rails db:migrate --app magensinus-cloud-sta
3 - heroku run rails db:seed --app magensinus-cloud-sta
4 - heroku repo:purge_cache --app magensinus-cloud-sta

### Production
1 - heroku run rails db:migrate --app magensinus-cloud-pro
2 - heroku run rails db:seed --app magensinus-cloud-pro
3 - heroku repo:purge_cache --app magensinus-cloud-pro
