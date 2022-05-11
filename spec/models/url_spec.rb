require 'rails_helper'

RSpec.describe Url, type: :model do
  context "Validation presence test" do
    it "Ensure url presence" do
      url = Url.new(
        url: nil,
        shortcode: "1aBc"
      ).save

      expect(url).to eq(false)
    end

    it "Ensure shortcode presence" do
      url = Url.new(
        url: "google.com",
        shortcode: nil
      ).save

      expect(url).to eq(false)
    end
  end

  context "Validation length test" do
    it "Ensure shortcode character length more than 3" do
      url = Url.new(
        url: "google.com",
        shortcode: "1aB"
      ).save

      expect(url).to eq(false)
    end
  end

  context "Validation shortcode format" do
    it "Ensures shortocde format not valid" do
      url = Url.new(
        url: "google.com",
        shortcode: "aabc?"
      ).save

      expect(url).to eq(false)
    end

    it "Ensures shortocde format valid" do
      url = Url.new(
        url: "google.com",
        shortcode: "1aB_"
      ).save

      expect(url).to eq(true)
    end
  end

  context "Validation uniqueness shortcode" do
    before do
      Url.new(
        url: "google.com",
        shortcode: "1aBc_"
      ).save
    end

    it "Ensures shortcode has uniqueness" do
      url = Url.new(
        url: "google.com",
        shortcode: "1aBc_"
      ).save

      expect(url).to eq(false)

    end
  end
end
