#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

#######################################################################
#
# An example of adding macros to an WriteXLSX file using VBA project file
# extracted from an existing Excel xlsm file.
#
# The +extract_vba.rb+ utility supplied with WriteXLSX can be used to extract
# the vbaProject.bin file.
#
# An embedded macro is connected to a form button on the worksheet.
#
# reverse(c), November 2012, John McNamara, jmcnamara@cpan.org
# convert to ruby by Hideo NAKAMURA, cxn03651@msj.biglobe.ne.jp
#

require 'write_xlsx'

# Note the file extension should be .xlsm.
workbook  = WriteXLSX.new('macros.xlsm')
worksheet = workbook.add_worksheet

puts '*'*100
puts worksheet
puts '*'*100

workbook.close
