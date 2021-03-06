require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/shortens", type: :request do

  it "ensure create a valid shortcode" do
    headers = { "ACCEPT" => "application/json" }
    post "/shorten", params: {shorten: { url: "http://pintaria.com", shortcode: "1aB_" } }, :headers => headers 
    
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:created)

  end
  it "ensure create invalid shortcode" do
    headers = { "ACCEPT" => "application/json" }
    post "/shorten", params: {shorten: { url: "http://pintaria.com", shortcode: "1aB" } }, :headers => headers 
    
    expect(response.status).to eq(422)

    json = JSON.parse(response.body).deep_symbolize_keys
    expect(json[:data][:message]).to eq("the shortcode fails to meet the requirements")
    expect(Url.count).to eq(0)
  end
  it "ensure generate random shortcode when empty shortcode given "
  it "reject duplicate shortcode"
  it "return 404 unknown shortcode"

end
