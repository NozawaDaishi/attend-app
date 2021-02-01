class User < ApplicationRecord
    has_secure_password
    has_many :attends, dependent: :destroy

    scope :students, -> (klass) { where(klass: klass).where(role: 1) }
    scope :klass_list, -> { select('klass').to_a.map { |k| k.klass }.uniq }
    
    with_options on: :create_valid do
      validates :uid, presence: true, uniqueness: true
      validates :klass, presence: true
      validates :last_name, presence: true, length: { maximum: 20 }
      validates :first_name, presence: true, length: { maximum: 20 }
      validates :password, presence: true, length: { minimum: 6 }
      validates :password, confirmation: true
    end

    with_options on: :edit_valid do
      validates :uid, presence: true, uniqueness: true
      validates :klass, presence: true
      validates :last_name, presence: true, length: { maximum: 20 }
      validates :first_name, presence: true, length: { maximum: 20 }
    end

    with_options on: :password_edit_valid do
      validates :password, presence: true, length: { minimum: 6 }
      validates :password, confirmation: true
    end
    
    attr_accessor :current_password
    validates :password, presence: { if: :current_password } 

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
