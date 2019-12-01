class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    # Userは複数のTaskを持つ
    has_many :tasks
end
