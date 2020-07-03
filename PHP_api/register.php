<?php 
$username = "root";
$password = "";
$server ="127.0.0.1";
$db ="crud_mysql";

$con = mysqli_connect($server,$username,$password,$db);
if($con){
    $username = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['mobile'];
    $pass = $_POST['password'];
    //$confirm = $_POST['confirm'];

    $passSafe = password_hash($pass, PASSWORD_BCRYPT);
    // $cpassSafe = password_hash($confirm, PASSWORD_BCRYPT);

    $emailQuery = "select * from flutter_table where email= '$email'";
    $query = mysqli_query($con,$emailQuery);
    $emailcount = mysqli_num_rows($query);
    if($emailcount > 0)
    {
        echo "Email already exist";
    }
    else
    {

        
            $insertQuery="insert into flutter_table (name, email, mobile, password) values ('$username','$email','$phone','$passSafe')";
            $result=mysqli_query($con,$insertQuery);
            if($result)
            {
                echo "Data registered succcessfully";
            }
            else
            {
                echo "Data not registered";
            }
        // }
        
    }

	
}
else
{
    echo "oops database connection failed";
}

?>