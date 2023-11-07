module ApiHelpers 
    def json 
        JSON.parser(response.body)
    end 
end 