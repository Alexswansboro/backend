class User < ApplicationRecord

    has_secure_password
    has_secure_token :api_token
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 5}
    validates :name, presence: true


    has_many :shifts, through: :usershifts

    has_many :roles
    has_one :invitation

    has_many :calendars, through: :roles do
        def owned
            where("roles.role = 'owner'", true)
        end
        def managed
            where("roles.role = 'manager'", true)
        end
        def employed
            where("roles.role = 'employee'", true)
        end
    end
    has_many :notes

    has_many :requested_swaps, class_name: "Swap", foreign_key: :requesting_user
    has_many :accepted_swaps, class_name: "Swap", foreign_key: :accepting_user

end
