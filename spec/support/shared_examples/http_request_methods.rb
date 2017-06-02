shared_examples "available http request methods" do
  it "instantiates a new Request object" do
    VCR.use_cassette("client/#{http_method}/request") do
      expect(Myfinance::Request).to receive(:new).with(
        body: params,
        method: http_method,
        token: "b552dd5a8598ca089b91c5e355a83b86e4696aefac9eaa05",
        url: "#{Myfinance.configuration.url}#{url}",
        user_agent: "Myfinance Ruby Client v#{Myfinance::VERSION}",
        account_id: account_id
      ).and_call_original
      subject.send(http_method, url, body: params)
    end
  end

  it "runs the request" do
    VCR.use_cassette("client/#{http_method}/request") do
      expect_any_instance_of(Myfinance::Request).to receive(:run).and_call_original
      subject.send(http_method, url, body: params)
    end
  end

  it "instantiates a new Response object" do
    VCR.use_cassette("client/#{http_method}/request") do
      expect(Myfinance::Response).to receive(:new).and_call_original
      subject.send(http_method, url, body: params)
    end
  end

  it "resolves the response of the request a new Response object" do
    VCR.use_cassette("client/#{http_method}/request") do
      expect_any_instance_of(Myfinance::Response).to receive(:resolve!).and_call_original
      subject.send(http_method, url, body: params)
    end
  end
end
