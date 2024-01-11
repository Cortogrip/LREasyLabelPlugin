----------------------------------------------------------------------------
 Launch Easy Label print service
 It is possible to customize behavior by setting environnement variables.
----------------------------------------------------------------------------
 
List of var :

   server.port  : The port used to listen request
   outputDir    : PDF file output dir
   base.x       : The horizontal reference (from page left). Default is  30
   base.y       : The vertical reference (from page bottom) . Default is  15
   offset.x     : X offset between labels. Default is  200
   offset.y     : Y offset between labels. Default is  90
   lineHeight   : Height of a line. Default is  10
   fontSize     : Label text base font. Default is  8

 Example :
    java -jar "-Dspring.profiles.active=local" "-DoutputDir=../tmp/" LREasyLabelPrint.jar
