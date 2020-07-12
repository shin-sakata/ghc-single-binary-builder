module Lib
    ( selectAllAndPrint
    ) where

import Database.HDBC 
import Database.HDBC.Sqlite3 

selectAllAndPrint :: IO ()
selectAllAndPrint = do 
  conn <- connectSqlite3 "sqlite-dependent-example.db" 
  val <- quickQuery conn "select * from foo" []
  print val
