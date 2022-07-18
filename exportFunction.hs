module ExportFunction ( 
   showEven, 
   showBoolean 
) where 

showEven:: Int-> Int 
showEven x = x

showBoolean :: Int->Int 
showBoolean c = (showEven 2) * c