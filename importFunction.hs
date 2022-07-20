import ExportFunction
import ExportFunction (showEven)
import ExportFunction as B

main = do 
   print(ExportFunction.showEven 4) 
   print(ExportFunction.showBoolean 10) 
   print (showEven 4)
   print (B.showBoolean 4)