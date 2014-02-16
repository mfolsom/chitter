require 'spec_helper'

describe Post do
  let(:peep) {Post.new}

  it "is DataMapper Resource" do
    expect(Post.included_modules).to include DataMapper::Resource
  end

    it 'has an id' do
    expect(peep).to respond_to :id
  end

  it 'has a body' do
    expect(peep).to respond_to :body
  end

  it 'can set a body' do
    expect(peep).to respond_to :body=
  end

  it 'has a timestamp' do
    expect(peep).to respond_to :created_at
  end
 
  # it 'has an author' do
  #   expect(peep).to respond_to :user
  # end
end