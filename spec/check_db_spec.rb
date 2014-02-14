require 'spec_helper'

describe Post do
  it 'should be created then retrieved from the db' do
    expect(Post.count).to eq(0)
    Post.create(:body =>"What's up peeps? Another fine test we've gotten ourselves into!")
    # expect(Peep.count).to eq(1)
    message = Post.first
    puts message
    expect(message.body).to eq("What's up peeps? Another fine test we've gotten ourselves into!")
    message.destroy
    expect(Post.count).to eq(0) 
  end

end