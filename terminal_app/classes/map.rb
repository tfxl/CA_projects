require 'rainbow'
require 'tty'
cursor = TTY::Cursor

# https://dorkbyte.wordpress.com/2012/08/05/trick-out-your-terminal-with-ascii-art/
# think about lolize and gradient coloring

#https://textart.sh/topic/africa


# THINK ABOUT DIVIDING INTO AREA, THEN CYCLE THROUGH THE AREAS IN OPTIONS



class Map


    def initialize

        @map_array = [
            {y48:"                    ▒▒    ▒▒░░▒▒▒▒▓▓▒▒▒▒░░"},                                                  
            {y47:"                    ██▒▒████▒▒▒▒░░▒▒▒▒░░▒▒▒▒"},                                               
            {y46:"                ██▓▓██▓▓░░▒▒▓▓░░▒▒▒▒▒▒▒▒▒▒"},                                                 
            {y45:"                ░░░░  ░░░░▒▒░░░░░░░░░░░░░░░░░░    ░░░░▒▒  ░░"},                              
            {y44:"                ▒▒▒▒    ▒▒▓▓▓▓▒▒▒▒░░░░▒▒░░░░▒▒    ▒▒▒▒▓▓  ▒▒ "},                               
            {y43:"            ▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░▒▒▓▓▒▒▓▓▓▓░░▒▒▒▒▒▒▒▒▒▒ "},                        
            {y42:"            ▒▒▓▓░░  ▒▒▒▒▓▓▒▒▒▒▒▒▒▒░░░░░░▒▒░░░░▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒"},                     
            {y41:"        ▒▒▒▒░░▒▒░░▓▓░░░░░░▓▓  ▒▒░░▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒▒░░▒▒"},                     
            {y40:"    ░░▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒  ▒▒▒▒░░▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓░░░░░░▒▒░░▒▒▒▒░░░░"},                       
            {y39:"    ▒▒▓▓░░▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒░░▒▒▒▒░░░░▒▒░░░░▒▒░░░░░░░░░░░░"},                     
            {y38:"    ▓▓▒▒▒▒▒▒▒▒▓▓░░▒▒▒▒▒▒░░▒▒░░▒▒▒#{}▒▒▒▒▒▒▒░░▒▒░░░░▒▒░░▒▒░░▒▒▒▒░░  ░░▒▒░░"},                     
            {y37:"    ░░▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒░░▓▓▓▓▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒"},                     
            {y36:"    ▒▒░░░░▒▒░░▒▒▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒▒▒░░░░▒▒▒▒░░░░▒▒  ░░▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░  ▒▒▓▓"},                 
            {y35:"    ▒▒▓▓▒▒▒▒▓▓▒▒▓▓▒▒▓▓░░▒▒▓▓▒▒▓▓  ░░░░░░░░▒▒░░  ▓▓▓▓▒▒▒▒▓▓▒▒░░░░▒▒░░▒▒▓▓  ▒▒"},                 
            {y34:"▓▓██▓▓▓▓▒▒██▒▒░░▒▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒░░  ░░▒▒  ▒▒██▓▓▒▒▒▒▒▒▓▓▒▒▒▒▒▒▓▓▒▒▒▒████ "},              
            {y33:"██▒▒▒▒▒▒░░▓▓▒▒▓▓▒▒▒▒██▓▓▓▓░░▒▒▓▓▒▒▒▒▓▓▒▒▓▓▒▒▒▒░░▓▓▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓ "},                
            {y32:"▒▒░░▒▒▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒████▓▓  ░░▒▒▒▒░░░░░░▒▒▓▓██  ░░▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒▒▓▓▓▓▒▒░░  "},         
            {y31:"▒▒▒▒▒▒░░▒▒██▒▒▓▓  ▒▒██▒▒▒▒▓▓▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒██▒▒▓▓▒▒▓▓▒▒▓▓▒▒▓▓  ▒▒▓▓▓▓░░▒▒░░  ▒▒██▒▒ "},
            {y30:"    ▒▒▓▓░░▒▒▒▒▒▒▓▓▒▒▒▒██▓▓██▒▒░░▓▓▓▓▒▒░░░░░░▒▒▒▒▓▓▓▓▒▒▒▒▒▒░░▓▓▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒██▓▓ "},
            {y29:"    ██▒▒  ▒▒██▓▓▒▒▒▒██▒▒▒▒▒▒▒▒▒▒  ░░▒▒▒▒▒▒▒▒░░  ██▓▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓░░░░▒▒  ▓▓▒▒▒▒▒▒▒▒██▒▒▓▓ "},
            {y28:"    ▒▒▒▒▓▓██  ▒▒██▒▒▒▒▒▒▒▒▓▓▓▓▒▒░░▒▒▒▒░░░░░░▒▒▒▒░░▒▒▓▓  ▒▒▓▓░░▒▒▒▒▓▓░░▒▒▒▒▒▒▒▒  ▓▓▓▓██▒▒▒▒ "},
            {y27:"        ▒▒▓▓  ▓▓▒▒░░██▒▒░░▒▒▒▒  ▒▒▓▓░░░░▒▒▓▓▒▒▒▒▒▒▒▒░░▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▓▓▒▒▒▒  ▓▓░░██▒▒▒▒"}, 
            {y26:"        ▒▒▒▒▒▒  ▓▓▒▒▒▒▒▒▒▒▒▒░░▒▒░░░░░░░░░░▒▒▓▓▒▒▓▓░░▓▓▓▓░░▒▒░░▒▒░░░░▒▒  ▒▒▓▓░░░░▒▒▒▒▒▒▓▓  "}, 
            {y25:"            ░░▒▒    ░░  ▒▒      ▒▒░░░░▒▒▒▒░░░░░░▒▒▒▒▓▓░░▒▒░░▒▒▒▒▒▒▒▒░░▒▒▒▒░░░░░░░░▒▒▒▒▓▓▓▓ "},  
            {y24:"                                ░░░░▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▒▒░░▒▒▒▒▒▒▒▒░░░░░░░░▓▓▒▒░░▒▒░░▒▒▒▒  "},   
            {y23:"                                    ░░░░▒▒░░▒▒▒▒▒▒▒▒▓▓▒▒░░░░▒▒▒▒░░▒▒░░░░▒▒▓▓▒▒░░▒▒▒▒ "},      
            {y22:"                                    ░░▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒░░▒▒▓▓▒▒▒▒▒▒▒▒▒▒"},       
            {y21:"                                    ░░░░░░▒▒▒▒▒▒▒▒▓▓▒▒▒▒░░  ▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒░░▒▒▒▒░░ "},        
            {y20:"                                    ░░▒▒▒▒▒▒░░▓▓▓▓▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒  "},         
            {y19:"                                    ░░▒▒▒▒░░▒▒▒▒▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▓▓▒▒▒▒   "},          
            {y18:"                                        ░░▒▒▒▒░░▓▓▓▓██▒▒▓▓▒▒▓▓▒▒▒▒▓▓▓▓░░▓▓████▓▓ "},            
            {y17:"                                        ░░░░▒▒▒▒▓▓▒▒▓▓▓▓▒▒▒▒▒▒▒▒▓▓▓▓▒▒▓▓▒▒██░░░░  "},           
            {y16:"                                        ░░▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒░░░░░░░░▒▒▒▒▒▒▒▒░░▒▒  "},           
            {y15:"                                        ▒▒▓▓▒▒▓▓██▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▒▒▓▓▓▓  "},           
            {y14:"                                            ░░▒▒▒▒▒▒▓▓  ▒▒▓▓▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒   "},          
            {y13:"                                            ░░░░  ▓▓▒▒▒▒░░▒▒░░▒▒░░░░░░░░  ▓▓▒▒▒▒   "},          
            {y12:"                                        ░░▒▒▒▒▒▒░░▒▒▓▓▒▒░░▒▒▒▒░░░░░░▒▒░░▒▒  ▒▒   "},            
            {y11:"                                        ░░▒▒░░░░▒▒▒▒▒▒▒▒░░▒▒▒▒░░░░░░▒▒▓▓▒▒░░▒▒   "},            
            {y10:"                                        ░░▒▒▒▒░░░░░░▒▒▒▒▒▒░░░░░░░░░░░░▒▒▒▒▒▒   "},              
            {y9:"                                        ░░░░░░░░░░▒▒▒▒░░▒▒▒▒▒▒░░░░░░▒▒ "},                    
            {y8:"                                        ░░▒▒░░▒▒▒▒▒▒▒▒░░░░▒▒░░▒▒▒▒░░▒▒ "},                    
            {y7:"                                            ▒▒░░▒▒░░░░▒▒░░▒▒▒▒░░░░░░▒▒▒▒"},                     
            {y6:"                                            ░░▒▒  ▒▒▒▒░░  ░░▒▒░░░░▒▒▒▒  "},                     
            {y5:"                                            ▒▒▒▒▒▒▓▓▒▒░░▒▒░░░░▒▒░░   "},                      
            {y4:"                                            ▒▒▒▒▒▒██▒▒▒▒░░▓▓▒▒▒▒░░   "},                      
            {y3:"                                            ░░░░▒▒▒▒▒▒░░░░▒▒░░░░    "},                       
            {y2:"                                                ░░▒▒▒▒░░░░░░▒▒     "},                          
            {y1:"                                                ▒▒  ▒▒░░▓▓▒▒     "}]                          

    end

    def create_map()

        edp = example_dot_presentation = "\u2b24"

        c = Rainbow(edp).red
        edpo = Rainbow(edp).orange
        edpg = Rainbow(edp).green

        puts edpr, edpo, edpg
  
        # THINK OF IT THIS WAY. COMPUTER DOESN'T CARE IF IT'S AN x OR A LONG STRING, WITH THIS
        # SIZE PROGRAM IT WILL INSTANTLY WORK. SO LET EVERY LINE BE A REPRESENTATION OF THE CAUSE
        # OR CAUSES IN THAT AREA. DOES THIS MAP NEED TO BE KEPT? PROBABLY NOT IF THE COMPILATION
        # WILL JUST BE COMPOSED OF INDIVIDUAL CAUSE AREAS ITERATED THROUGH. 

        #could always require the class, make the map and make the objects at the same time. 
    # this would allow a better representation of the whole map. and could consider some dividers into
    # the geographical compasss areas too.... 

    #maybe make the map the object ? Rather than creating. And then iterate a self.map ?
       
                                                                            
                                                                                              
        map_array = [{y48:"                    ▒▒    ▒▒░░▒▒▒▒▓▓▒▒▒▒░░"},                                                  
        {y47:"                    ██▒▒████▒▒▒▒░░▒▒▒▒░░▒▒▒▒"},                                               
        {y46:"                ██▓▓██▓▓░░▒▒▓▓░░▒▒▒▒▒▒▒▒▒▒"},                                                 
        {y45:"                ░░░░  ░░░░▒▒░░░░░░░░░░░░░░░░░░    ░░░░▒▒  ░░"},                              
        {y44:"                ▒▒▒▒    ▒▒▓▓▓▓▒▒▒▒░░░░▒▒░░░░▒▒    ▒▒▒▒▓▓  ▒▒ "},                               
        {y43:"            ▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░▒▒▓▓▒▒▓▓▓▓░░▒▒▒▒▒▒▒▒▒▒ "},                        
        {y42:"            ▒▒▓▓░░  ▒▒▒▒▓▓▒▒▒▒▒▒▒▒░░░░░░▒▒░░░░▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒"},                     
        {y41:"        ▒▒▒▒░░▒▒░░▓▓░░░░░░▓▓  ▒▒░░▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒▒░░▒▒"},                     
        {y40:"    ░░▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒  ▒▒▒▒░░▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓░░░░░░▒▒░░▒▒▒▒░░░░"},                       
        {y39:"    ▒▒▓▓░░▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒░░▒▒▒▒░░░░▒▒░░░░▒▒░░░░░░░░░░░░"},                     
        {y38:"    ▓▓▒▒▒▒▒▒▒▒▓▓░░▒▒▒▒▒▒░░▒▒░░▒▒▒#{c}▒▒▒▒▒▒▒░░▒▒░░░░▒▒░░▒▒░░▒▒▒▒░░  ░░▒▒░░"},                     
        {y37:"    ░░▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒░░▓▓▓▓▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒"},                     
        {y36:"    ▒▒░░░░▒▒░░▒▒▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒▒▒░░░░▒▒▒▒░░░░▒▒  ░░▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░  ▒▒▓▓"},                 
        {y35:"    ▒▒▓▓▒▒▒▒▓▓▒▒▓▓▒▒▓▓░░▒▒▓▓▒▒▓▓  ░░░░░░░░▒▒░░  ▓▓▓▓▒▒▒▒▓▓▒▒░░░░▒▒░░▒▒▓▓  ▒▒"},                 
        {y34:"▓▓██▓▓▓▓▒▒██▒▒░░▒▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒░░  ░░▒▒  ▒▒██▓▓▒▒▒▒▒▒▓▓▒▒▒▒▒▒▓▓▒▒▒▒████ "},              
        {y33:"██▒▒▒▒▒▒░░▓▓▒▒▓▓▒▒▒▒██▓▓▓▓░░▒▒▓▓▒▒▒▒▓▓▒▒▓▓▒▒▒▒░░▓▓▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓ "},                
        {y32:"▒▒░░▒▒▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒████▓▓  ░░▒▒▒▒░░░░░░▒▒▓▓██  ░░▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒▒▓▓▓▓▒▒░░  "},         
        {y31:"▒▒▒▒▒▒░░▒▒██▒▒▓▓  ▒▒██▒▒▒▒▓▓▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒██▒▒▓▓▒▒▓▓▒▒▓▓▒▒▓▓  ▒▒▓▓▓▓░░▒▒░░  ▒▒██▒▒ "},
        {y30:"    ▒▒▓▓░░▒▒▒▒▒▒▓▓▒▒▒▒██▓▓██▒▒░░▓▓▓▓▒▒░░░░░░▒▒▒▒▓▓▓▓▒▒▒▒▒▒░░▓▓▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒██▓▓ "},
        {y29:"    ██▒▒  ▒▒██▓▓▒▒▒▒██▒▒▒▒▒▒▒▒▒▒  ░░▒▒▒▒▒▒▒▒░░  ██▓▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓░░░░▒▒  ▓▓▒▒▒▒▒▒▒▒██▒▒▓▓ "},
        {y28:"    ▒▒▒▒▓▓██  ▒▒██▒▒▒▒▒▒▒▒▓▓▓▓▒▒░░▒▒▒▒░░░░░░▒▒▒▒░░▒▒▓▓  ▒▒▓▓░░▒▒▒▒▓▓░░▒▒▒▒▒▒▒▒  ▓▓▓▓██▒▒▒▒ "},
        {y27:"        ▒▒▓▓  ▓▓▒▒░░██▒▒░░▒▒▒▒  ▒▒▓▓░░░░▒▒▓▓▒▒▒▒▒▒▒▒░░▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▓▓▒▒▒▒  ▓▓░░██▒▒▒▒"}, 
        {y26:"        ▒▒▒▒▒▒  ▓▓▒▒▒▒▒▒▒▒▒▒░░▒▒░░░░░░░░░░▒▒▓▓▒▒▓▓░░▓▓▓▓░░▒▒░░▒▒░░░░▒▒  ▒▒▓▓░░░░▒▒▒▒▒▒▓▓  "}, 
        {y25:"            ░░▒▒    ░░  ▒▒      ▒▒░░░░▒▒▒▒░░░░░░▒▒▒▒▓▓░░▒▒░░▒▒▒▒▒▒▒▒░░▒▒▒▒░░░░░░░░▒▒▒▒▓▓▓▓ "},  
        {y24:"                                ░░░░▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▒▒░░▒▒▒▒▒▒▒▒░░░░░░░░▓▓▒▒░░▒▒░░▒▒▒▒  "},   
        {y23:"                                    ░░░░▒▒░░▒▒▒▒▒▒▒▒▓▓▒▒░░░░▒▒▒▒░░▒▒░░░░▒▒▓▓▒▒░░▒▒▒▒ "},      
        {y22:"                                    ░░▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒░░▒▒▓▓▒▒▒▒▒▒▒▒▒▒"},       
        {y21:"                                    ░░░░░░▒▒▒▒▒▒▒▒▓▓▒▒▒▒░░  ▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒░░▒▒▒▒░░ "},        
        {y20:"                                    ░░▒▒▒▒▒▒░░▓▓▓▓▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒  "},         
        {y19:"                                    ░░▒▒▒▒░░▒▒▒▒▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▓▓▒▒▒▒   "},          
        {y18:"                                        ░░▒▒▒▒░░▓▓▓▓██▒▒▓▓▒▒▓▓▒▒▒▒▓▓▓▓░░▓▓████▓▓ "},            
        {y17:"                                        ░░░░▒▒▒▒▓▓▒▒▓▓▓▓▒▒▒▒▒▒▒▒▓▓▓▓▒▒▓▓▒▒██░░░░  "},           
        {y16:"                                        ░░▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒░░░░░░░░▒▒▒▒▒▒▒▒░░▒▒  "},           
        {y15:"                                        ▒▒▓▓▒▒▓▓██▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▒▒▓▓▓▓  "},           
        {y14:"                                            ░░▒▒▒▒▒▒▓▓  ▒▒▓▓▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒   "},          
        {y13:"                                            ░░░░  ▓▓▒▒▒▒░░▒▒░░▒▒░░░░░░░░  ▓▓▒▒▒▒   "},          
        {y12:"                                        ░░▒▒▒▒▒▒░░▒▒▓▓▒▒░░▒▒▒▒░░░░░░▒▒░░▒▒  ▒▒   "},            
        {y11:"                                        ░░▒▒░░░░▒▒▒▒▒▒▒▒░░▒▒▒▒░░░░░░▒▒▓▓▒▒░░▒▒   "},            
        {y10:"                                        ░░▒▒▒▒░░░░░░▒▒▒▒▒▒░░░░░░░░░░░░▒▒▒▒▒▒   "},              
        {y9:"                                        ░░░░░░░░░░▒▒▒▒░░▒▒▒▒▒▒░░░░░░▒▒ "},                    
        {y8:"                                        ░░▒▒░░▒▒▒▒▒▒▒▒░░░░▒▒░░▒▒▒▒░░▒▒ "},                    
        {y7:"                                            ▒▒░░▒▒░░░░▒▒░░▒▒▒▒░░░░░░▒▒▒▒"},                     
        {y6:"                                            ░░▒▒  ▒▒▒▒░░  ░░▒▒░░░░▒▒▒▒  "},                     
        {y5:"                                            ▒▒▒▒▒▒▓▓▒▒░░▒▒░░░░▒▒░░   "},                      
        {y4:"                                            ▒▒▒▒▒▒██▒▒▒▒░░▓▓▒▒▒▒░░   "},                      
        {y3:"                                            ░░░░▒▒▒▒▒▒░░░░▒▒░░░░    "},                       
        {y2:"                                                ░░▒▒▒▒░░░░░░▒▒     "},                          
        {y1:"                                                ▒▒  ▒▒░░▓▓▒▒     "}]                          
                                                             

    end

    def draw_map()
        x = 0
        puts "\n\n\n"
        @map_array.each do |i|
            i.each do |key, value|
                puts value
            end
        end
        puts "\n\n"

    end

end


bob = Map.new
x = bob.create_map()
bob.draw_map(x)

