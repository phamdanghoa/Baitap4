require './Container.rb'
class Item 
    def initialize packing_style, length, width, height, weight,cog_height, cog_height_type
  
      @packing_style = packing_style
      @length = length
      @width = width
      @height = height
      @weight = weight 
      @cog_height = cog_height
      @cog_height_type = cog_height_type
    end
  
    def get_height()
        return @height
    end
    def get_width()
        return @width
    end
  
    def get_lenght()
        return @length
    end
  
    def get_weight()
        return @weight
    end
    def height_max()
        i = 0
        @height_max = 0
    while i < @item.count() do
            if ( @item.Array.new(i).get_height > @height_max)
                @height_max = @item.Array.new(i).get_height
            end
            i += 1
        end
        return @height_max
    end
    def flatrack(result)
       if @packing_style == "BARE" || @packing_style == "SKID"
            puts "MESSAGE 1"
            zone_A(result)
       elsif @packing_style == "CASE" || @packing_style == "CRATE"
            zone_A(result)
       end
    end
  
    def zone_A(result)
        @container_type = result
        case @container_type
        when "FR20"
            if @width > 380 
                puts "MESSAGE 2"
  
            else 
                zone_B(@container_type)
            end
        when "FR40"
            if @width > 470
                puts "MESSAGE 2"
            else
                zone_B(@container_type)
            end
        end
    end
  
    def zone_B(result)
        @container_type = result
        case @container_type
        when "FR20"
            if @length > 529 
                puts "MESSAGE 3"
                weight_distribution(@container_type)
            else 
                weight_distribution(@container_type)
            end
        when "FR40"
            if @length > 1150
                puts "MESSAGE 3"
                weight_distribution(@container_type)
            else
                weight_distribution(@container_type)
            end
        end
  
    end
  
    def weight_distribution (result)
        @container_type = result
        @weight_max
        case @container_type
        when "FR20"
         
                @weight_max = 30700
                if @weight > @weight_max
                    puts "MESSAGE 4"
                    zone_C(@container_type)
                else 
                    zone_C(@container_type)
                end
         
        when "FR40"
                @weight_max = 38700
                if @weight > @weight_max
                    puts "MESSAGE 4"
                    zone_C(@container_type)
                else 
                    zone_C(@container_type)
                end
        end
       
    end

  
    def zone_C(result)
        if @height > 518
            puts "MESSAGE 5"
            cog_calculation(result)
  
        elsif @height >0 && @height <= 518
            cog_calculation(result)
        end
    end
  
    def cog_calculation(result)
        case @cog_height_type
        when"HALF HEIGHT"
            zone_D1(result)
  
        when"TBA"
            puts "MESSAGE 10"
            zone_D1(result)
  
        when"MANUAL"
            zone_D2(result)
            
        end
    end
  
    def zone_D1(result)
        case @container_type
        when "FR20"
            if @width <= 243 
                zone_E()	
            elsif @width > 243 && @width < 380
                zone_F()	
            end
        when "FR40"
            if @width <= 243 
                zone_E()	
            elsif @width > 243 && @width < 470
                zone_F()	
            end
        end
    end
  
    def zone_D2(result)
        case @container_type
        when "FR20"
            if @width <= 243 
                zone_H()	
            elsif @width > 243 && @width < 380
                zone_G()	
            end
        when "FR40"
            if @width <= 243 
                zone_H()	
            elsif @width > 243 && @width < 470
                zone_G()	
            end
        end
    end
  
    def zone_E()
        @Cogh_value = @height_max/2
        @mwvar = @width * 0.865
        if @Cogh_value > @mwvar 
            puts "MESSAGE 6"
        elsif @Cogh_value < @mwvar
            puts "ok"
        end
    end
    
    def zone_F()
        @Cogh_value = @height_max/2
        if @Cogh_value > 190 
            puts "MESSAGE 6"
           
        elsif @Cogh_value <= 190
            puts "ok"
        end 
    end
    
    def zone_G()
        if @cog_height > 190 
            puts "MESSAGE 6 "
        elsif @cog_height <= 190
            puts "ok"
        end 
    end
  
    def zone_H()
        @mwvar = @width * 0.865
        if @cog_height > @mwvar 
            puts "MESSAGE 6 "
        elsif @cog_height <= @mwvar
            puts "ok"
        end 
    end
    def open_top(result)
        if @packing_style == "BARE" 
             puts "MESSAGE 1"
        elsif @packing_style == "CASE"
             cog_height_calculation(result)
        end
    end
  
    def cog_height_calculation(result)
        if @cog_height_type == "MANUAL" || @cog_height_type == "HALF HEIGHT"
            zone_I(result)
        elsif @cog_height_type == "TBA"
            puts "MESSAGE 10"
            zone_I(result)
        end
    end
  
    def zone_I(result)
        case @cog_height_type 
        when "MANUAL"
            if @cog_height > 211
                puts "MESSAGE 6"
                zone_J(result)
  
            else
                zone_J(result)
            end
        
        when"HALF HEIGHT" 
            @mwvar = cog_height/2
            if @mwvar > 211
                puts "MESSAGE 6"
                zone_J(result)
  
            else
                zone_J(result)
            end
        when "TBA"
            puts "MESSAGE 10"
            zone_J(result)
        end
    end
  
    def zone_J(result)
        @mwvar = @weight/@length
        case result
        when "OT20"
            if @mwvar > 3
                puts "MESSAGE 7"
                zone_K()
            else
                puts "ok"
                zone_K()
            end
        when "OT40"
            if @mwvar > 4.5
                puts "MESSAGE 7"
                zone_K()
            else
                puts "ok"
                zone_K()
            end
        end
    end
    def zone_M()
        height= get_height()
        width = get_width()
        case @container_type
        when "FR20"
            if height > 220 && width > 244
                puts "MESSAGE "
                final_evaluation() 
            else 
                final_evaluation() 
                
            end
        when "FR40"
           
            if  height >= 195 && width >= 244
                puts "MESSAGE 8"
                final_evaluation() 
            else 
                final_evaluation() 
                
            end
        when "OT20"
            if height >= 233
                puts "MESSAGE 8"

                final_evaluation() 
            else 
                final_evaluation() 
                
            end
        when "OT40"
            if height >= 233
                puts "MESSAGE 8"
                final_evaluation() 
            else 
                final_evaluation() 
                
            end
        end
    end 
    
 end