module ContractsHelper
    require 'docusign_api'
    require 'curl'
    require 'json'
    require 'base64'
    
    #new instance of docusign API
  @api = DocusignApi.new \
  username: 'alizee.albrecht17@gmail.com', \
  password: '58317Alizee', \
  integrator_key: 'e5fdb0cd-a206-4934-91f1-5d80834a4989', \
  login_url: 'https://demo.docusign.net/restapi/v2/login_information'
  
  #Create enveloppe from template'
    def self.create_enveloppe
      
        template_id = '16ddd44d-ebef-4dba-9245-388a8de6686d'
        h = {
    emailSubject: 'Listing Signature',
    status: 'created',
    templateRoles: [],
    compositeTemplates: [{
      serverTemplates: [
        {
          sequence: '1',
          templateId: template_id
        }
      ],
      document: {
        name: 'Listing Agreement',
        documentId: '01',
        #documentBase64: Base64.encode64(File.read('Agreement')),
        documentFields: [
          { name: 'SellerName', value: PodioHelper.get_field(name,"client") },
          #{ name: 'field2', value: 'value2' }
        ]
      }
    }]
  }
  
  c = @api.post '/envelopes', h.to_json

  puts c.response_code
  puts JSON::parse(c.body)
    end
    
    def change_recipients 
         h = {
    signers: { roleName: 'Agent', email: 'alizee.albrecht17@gmail.com', name: 'Agent Name', recipientId: '1' }
    }
    c = @api.put '/envelopes/123/recipients', h.to_json

    puts c.response_code
    puts JSON::parse(c.body)
    end
  
end
 

 
 

