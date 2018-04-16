module PodioHelper
    def podio_init
        Podio.setup(:api_key => 'net60', :api_secret => '3RpEzZIyoSOrLIQD842ZRMeci38Fm3At0huDQMQZGR86EaG3DJa4X8s3DhJ7Uv5Q')
        Podio.client.authenticate_with_credentials('stevedtannahill@gmail.com', 'podio1234')
    end
    def get_item
        Podio::Item.find(807931078)
    end
    
    def get_field (item, label)
        item.fields.select{|field| field["label"] == label}
        item.fields.select{|field| field["label"] == "Client"}.first["values"].first["value"]["item_id"] # includes item id of client
    end
end