import scala.util.Random

object GuidedDiscovery{

  def main(args: Array[String]): Unit = {
    // Generate a random Integer between 0 and 9
    val randomNumber = Random.nextInt(10)

    // Generate a random String
    val randomString = Random.alphanumeric.take(1).mkString 

    // Create a loop to run the program
    while (true) {
      // Ask the user to input a number
      print("Please enter a number between 0 and 9: ")
      val userInput = scala.io.StdIn.readLine()

      // Check if the user input is correct
      if (userInput == randomNumber.toString) {
        println("You guessed correctly! Your reward is a random string: " + randomString)
        System.exit(0)
      } else {
        println("Incorrect guess. Please try again.")
      }
    }
  }

}