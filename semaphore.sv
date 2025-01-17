// Class to define a shared semaphore for synchronization
class semaphore_shared;

  semaphore sem;  // Declare a semaphore object to control access to shared resources
  
  // Constructor to initialize the semaphore with a size of 1
  function new();
    sem = new(1);  // Create a binary semaphore (size 1), allowing mutual exclusion
  endfunction

endclass
