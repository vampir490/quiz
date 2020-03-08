<h1 align="center">Quiz</h1>

A simple quiz to be played through the command line. Very easy to customize. 
A training project as part of Ruby / Ruby on Rails coding bootcamp goodprogrammer.ru. It shows mainly the ability to work with xml, its parsing, the principles of OOP.

Programming language - **Ruby**.
## Requirements
* Ruby 2.6 or higher

## Start to play
The quiz uses the command line. To start playing:
1. Download the repository using the [instruction](https://help.github.com/en/articles/cloning-a-repository).
2. In the command line go to the directory with the files downloaded.
3. Install required gems. To do that:
   1. Check if the bundler is installed with the command `gem list bundler`
      * If it is not installed - installed it with the command `gem install bundler`.
      * If bundler is already installed, that is perfect. Go to the next step.
   2. In the directory with the game, to install all necessary gems run `bundle install`
4. To start playing run 
```console
bundle exec ruby main.rb
```
**It is important** to use `bundle exec` to make the necessary versions of gems to be used.

5. Follow the instructions
## Features and settings
* The quiz contains 5 questions. That can be changed in the constant `NUMBER_OF_QUESTIONS` in the class `Quiz`;
* Default quiz contains 7 very easy questions;
* Use as many possible answers as you want, but not more than 4 is recommended;
* Each question has the limit of time to answer and the weight in points;
* Questions are located in `/data/qustions.xml`. **Important:** to set your questions change the file with question, following the rules:
  * set time to answer and the weight of each question as attributes of "question" tag. Example: 
  ```xml
  <question seconds="30" points="3">
  ```
  * put each possible answer on `<variant>` tag;
  * set the right answer with the attribute `right="true"` in tag `<variant>`. Example:
   ```xml
  <variant right="true">1000</variant>
  ```
  
* To answer put the number of the answer and push **Enter**
* If you spend more time to answer, than it is set in the limit, the game is interrupted
