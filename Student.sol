
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Students{

    struct Student{
        uint id;
        string name;
        uint age;
        string grade;
    }

    Student[] public students;
    uint public studentCount;

    // Receive function to accept ether
    receive() external payable { }

    // Fallback (Optional can handle non epmty transactions
    fallback() external payable { }

    function addStudent(string memory _name, uint _age, string memory _grade) public{
        studentCount++;
        students.push(Student(studentCount,_name, _age, _grade));
    }

    // function to get student details by ID
    function getStudent(uint _id) public view returns(uint, string memory, uint, string memory){
        require(_id>0 && _id <studentCount,"Student does not exist");
        Student memory student = students[_id - 1];
        return(student.id, student.name, student.age, student.grade);
    }

    //function to get the total number of students
    function getTotalStudents() public view returns(uint){
        return studentCount;
    }

}
