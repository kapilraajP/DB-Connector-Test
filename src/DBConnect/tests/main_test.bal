import ballerina/io;
import ballerina/test;


    Configuration config = {
        userName: "<db username>",
        password: "<db password>",
        url: "http://localhost:3306"
    };

    MyClient dbClient = new(config);

@test:Config{}
function testRetrieveById(){

    json|error result = dbClient.retriveById(1);

    if result is json{
            io:println(result.toString());

    }else{
        test:assertFail(result.message(), result);
    }
}

@test:Config{}
function testAddnewCustomer(){

    Customer customer = {id:1, name:"customer", age:20};

    json|error result = dbClient.addnewCustomer(customer);

    if result is json{
            io:println(result.toString());

    }else{
        test:assertFail(result.message(), result);
    }
}


@test:Config{}
function testUpdateExistingCustomer(){

    Customer customer = {id:1, name:"customerupdate", age:22};

    json|error result = dbClient.updateExistingCustomer(customer);

    if result is json{
            io:println(result.toString());

    }else{
        test:assertFail(result.message(), result);
    }
}

@test:Config{}
function testDeleteCustomer){

    json|error result = dbClient.deleteCustomer(1);

    if result is json{
            io:println(result.toString());

    }else{
        test:assertFail(result.message(), result);
    }
}

