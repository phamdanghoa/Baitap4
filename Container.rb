    require "./items.rb"
    class Container 
         def initialize result
            @container_type = result
            @item = Array.new
        end

        def add(item)
            @item.push(item)
        end

        def total_lenght
            i = 0
            @total_lenght = 0
            while i < @item.count() do
                @total_lenght += @item[i].get_lenght
                i +=1 
            end
            return @total_lenght
        end

        def total_weight
            i = 0
            @total_weight = 0
            while i < @item.count() do
                @total_weight += @item[i].get_weight
                i += 1
            end
            return @total_weight
        end

        def result
            i = 0
            while i < @item.count() do
                if @container_type == "FR20" || @container_type == "FR40"
                    puts "#{@item[i]}"
                    @item[i].flatrack(@container_type)
                elsif @container_type == "OT20" || @container_type == "OT40"
                    puts "#{@item[i]}"
                    @item[i].open_top(@container_type)
                end
                i += 1
            end
            zone_K()

        end

        def zone_K()
            total_lenght = total_lenght()
             puts "check total length"
            case @container_type
            when "FR20"
                if total_lenght > 597
                    puts "MESSAGE 8"
                    zone_L()
                else 
                    zone_L()
                    
                end
            when "FR40"
               
                if total_lenght > 1217.8
                    puts "MESSAGE 8"
                    zone_L()
                else 
                    zone_L()
                    
                end
            when "OT20"
                if total_lenght > 589
                    puts "MESSAGE 8"

                    zone_L()
                else 
                    zone_L()
                    
                end
            when "OT40"
                if total_lenght > 1200
                    puts "MESSAGE 8"
                    zone_L()
                else 
                    zone_L()
                    
                end
            end
        end

        def zone_L()
            total_weight = total_weight()
            puts "check total weight"
            case @container_type
            when "FR20"
                if total_weight > 20
                    puts "MESSAGE 9"
                    final_evaluation()
                   
                else 
                    final_evaluation()   
                   
                end
            when "FR40"
                if total_weight > 38.8
                    puts "MESSAGE 9"
                    final_evaluation()    
                               
                else 
                
                    final_evaluation()                
                    
                end
            when "OT20"
                if total_weight > 26.7
                    puts "MESSAGE 9"
                    final_evaluation() 
                                
                else 
                    final_evaluation()                
                   
                end
              
            when "OT40"
                if total_weight > 28.1
                    puts "MESSAGE 9"
                    final_evaluation()       
                           
                else 
                    final_evaluation()                
                  
                end
               
            end 

        end
        

        def final_evaluation()
           
             puts "total_result : "
            
             puts "total_length : #{total_lenght} " 
             puts "total_weight : #{total_weight }" 
        end
    end
    