class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  ROLES = %w{ super_admin admin manager author editor}

  def jwt_payload
   super
  end

  # assign role using meta programming

  ROLES.each do |role_name|
    define_method "#{role_name}?" do 
      role == role_name
    end
  end

end
