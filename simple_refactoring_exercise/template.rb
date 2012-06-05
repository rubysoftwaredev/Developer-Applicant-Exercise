#=============
#= Refactored Code : Tuesday , June 5 2012
#= Why : Duplicate code that was not componentized, error-prone 
#= Contact : Chandra Gupta, chandragupta.phd@gmail.com
#=============

module Template


  #>>>>>>>>>>>>>>
  #> substitute_code : creates a new copy of src_str;
  #> splits src_str into two parts - part of string before pattern 
  #> and part of string after pattern; inserts code string between 
  #> the two string parts and returns this string
  #>>>>>>>>>>>>>>

  def substitute_code(src_str, pattern_str, code)

    template = String.new(src_str)
    
    pattern_len = pattern_str.length
    template_split_begin = template.index(pattern_str)
    template_split_end = template_split_begin + pattern_len

    template_part_one =
      String.new(template[0..(template_split_begin-1)])

    template_part_two =
      String.new(template[template_split_end..template.length])

    template_part_one + code + template_part_two

  
  end


  #>>>>>>>>>>>>>>
  #> template : takes a src string with two patterns and a code string;
  #> substitutes the code string into the first occurrence of the pattern;
  #> creates a new code from the code and substitutes the second occurrence
  #> of the pattern with the new code
  #> returns the string where pattern is substituted with codes
  #>>>>>>>>>>>>>>

  def template(source_template, req_id)

     part_one = substitute_code(source_template, "%CODE%", req_id)

     altcode = req_id[0..4] + "-" + req_id[5..7]

     part_two = substitute_code(part_one, "%ALTCODE%", altcode)
     
  end
   
end


####### PREVIOUS CODE : BEGIN : ##########

####### This section may be removed after sanity checks have passed ####

#module Template
#  def template(source_template, req_id)
#    template = String.new(source_template)
#
#    # Substitute for %CODE%
#    template_split_begin = template.index("%CODE%")
#    template_split_end = template_split_begin + 6
#    template_part_one =
#      String.new(template[0..(template_split_begin-1)])
#    template_part_two =
#      String.new(template[template_split_end..template.length])
#    code = String.new(req_id)
#    template =
#      String.new(template_part_one + code + template_part_two)
#
#    # Substitute for %ALTCODE%
#    template_split_begin = template.index("%ALTCODE%")
#    template_split_end = template_split_begin + 9
#    template_part_one =
#      String.new(template[0..(template_split_begin-1)])
#    template_part_two =
#      String.new(template[template_split_end..template.length])
#    altcode = code[0..4] + "-" + code[5..7]
#    template_part_one + altcode + template_part_two
#  end
#end

######## PREVIOUS CODE : END   : ##########
