# ENFORCED_ENVIRONMENT_VARIABLES = [
#   'AWS_ID',
#   'AWS_KEY',
#   'AWS_REGION',
#   'AWS_UPLOADS_BUCKET_NAME',
#   'DATABASE_TYPE',
#   'DATABASE_HOST',
#   'DATABASE_PORT',
#   'DATABASE_USERNAME',
#   'DATABASE_PASSWORD',
#   'DEVELOPMENT_DATABASE_NAME',
#   'TEST_DATABASE_NAME',
#   'PRODUCTION_DATABASE_NAME'
# ]
#
# if Rails.env == 'production'
#   [
#     'SECRET_KEY_BASE'
#   ].each do |environment_variable|
#     ENFORCED_ENVIRONMENT_VARIABLES << environment_variable
#   end
# end
#
# missing_environment_variables = ENFORCED_ENVIRONMENT_VARIABLES.select do |environment_variable|
#   !(ENV[environment_variable])
# end
#
# if missing_environment_variables.length > 0
#   # raise StandardError.new("Missing enforced environment variables: #{missing_environment_variables.join(', ')}.")
# end
