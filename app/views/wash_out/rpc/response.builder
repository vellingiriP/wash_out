xml.instruct!
xml.tag! "SOAP-ENV:Envelope", "xmlns:soap" => 'http://schemas.xmlsoap.org/soap/envelope/',
                          "xmlns:xsd" => 'http://www.w3.org/2001/XMLSchema',
                          "xmlns:xsi" => 'http://www.w3.org/2001/XMLSchema-instance',
                          "xmlns:ns2" => @namespace do
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
