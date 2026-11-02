// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StudentData {

    struct Student {
        uint id;
        string name;
        uint age;
        uint marks;
    }

    Student[] public students;

    function addStudent(uint id, string memory name,
        uint age, uint marks) public {
        students.push(Student(id, name, age, marks));
    }

    function getStudent(uint index) public view returns (
        uint, string memory, uint, uint
    ) {
        Student memory s = students[index];
        return (s.id, s.name, s.age, s.marks);
    }

    function getCount() public view returns (uint) {
        return students.length;
    }

    fallback() external payable {}

    receive() external payable {}
}
