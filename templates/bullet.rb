# frozen_string_literal: true

if defined? Bullet
  Bullet.enable = true
  Bullet.alert = true
  Bullet.rails_logger = true
  Bullet.rollbar = false
end
