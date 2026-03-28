import ballerinax/mssql;
import ballerinax/mssql.driver as _;

// MSSQL database client
final mssql:Client dbClient = check initDbClient();

function initDbClient() returns mssql:Client|error {
    return new (
        host = dbHost,
        port = dbPort,
        user = dbUser,
        password = dbPassword,
        database = dbName
    );
}
