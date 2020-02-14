# README

* Ruby version - 2.3.3p222

* Rails version - 5.1.7

* This is a simple rails application that calculates 'Spread to Benchmark' and 'Government Bond Curve' values for given bonds

* Starting application

* You can start the application by entering 'rails s ' from command line

* Navigate to home page 'localhost:3000' or any other port that you are running on and you will be taken to Bonds List page

* Create new bonds using the 'New Bond' link

* The output will get populated against each bond in the bond list page against the columns 'Spread to Benchmark' and 'Government Bond Curve'



* Additional Time consuming features
* I would have added RSpecs
* I could have moved the calculation of benchmark and government bond curve to a background job which refreshes the Spread to Benchmark and Government Bond Curve every time a bond gets updates or created

* There are a few issues with the current application where the output gets calculated every time we visit the bond list page. This ofcourse will lead to performance issues if we have a huge number of bonds and is not an optimal solution. 
