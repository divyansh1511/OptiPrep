import '../../api/mcq_problem_class.dart';

List<MCQProblem> sdList = [
  MCQProblem(
    statement:
        'Which software design pattern is used to ensure a single instance of a class exists in the system?',
    options: [
      'Observer Pattern',
      'Factory Pattern',
      'Singleton Pattern',
      'Decorator Pattern'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement: 'In software design, what does the term "SOLID" stand for?',
    options: [
      'Single Responsibility Principle, Open-Closed Principle, Liskov Substitution Principle, Interface Segregation Principle, Dependency Inversion Principle',
      'Single Responsibility Principle, Object-Oriented Programming, Liskov Substitution Principle, Inheritance, Dependency Inversion Principle',
      'Single Responsibility Principle, Object-Oriented Programming, Liskov Substitution Principle, Interface Segregation Principle, Dependency Inversion Principle',
      'Synchronized, Overloaded, Liskov Substitution Principle, Interface Segregation Principle, Dependency Inversion Principle'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which software design pattern is used to add new functionalities to an object without modifying its structure?',
    options: [
      'Observer Pattern',
      'Adapter Pattern',
      'Singleton Pattern',
      'Decorator Pattern'
    ],
    correctOptionIndex: 3,
  ),
  MCQProblem(
    statement:
        'In software design, what does the "Open-Closed Principle" state?',
    options: [
      'Classes should be open for extension and closed for modification',
      'Classes should be closed for extension and open for modification',
      'Classes should not have any public methods',
      'Classes should have only one responsibility'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which software design pattern is used to decouple the sender and receiver of a request?',
    options: [
      'Observer Pattern',
      'Proxy Pattern',
      'Singleton Pattern',
      'Decorator Pattern'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'What is the purpose of the "Interface Segregation Principle" in software design?',
    options: [
      'To ensure a class has only one responsibility',
      'To ensure a class can be extended without modification',
      'To ensure an interface has multiple implementations',
      'To ensure an interface has only the methods needed by its clients'
    ],
    correctOptionIndex: 3,
  ),
  MCQProblem(
    statement:
        'Which software design pattern is used to define a family of algorithms and make them interchangeable?',
    options: [
      'Observer Pattern',
      'Strategy Pattern',
      'Singleton Pattern',
      'Decorator Pattern'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'In software design, what does the "Liskov Substitution Principle" state?',
    options: [
      'A subclass should be able to substitute its parent class without affecting the correctness of the program',
      'A subclass should override all the methods of its parent class',
      'A subclass should have the same instance variables as its parent class',
      'A subclass should have more functionalities than its parent class'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which software design pattern is used to group related objects into a single object?',
    options: [
      'Observer Pattern',
      'Composite Pattern',
      'Singleton Pattern',
      'Decorator Pattern'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'What is the purpose of the "Dependency Inversion Principle" in software design?',
    options: [
      'To ensure a class has only one responsibility',
      'To ensure a class can be extended without modification',
      'To ensure a class depends on interfaces instead of concrete implementations',
      'To ensure an interface has only the methods needed by its clients'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'Which software design pattern is used to create an object in multiple steps and allow different representations?',
    options: [
      'Observer Pattern',
      'Builder Pattern',
      'Singleton Pattern',
      'Decorator Pattern'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'In software design, what does the "Single Responsibility Principle" state?',
    options: [
      'A class should have only one method',
      'A class should have only one instance variable',
      'A class should have only one responsibility',
      'A class should have only one constructor'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'Which software design pattern is used to provide a surrogate or placeholder for another object?',
    options: [
      'Observer Pattern',
      'Proxy Pattern',
      'Singleton Pattern',
      'Decorator Pattern'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'What is the purpose of the "Factory Method Pattern" in software design?',
    options: [
      'To create an interface for creating objects without specifying their classes',
      'To define a family of algorithms and make them interchangeable',
      'To provide a surrogate or placeholder for another object',
      'To ensure a single instance of a class exists in the system'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which software design pattern is used to separate the construction of a complex object from its representation?',
    options: [
      'Observer Pattern',
      'Builder Pattern',
      'Singleton Pattern',
      'Decorator Pattern'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement: 'In software design, what does the "Decorator Pattern" allow?',
    options: [
      'Adding new functionalities to an object without modifying its structure',
      'Creating a family of algorithms and making them interchangeable',
      'Providing a surrogate or placeholder for another object',
      'Ensuring a single instance of a class exists in the system'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which software design pattern is used to define the skeleton of an algorithm but allow subclasses to override some steps?',
    options: [
      'Observer Pattern',
      'Template Method Pattern',
      'Singleton Pattern',
      'Decorator Pattern'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'What is the purpose of the "Composite Pattern" in software design?',
    options: [
      'To group related objects into a single object',
      'To provide a surrogate or placeholder for another object',
      'To ensure a single instance of a class exists in the system',
      'To ensure a class depends on interfaces instead of concrete implementations'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which software design pattern is used to ensure a class has only one instance and provide a global point of access to that instance?',
    options: [
      'Observer Pattern',
      'Factory Pattern',
      'Singleton Pattern',
      'Decorator Pattern'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement: 'In software design, what does the "Proxy Pattern" do?',
    options: [
      'Decouples the sender and receiver of a request',
      'Adds new functionalities to an object without modifying its structure',
      'Provides a surrogate or placeholder for another object',
      'Ensures a class depends on interfaces instead of concrete implementations'
    ],
    correctOptionIndex: 2,
  ),
  // Add more MCQ problems here
];
