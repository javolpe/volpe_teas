require 'rails_helper'

RSpec.describe 'New customer subscription', type: :request do 
  describe 'happy path' do 
    before :each do 
      test_seed_db
    end
    it 'can create a new customer_subscription resource' do 
      expect(@andrew.subscriptions.first.status).to eq("active")
      expect(@andrew.subscriptions.count).to eq(1)
      headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
      body = {subscription_id: @relaxing_teas.id}
      
      post api_v1_customer_customer_subscriptions_path(@andrew.id), headers: headers, params: body.to_json
      
      body = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      
      check_hash_structure(body, :data, Hash)
      check_hash_structure(body[:data], :id, String)
      check_hash_structure(body[:data], :type, String)
      check_hash_structure(body[:data], :attributes, Hash)
      expect(body[:data][:attributes].keys.count).to eq(6)
      expect(@andrew.subscriptions.count).to eq(2)
      expect(@andrew.customer_subscriptions.last.status).to eq("active")
    end
  end
end