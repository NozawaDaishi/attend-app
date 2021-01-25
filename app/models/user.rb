class User < ApplicationRecord
    has_secure_password
    has_many :attends
    
    validates :uid, presence: true, uniqueness: true
    validates :klass, presence: true
    validates :last_name, presence: true, length: { maximum: 20 }
    validates :first_name, presence: true, length: { maximum: 20 }
    validates :password, presence: true, length: { minimum: 6 }


    # 検索
    class << self
        def search(query)
          rel = order("uid")
          if query.present?
            rel = rel.where("CONCAT(last_name,first_name) LIKE ? OR last_name LIKE ? OR first_name LIKE ?",
                            "%#{query}%","%#{query}%", "%#{query}%")
          end
        end
    end

    def teacher?
      self.role == 2
    end

    # 渡された文字列のハッシュ値を返す
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
