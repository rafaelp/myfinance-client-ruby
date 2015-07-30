shared_examples 'available http request methods' do
  it "instantiates a new Request object" do
    VCR.use_cassette("client/#{http_method}/request") do
      expect(Myfinance::Request).to receive(:new).and_call_original
      subject.send(http_method, url, body: params)
    end
  end

  it 'runs the request' do
    VCR.use_cassette("client/#{http_method}/request") do
      expect_any_instance_of(Myfinance::Request).to receive(:run).and_call_original
      subject.send(http_method, url, body: params)
    end
  end

  it 'instantiates a new Response object' do
    VCR.use_cassette("client/#{http_method}/request") do
      expect(Myfinance::Response).to receive(:new).and_call_original
      subject.send(http_method, url, body: params)
    end
  end

  it 'resolves the response of the request a new Response object' do
    VCR.use_cassette("client/#{http_method}/request") do
      expect_any_instance_of(Myfinance::Response).to receive(:resolve!).and_call_original
      subject.send(http_method, url, body: params)
    end
  end
end
