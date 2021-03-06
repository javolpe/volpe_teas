require 'rails_helper'

RSpec.describe 'Update customer subscription status', type: :request do 
  describe 'happy path' do 
    before :each do 
      test_seed_db
    end
    it 'can create a new customer_subscription resource' do 
      expect(@andrew.subscriptions.count).to eq(1)
      expect(@andrew.customer_subscriptions.first.status).to eq("active")
      params = {status: "cancelled"}
      patch api_v1_customer_customer_subscription_path(@andrew, @custsub1), params: params
      
      body = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      
      check_hash_structure(body, :data, Hash)
      check_hash_structure(body[:data], :id, String)
      check_hash_structure(body[:data], :type, String)
      check_hash_structure(body[:data], :attributes, Hash)
      expect(body[:data][:attributes].keys.count).to eq(7)
      expect(@andrew.subscriptions.count).to eq(1)
      expect(@andrew.customer_subscriptions.first.status).to eq("cancelled")

      params = {status: "active"}
      patch api_v1_customer_customer_subscription_path(@andrew, @custsub1), params: params
      
      body = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      
      check_hash_structure(body, :data, Hash)
      check_hash_structure(body[:data], :id, String)
      check_hash_structure(body[:data], :type, String)
      check_hash_structure(body[:data], :attributes, Hash)
      expect(body[:data][:attributes].keys.count).to eq(7)
      expect(@andrew.subscriptions.count).to eq(1)
      expect(@andrew.customer_subscriptions.first.status).to eq("active")
    end
  end
end