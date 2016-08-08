require 'spec_helper'

describe Restfulness::Requests::Authorization do

  let :app do
    Class.new(Restfulness::Application) do
      routes do
        # empty
      end
    end
  end
  let :request do
    Restfulness::Request.new(app)
  end

  describe "#authorization" do
    it "should be nil if no authorization header resent" do
      auth = request.authorization
      expect(auth).to be_nil
    end

    it "should be nil if authorization header is blank" do
      request.headers[:authorization] = ""
      auth = request.authorization
      expect(auth).to be_nil
    end
 
    it "should build new authorization header when present" do
      request.headers[:authorization] = "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=="
      auth = request.authorization
      expect(auth).to be_a(Restfulness::Requests::AuthorizationHeader)
      expect(auth.schema).to eql("Basic")
    end
  end
end
