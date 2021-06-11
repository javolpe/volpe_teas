require 'rails_helper'

RSpec.describe 'Update customer subscription status', type: :request do 
  describe 'happy path' do 
    before :each do 
      test_seed_db
      @custsub3 = CustomerSubscription.create!(customer_id: @andrew.id, subscription_id: @relaxing_teas.id, status: 1)
    end
    it 'can find all customer_subscription resources for a given customer' do 
      expect(@andrew.customer_subscriptions.count).to eq(2)
      expect(@andrew.customer_subscriptions.first.status).to eq("active")
      expect(@andrew.customer_subscriptions.last.status).to eq("cancelled")
      
      get api_v1_customer_customer_subscriptions_path(@andrew)
      
      body = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      
      check_hash_structure(body, :data, Array)
      expect(body[:data].first).to be_a(Hash)
      check_hash_structure(body[:data].first, :id, String)
      check_hash_structure(body[:data].first, :type, String)
      expect(body[:data].first[:type]).to eq("customer_subscription")
      check_hash_structure(body[:data].first, :attributes, Hash)
      expect(body[:data].first[:attributes].keys.count).to eq(7)
      expect(body[:data].count).to eq(2)
      expect(body[:data].first[:attributes][:status]).to eq("active")
      expect(body[:data].second[:attributes][:status]).to eq("cancelled")
    end
    it 'retunrs no customer_subscription resources if a customer has none' do 
      expect(@andrew.customer_subscriptions.count).to eq(2)
      expect(@andrew.customer_subscriptions.first.status).to eq("active")
      expect(@andrew.customer_subscriptions.last.status).to eq("cancelled")
      
      get api_v1_customer_customer_subscriptions_path(@khoa)
      
      body = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      
      expect(body[:message]).to eq("no customer subscriptions")
    end
  end
end