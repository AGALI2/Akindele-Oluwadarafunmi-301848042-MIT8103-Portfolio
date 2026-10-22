db.student_semester_results.insertOne({
  matric_number: "STU001",
  full_name: "Amina Bello",
  department: "Computer Science",
  academic_year: 2026,
  semester: "First",
  results: [
    { course_code: "CSC301", course_title: "Database Systems", credit_units: 3, score: 82.5, status: "Published" },
    { course_code: "CSC305", course_title: "Data Structures", credit_units: 3, score: 74.0, status: "Published" }
  ]
});

db.student_semester_results.findOne({
  matric_number: "STU001",
  academic_year: 2026,
  semester: "First"
});

db.student_semester_results.createIndex({
  matric_number: 1,
  academic_year: 1,
  semester: 1
});


