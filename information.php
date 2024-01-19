<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin: 20px;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>

<h2>User Information</h2>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve submitted data
    $f_name = htmlspecialchars($_POST["f_name"]);
    $l_name = htmlspecialchars($_POST["l_name"]);
    $gender = htmlspecialchars($_POST["gender"]);
    $email = htmlspecialchars($_POST["email"]);
    $password = htmlspecialchars($_POST["password"]);
    $question= htmlspecialchars($_POST["question"]);
    $answer = htmlspecialchars($_POST["answer"]);
    
    $Address = htmlspecialchars($_POST["Address"]);
    $City = htmlspecialchars($_POST["City"]);
    $state = htmlspecialchars($_POST["state"]);
    $Zip_code = htmlspecialchars($_POST["Zip_code"]);
    $phone = htmlspecialchars($_POST["Phone"]);
    // Display information in a table
    echo "<table>";
    echo "<tr><th>Field</th><th>Value</th></tr>";
    echo "<tr><td>First Name</td><td>$f_name</td></tr>";
    echo "<tr><td>Last Name</td><td>$l_name</td></tr>";
    echo "<tr><td>Gender</td><td>$gender</td></tr>";
    echo "<tr><td>Email</td><td>$email</td></tr>";
    echo "<tr><td>Password</td><td>$password</td></tr>";
    echo "<tr><td>Security Question</td><td>$question</td></tr>";
    echo "<tr><td> Security Answer</td><td>$answer</td></tr>";
    echo "<tr><td> Address</td><td>$Address</td></tr>";
    echo "<tr><td> City</td><td>$City</td></tr>";
    echo "<tr><td>state </td><td>$state</td></tr>";
    echo "<tr><td>Zip_code </td><td>$Zip_code</td></tr>";
    echo "<tr><td>Phone Number</td><td>$phone</td></tr>";
    echo "</table>";
} else {
    echo "<p>No information submitted.</p>";
}
?>

</body>
</html>
