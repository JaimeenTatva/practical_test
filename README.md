Steps to setup the server:

$ bundle install

$ rails db:create

$ rails db:migrate

$ rails s

List of APIs available:

1. To allocate a number:
URL: localhost:3000/phones
Method: POST
Headers:
    Content-Type: application/json
Example Result:
    {
        "success": true,
        "phone": "1361126693"
    }

2. TO allocate a specified number:
URL: localhost:3000/phones/<desired_number>
Method: POST
Headers:
    Content-Type: application/json
Example Result:
    {
        "success": true,
        "phone": "9876543212"
    }

3. List all allocated numbers:
URL: localhost:3000/phones
Method: GET
Headers:
    Content-Type: application/json
Example Result:
    {
        "success": true,
        "phones": [
            "9270814332",
            "4398208184",
            "9206730045",
            "7641804983",
            "1234567890",
            "1701292643",
            "1985837686",
            "5224883536",
            "1967352727",
            "1234567898"
        ]
    }