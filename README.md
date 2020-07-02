Steps to setup the server:

$ bundle install

$ rails db:create

$ rails db:migrate

$ rails s

List of APIs available:

1. To allocate a number:\
URL: localhost:3000/phones\
Method: POST\
Headers:\
&nbsp;Content-Type: application/json\
Example Result:\
&nbsp;{\
&nbsp;&nbsp;"success": true,\
&nbsp;&nbsp;"phone": "1361126693"\
&nbsp;}\

2. To allocate a specified number. Pass your desired number in place of <desired_number>:\
URL: localhost:3000/phones/<desired_number>\
Method: POST\
Headers:\
&nbsp;Content-Type: application/json\
Example Result:\
&nbsp;{\
&nbsp;&nbsp;"success": true,\
&nbsp;&nbsp;"phone": "9876543212"\
&nbsp;}\

3. List all allocated numbers:\
URL: localhost:3000/phones\
Method: GET\
Headers:\
&nbsp;Content-Type: application/json\
Example Result:\
&nbsp;{\
&nbsp;&nbsp;"success": true,\
&nbsp;&nbsp;"phones": [\
&nbsp;&nbsp;&nbsp;"9270814332",\
&nbsp;&nbsp;&nbsp;"4398208184",\
&nbsp;&nbsp;&nbsp;"9206730045",\
&nbsp;&nbsp;&nbsp;"7641804983",\
&nbsp;&nbsp;&nbsp;"1234567890",\
&nbsp;&nbsp;&nbsp;"1701292643",\
&nbsp;&nbsp;&nbsp;"1985837686",\
&nbsp;&nbsp;&nbsp;"5224883536",\
&nbsp;&nbsp;&nbsp;"1967352727",\
&nbsp;&nbsp;&nbsp;"1234567898"\
&nbsp;&nbsp;]\
&nbsp;}