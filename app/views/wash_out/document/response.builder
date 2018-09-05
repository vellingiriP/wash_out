xml.tag! "SOAP-ENV:Envelope", "xmlns:SOAP-ENV" => 'http://schemas.xmlsoap.org/soap/envelope/' do
  if !header.nil?
    xml.tag! "SOAP-ENV:Header" do
      xml.tag! "ns2:#{@action_spec[:response_tag]}" do
        wsdl_data xml, header
      end
    end
  end
  xml.tag! "SOAP-ENV:Body" do
    xml.tag! "ns2:#{@action_spec[:response_tag]}" do
      wsdl_data xml, result
    end
  end
end
