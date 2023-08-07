import '../../api/mcq_problem_class.dart';

List<MCQProblem> osList = [
  MCQProblem(
    statement: 'What is the main function of an operating system?',
    options: [
      'To provide hardware to the computer',
      'To provide software to the computer',
      'To manage computer hardware and software resources',
      'To control the computer mouse'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement: 'Which of the following is not an operating system?',
    options: ['Windows', 'Linux', 'MacOS', 'Microsoft Office'],
    correctOptionIndex: 3,
  ),
  MCQProblem(
    statement: 'Which component of an operating system manages memory?',
    options: ['Kernel', 'Compiler', 'Loader', 'File System'],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which scheduling algorithm selects the process with the smallest burst time?',
    options: [
      'First-Come, First-Served (FCFS)',
      'Shortest Job Next (SJN)',
      'Priority Scheduling',
      'Round Robin'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement: 'What is the primary purpose of virtual memory?',
    options: [
      'To increase the amount of physical memory in the system',
      'To provide a faster access to data stored on disk',
      'To allow multiple processes to share the same memory space',
      'To prevent memory leaks in the system'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'What is the role of the File Allocation Table (FAT) in the FAT file system?',
    options: [
      'To store the names of files and directories',
      'To maintain the file system hierarchy',
      'To keep track of free and used clusters on the disk',
      'To provide access control to files and directories'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement: 'What is the purpose of a semaphore in operating systems?',
    options: [
      'To manage process execution order',
      'To protect shared resources from concurrent access',
      'To provide a secure communication channel between processes',
      'To synchronize clock cycles in the system'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement: 'What is the function of the kernel in an operating system?',
    options: [
      'To provide a graphical user interface (GUI) for users',
      'To manage the computer\'s hardware resources',
      'To execute application programs',
      'To control the computer mouse and keyboard'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'Which page replacement algorithm is used to minimize the number of page faults?',
    options: [
      'First-In-First-Out (FIFO)',
      'Least Recently Used (LRU)',
      'Optimal Page Replacement',
      'Random Page Replacement'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'In a multi-threaded environment, what is the advantage of using user-level threads over kernel-level threads?',
    options: [
      'User-level threads are more efficient in terms of context switching',
      'User-level threads are managed by the operating system directly',
      'User-level threads provide better memory protection',
      'User-level threads can run on any processor core'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement: 'What is the role of a buffer cache in an operating system?',
    options: [
      'To store copies of frequently accessed disk blocks in memory',
      'To store user data temporarily for faster access',
      'To store process control blocks for running processes',
      'To store the file system\'s directory structure'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which process scheduling algorithm allows a process to run for a fixed time slice and then move to the back of the queue?',
    options: [
      'First-Come, First-Served (FCFS)',
      'Shortest Job Next (SJN)',
      'Round Robin',
      'Priority Scheduling'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'What is the purpose of the "nice" value in Unix-like operating systems?',
    options: [
      'To specify the number of CPU cores a process can use',
      'To set the priority of a process in the scheduling queue',
      'To allocate more memory to a process',
      'To control the maximum execution time of a process'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'What is the main advantage of using multi-level paging in virtual memory management?',
    options: [
      'To reduce the size of the page table',
      'To increase the amount of available physical memory',
      'To improve the speed of memory access',
      'To simplify the address translation process'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement: 'What is a deadlock in operating systems?',
    options: [
      'A condition where two processes continuously swap data',
      'A condition where a process waits indefinitely for a resource held by another process',
      'A condition where a process executes multiple threads simultaneously',
      'A condition where a process exceeds its allocated memory'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'In the context of file systems, what is the purpose of the "inode"?',
    options: [
      'To store the contents of a file',
      'To store the file name and its metadata',
      'To store the file system\'s directory structure',
      'To store the file system\'s block allocation table'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'Which CPU scheduling algorithm gives priority to processes with the highest priority number?',
    options: [
      'First-Come, First-Served (FCFS)',
      'Shortest Job Next (SJN)',
      'Priority Scheduling',
      'Round Robin'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'What is the purpose of the "swapping" process in virtual memory management?',
    options: [
      'To store frequently accessed data in the cache',
      'To transfer data between main memory and secondary storage',
      'To compress data to save memory space',
      'To prevent data corruption in the file system'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'Which file system feature is used to recover data in case of system crashes or power failures?',
    options: ['Journaling', 'Encryption', 'Compression', 'Defragmentation'],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement: 'What is the purpose of a context switch in process scheduling?',
    options: [
      'To move a process to the waiting state',
      'To move a process to the ready state',
      'To save the current state of a process and load the state of another process',
      'To terminate a process and release its resources'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'What is the role of the page table in virtual memory management?',
    options: [
      'To store the contents of disk blocks',
      'To map virtual addresses to physical addresses',
      'To manage the allocation of CPU time to processes',
      'To maintain a list of free memory blocks'
    ],
    correctOptionIndex: 1,
  ),
];
