class User < ApplicationRecord
    has_secure_password

    # フルネームで検索した時にヒットしない
    class << self
        def search(query)
          rel = order("uid")
          if query.present?
            rel = rel.where("CONCAT(last_name,first_name) LIKE ? OR last_name LIKE ? OR first_name LIKE ?",
                            "%#{query}%","%#{query}%", "%#{query}%")
          end
        end
    end
end
