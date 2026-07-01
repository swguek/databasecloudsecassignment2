<?php
$conn = new mysqli("YOUR_RDS_ENDPOINT", "admin", "password", "studentdb");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['add'])) {
    $name = $_POST['name'];
    $age = $_POST['age'];

    $conn->query("INSERT INTO students (name, age) VALUES ('$name', $age)");
}

$result = $conn->query("SELECT * FROM students");
?>

<h2>Student Management System</h2>

<form method="POST">
    Name: <input name="name">
    Age: <input name="age">
    <button name="add">Add</button>
</form>

<h3>Students</h3>
<table border="1">
<tr><th>ID</th><th>Name</th><th>Age</th></tr>

<?php while($row = $result->fetch_assoc()) { ?>
<tr>
<td><?= $row['id'] ?></td>
<td><?= $row['name'] ?></td>
<td><?= $row['age'] ?></td>
</tr>
<?php } ?>

</table>
