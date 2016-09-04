Welcome to SlowBall!

This is an Elixir / Phoenix app designed to solve a very specific MySQL database problem -- the moving of (mostly) non-changing database tables from a source database to a target database.  The use case it solves is the migration from a self hosted MySQL installation to a cloud based MySQL installation either on a local instance or on Amazon RDS.  

What should be a straightforward problem has proven to be surprisingly tedious:

* our databases are giant (terabyte size) with hundreds of tables
* individual tables fail to completely load into RDS 
* worse the individual table loads fail silently giving the appearance of success
* compression on the largest tables fails giving the way to the next bullet
* individual tables can be as large as 120+ gigabytes giving the need to use standard unix tools like split / cat
* even with a successful move, how can you be sure?  SlowBall solves this by exposing APIs on both side of the transfer process allowing you to verify row counts and even checksums on a configurable number of samples
* An s3 bucket is used as the transfer medium

Its named SlowBall because the process is inherently slow - in our case we're transferring terabytes over the public internet.  Our concerns were data integrity and reliability.  When we did this manually on a small (130 table) database it sucked about 5 to 7 days of hand holding and annoyance.  And it was only by sheer luck that we caught the RDS failures.

There are two components to SlowBall: **Pitcher** and **Catcher**

# Pitcher 

* Pitcher runs on a machine with access to the source mysql database.  It exposes a web ui where:
    * you can select what tables need to be transferred
    * you can set options like 
    * a "START" button which begins the mysql dump by invoking a long running process
    
# Catcher

* Catcher runs on a machine with access to the target mysql database.  It consists of:
  * a loading process
  * a web api which Pitcher can call to make sure that the data transferred correctly
  
# Installation

There's no fancy, schmancy installation process here:

* just git clone pitcher or catcher onto the machines that you need 
* configure each database
* start the application
