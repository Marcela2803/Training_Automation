# frozen_string_literal: true

After do
  sleep 1
  $driver.manage.delete_all_cookies
  $driver.local_storage.clear
end
