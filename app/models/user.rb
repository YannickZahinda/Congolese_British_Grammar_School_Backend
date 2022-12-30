class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_many :parents
  has_many :students
  has_many :teachers
  has_many :events
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
   super
  end

  ROLES = %i[admin author]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = ( roles & ROLES ).map{|r| 2 **ROLES.index(r) }.inject(0, :+)
  end

  def roles 
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role(role)
    roles.include?(role)
  end
end
