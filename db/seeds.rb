User.create(first_name: "Marcus", last_name: "McDuffie", email: "marcus.mcduffie@materne.us")
User.create(first_name: "Richard", last_name: "Stallman", email: "richard.stallman@materne.us")
Computer.create(name: "USTVC-FS1", user_id: 1, os: "Windows 7", notes: "This computer needs to be struck with a hammer sometimes",
                deployment_date: Date.civil(1970, 1, 1),
                verification_date: Date.civil(2015, 2, 14),
                warranty_date: Date.civil(2013, 7, 3))
Site.create(name: "TVC", poc_name: "Marcus McDuffie", poc_phone: "1-(231)-346-6611")
