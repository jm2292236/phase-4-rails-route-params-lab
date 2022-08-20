class Student < ApplicationRecord

    def to_s
        "#{first_name} #{last_name}"
    end

    scope :return_a_hash, -> {{key: "value"}}
    
    scope :scope_by_name, ->(name) {where("first_name LIKE ? OR last_name LIKE ?", "%#{name}%", "%#{name}%")}

    def self.search_name(name)
        # lets search on first_name or last_name any part
        # of the name, not only a complete name
        # because we are using % with LIKE
        Student.where("first_name LIKE ? OR last_name LIKE ?", "%#{name}%", "%#{name}%")
    end

end
