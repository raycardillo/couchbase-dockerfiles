<?php

use \Couchbase\ClusterOptions;
use \Couchbase\Cluster;

// Update the connect string for your Couchbase on-prem or Capella instance.
$connectionString = "couchbases://cb.i-xxxxxxxxxxxxxx.cloud.couchbase.com?ssl=no_verify&timeout=10s";

// Update the credential values with your user credentials
$options = new \Couchbase\ClusterOptions();
$options->credentials("username", "password");

// get a cluster reference
$cluster = new \Couchbase\Cluster($connectionString, $options);

// get a bucket reference
$bucket = $cluster->bucket("travel-sample");

// get a user-defined collection reference$scope = $bucket->scope("tenant_agent_00");
$scope = $bucket->scope("tenant_agent_00");
$collection = $scope->collection("users");


/////
// Upsert / Get Example
/////

print("
------------------
upsert a user doc:
------------------
");
$upsertResult = $collection->upsert("user-doc-key", ["name" => "Ray", "points" => 499]);
print_r($upsertResult);

print("
-----------------
get the user doc:
-----------------
");
$getResult = $collection->get("user-doc-key");
print_r($getResult->content());


/////
// Query Example
/////

$queryString = "
SELECT
  a.id,
  a.name,
  a.icao
FROM
  default:`travel-sample`.inventory.airline a
WHERE
  a.country = \"United States\"
ORDER BY a.id DESC
LIMIT 5
";

printf("
---------------------
sample airline query:
---------------------
%s
---------------------
", $queryString);

$queryResult = $cluster->query($queryString);

// Iterate over the rows to access result data and print to the terminal.
foreach ($queryResult->rows() as $row) {
    print_r($row);
}

/////
// Ping Example
/////

print("
--------------------------
cluster ping all services:
--------------------------
");
$pingResult = $bucket->ping();
print_r($pingResult);

?>
