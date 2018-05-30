class CaesarCipher
    def initialize(text, shift = 13)
        @text = text
        @shift = shift
    end    

    def perform
        up = ("A".."Z").to_a
        down = ("a".."z").to_a
        text_letters = @text.split("")
        cipher_letters = []
        text_letters.each do |l|

                    if up.include?(l) && up.index(l) + @shift <= up.length - 1
                
                        cipher_letters.push(up[up.index(l)+@shift])
                        
                    elsif up.include?(l) && up.index(l) + @shift > up.length - 1
                
                        cipher_letters.push(up[@shift - up.length + up.index(l) ])
                
                    elsif down.include?(l) && down.index(l) + @shift <= down.length - 1

                        cipher_letters.push(down[down.index(l)+@shift])
                
                    elsif down.include?(l) && down.index(l) + @shift > down.length - 1
            
                       cipher_letters.push(down[@shift - down.length + down.index(l) ])
                
                    else     
                        cipher_letters.push(l)
                    end 
                end

        return cipher_letters.join("")   
    end 
 end

