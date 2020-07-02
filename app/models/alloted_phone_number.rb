class AllotedPhoneNumber < ApplicationRecord
    validates :alloted_number, presence: true
    validates_format_of :alloted_number, :with =>  /\d{10}/ , :message => "Phone number must contian only 10 digits."

    validate :check_number_range

    def check_number_range
        if alloted_number.to_i < 1111111111 || alloted_number.to_i > 9999999999
            errors.add(:alloted_number, "should be in the range from 111-111-1111 to 999-999-9999")
        end
    end

    def self.get_random_phone_number
        begin
            random_phone_number = rand(1111111111..9999999999)
            existing_number = self.where(alloted_number: random_phone_number)
        end while existing_number.present?
        
        random_phone_number
    end
end
