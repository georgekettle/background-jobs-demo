class User < ApplicationRecord
  after_commit :async_update_user, only: [:create, :update]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    admin
  end

  private

  def async_update_user
    UpdateUserJob.perform_later(self)
  end
end
