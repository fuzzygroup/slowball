# In your application code
defmodule PitcherEngine.Repo do
  use Ecto.Repo,
    otp_app: :my_app
end

defmodule PitcherEngine.App do
  import Ecto.Query
  q = "SHOW TABLES"
  Repo.all(q)
end

defmodule PitcherEngine do
  # read the options file
  
  # connect to the db 
  db = "appdata_production"
  password = ""
  server = ""
  
  # grab the list of tables
  
  # loop over the tables
  
  # dump the first table
  
  # get the table size
  
  # if the table size >= 100 gigs
  
    # create a directory named for the table
  
    # split the file in the directory
    
    # create the folder within the bucket
    
    # copy each file up
    
    
  # copy the file up 
    
end
