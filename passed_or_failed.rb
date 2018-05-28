class PassedOrFailed

    def initialize(hash_data, threshold)
        @hash_data = hash_data
        @threshold = threshold.to_i            
    end

    def result
        hash_results = {passed: @hash_data.select{|key, value| value.to_i >= @threshold}.map{|key, value| [key, value.to_i]}.to_h, failed: @hash_data.select{|key, value| value.to_i < @threshold}.map{|key, value| [key, value.to_i]}.to_h}
        return hash_results
    end 

end
