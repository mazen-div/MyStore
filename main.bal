import ballerina/http;
import ballerina/sql;

listener http:Listener httpDefaultListener = new (8080);

service /api on httpDefaultListener {

    // GET endpoint to retrieve all products
    resource function get products() returns Product[]|error {
        sql:ParameterizedQuery query = `SELECT ProductName, Price, StockQuantity FROM Products`;
        stream<Product, sql:Error?> productStream = dbClient->query(sqlQuery = query);
        
        Product[] products = check from Product product in productStream
            select product;
        
        check productStream.close();
        return products;
    }
}
