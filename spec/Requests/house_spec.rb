# require 'rails_helper' 

# RSpec::describe 'House', type: :request do 
#     describe 'GET/index' do 
#         before do 
#             FactoryBot.create_list(:house, 5)
#             get 'api/v1/houses'
#         end 

#         it 'return all the houses' do 
#             expect(jason.size).to eq(5)
#         end 

#         it 'return status code 200' do 
#             expect(response).to have_http_status(:success)
#         end 
#     end 
    
#     describe 'POST/create' do 
#         context 'with valid parameters' do 
#             let!(:my_house) {FactoryBot.create(:house)}

#             before  do 
#                 post 'api/v1/house', params:{
#                                         house: {
#                                             name:  'BHK full furnished',
#                                             location: 'Indore',
#                                             available_for: 0,
#                                             price_for: 0,
#                                             status: 0,
#                                             amount: '66900'
#                                         } 
#                                     }
#             end 
            
#             it 'return the my_house' do 
#                 expect(json.size).to eq(my_house)
#             end 

#             it 'return a created status' do 
#                 expect(response).to have_http_status(:created)
#             end 
#         end 
#         context 'with invalid parameters' do 
#             before do 
#                 post 'api/v1/house', params: { 
#                                         house: {
#                                             name: '',
#                                             location: '',
#                                             available_for: '',
#                                             price_for: '',
#                                             status: '',
#                                             amount: ''
#                                         } 
#                                     }
#             end 
#             it 'return the unprocessable entity status' do 
#                 expect(response).to have_http_status(:unprocessable_entity)
#             end 
#         end 
#     end 

#     # describe 'DELETE/destroy' do 

#     #     let!(:house) {FactoryBot.create(:post)}

#     #     before do 
#     #         delete 'api/v1/house/#{house.id}'
#     #     end 

#     #     it 'return status code 204'
#     #     expect(have_http_status).to have_http_status(204)

#     # end 
# end 