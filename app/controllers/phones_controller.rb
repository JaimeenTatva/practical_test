class PhonesController < ApplicationController
    def index
        begin
            @phones = AllotedPhoneNumber.all
            render json: @phones, status: 200
        rescue => exception
            render json: { success: false, errors: exception.message }, status: 400
        end
    end

    def create
        begin
            random_phone_number = rand(1111111111..9999999999)
            existing_number = AllotedPhoneNumber.where(alloted_number: random_phone_number)
        end while existing_number.present?

        alloted_number = AllotedPhoneNumber.create({alloted_number: random_phone_number})
        render json: alloted_number, status: 200
    end

    def specific_number
        phone_number = params[:phone]
        if phone_number.present?
            existing_number = AllotedPhoneNumber.where(alloted_number: phone_number)

            if existing_number.present?
                begin
                    random_phone_number = rand(1111111111..9999999999)
                    existing_number = AllotedPhoneNumber.where(alloted_number: random_phone_number)
                end while existing_number.present?

                alloted_number = AllotedPhoneNumber.create({alloted_number: random_phone_number})
                render json: { success: true, message: "The number you requested is already allocated. The following random number is allocated to you.", data: {alloted_number} }, status: 200
            else
                alloted_number = AllotedPhoneNumber.create({alloted_number: phone_number})
                render json: alloted_number, status: 200
            end
        else
            render json: { success: false, errors: "Please provide a number." }, status: 400
        end
    end
end
