# require 'rails_helper'

# RSpec.describe 'Users',type: :request do 
#   describe 'GET/index' do 
#     before do 
#       FactoryBot.create_list(:user, 1)
# 			get 'http://localhost:4001/api/v1/user'
# 		end
		
# 		it 'return all users' do 
# 			expect(json.size).to eq(1)
# 		end

# 		it 'returns status code 200' do 
# 			expect(response).to have_http_status(:success)
# 		end 		
# 	end 


#   # describe 'POST/create'do 
# 	# 	context 'with valid parameters' do 
# 	# 		let!(:my_user) {FactoryBot.create(:user)}
			
# 	# 		before do  
# 	# 			post 'api/v1/users', params:{ 
# 	# 				                          user: {
# 	# 																		email: 'test1@gamil.com',
# 	# 																		password: '123456',
# 	# 																		name: 'test1',
# 	# 																		role: 0
# 	# 																	}
# 	# 			                            }
# 	# 	  end 
		
#   #     it 'returns my_user' do 
#   #       expect()
#   #     end 
#   #   end 
#   # end 
# end 