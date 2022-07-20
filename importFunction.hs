import ExportFunction --import a module
import ExportFunction (showEven) --import a function from a module
import ExportFunction as B --alias a module to avoid duplication

main = do 
   print(ExportFunction.showEven 4) 
   print(ExportFunction.showBoolean 10) 
   print (showEven 4)
   print (B.showBoolean 4)