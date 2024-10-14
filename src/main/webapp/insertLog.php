<?php
$servername = "localhost";
$username = "root";
$password = "Wyyddl520";
$dbname = "world";

// 创建连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接
if ($conn->connect_error) {
    die("连接失败: ". $conn->connect_error);
}

$logContent = $_POST['logContent'];

// 插入日志内容和当前时间到数据库
$sql = "INSERT INTO log (content, created_at) VALUES ('$logContent', NOW())";

if ($conn->query($sql) === TRUE) {
    echo "日志插入成功";
} else {
    echo "错误: ". $sql. "<br>". $conn->error;
}

$conn->close();
?>