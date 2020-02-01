class User < ApplicationRecord
  acts_as_token_authenticatable
end
