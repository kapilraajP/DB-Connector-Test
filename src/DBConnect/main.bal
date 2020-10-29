import ballerina/http;
import ballerina/io;

public type Configuration record {
    string userName;
    string password;
    string url;
};

public type Customer record {|
    int id;
    string name;
    int age;
|};

public class MyClient{
    public string userName;
    public string password;
    public string url;
    public http:Client newClient;

    function init(Configuration conf){
        self.userName = conf.userName;
        self.password = conf.password;
        self.dbUurlrl = conf.url;

        self.MyClient = new (self.url);
    }


    public function retriveById(int customerId) returns @tainted json|error {
        http:Response? result = new;

        result = <http:Response> self.newClient->get(string `/data/customers/${customerId}`);

        if result is error{

            io:println(result.message(),result);
                return result;
            
        }else{

            if (result.statusCode == 200) {

                json payload = <json>result.getJsonPayload();
            
                return payload;

            } else {
                io:println(result.message(),result);
                return result;
            }
        }
    }

    public function addnewCustomer(Customer customer) returns @tainted json|error {
        http:Response? result = new;

        result = <http:Response> self.newClient->post(string `/data/customers/`,<@untainted> check customer.cloneWithType(json));

        if result is error{

            io:println(result.message(),result);
            return result;

        }else{

            if (result.statusCode == 200) {

                json payload = <json>result.getJsonPayload();
            
                return payload;

            } else {
                io:println(result.message(),result);
                return result;
            }
        }
    }
    

    public function UpdateExistingCustomer(Customer customer) returns @tainted json|error {
        http:Response? result = new;

        result = <http:Response> self.newClient->put(string `/data/customers/`,<@untainted> check customer.cloneWithType(json));

        if result is error{
            io:println(result.message(),result);
            return result;
        }else{
            if (result.statusCode == 200) {

                json payload = <json>result.getJsonPayload();
                return payload;

            } else {
                io:println(result.message(),result);
                return result;
            }
        }
    } 
    
    public function deleteCustomer(int customerId) returns @tainted json|error {
        http:Response? result = new;

        result = <http:Response> self.newClient->delete(string `/data/customers/${customerId}`);

        if result is error{
            io:println(result.message(),result);
            return result;
        }else{

            if (result.statusCode == 200) {

                json payload = <json>result.getJsonPayload();
            
                return payload;

            } else {
                io:println(result.message(),result);
                return result;
            }
        }
    }

            
}


