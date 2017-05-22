class AccountUser < ApplicationRecord
  belongs_to :user
  belongs_to :account

  validates_presence_of :user, :account
end