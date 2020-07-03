<?php 
$username = "root";
$password = "";
$server ="127.0.0.1";
$db ="crud_mysql";

$con = mysqli_connect($server,$username,$password,$db);
if($con){
    $email = $_POST['email'];
    $pass = $_POST['password'];

    $emailQuery = "select * from flutter_table where email= '$email'";
    $query = mysqli_query($con,$emailQuery);
    $emailcount = mysqli_num_rows($query);
    if($emailcount)
    {
        $email_pass = mysqli_fetch_assoc($query);
        $db_pass = $email_pass['password'];

        $pass_decode = password_verify($pass, $db_pass);
        if($pass_decode)
        {
            echo "login successful";
        }
        else
        {
            echo "login not successfull";
        }
    }
    else
    {
        echo "invalid email";
    }
	
}
else
{
    echo "oops database connection failed";
}

?>